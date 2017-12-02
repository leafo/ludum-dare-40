require "lovekit.all"
{graphics: g} = love
export DEBUG = false

load_font = (img, chars)->
  font_image = imgfy img
  g.newImageFont font_image.tex, chars


-- load the map into physics
load_map = (mod, world) ->
  map = require mod

  for layer in *map.layers
    switch layer.name
      when "objects"
        for object in *layer.objects
          switch object.type
            when "spawn"
              world\add_player object.x, object.y
            when "dude"
              world\add_npc object.x, object.y, object.name

      when "collide"
        for object in *layer.objects
          continue unless object.shape == "polygon"
          packed = {}
          for {:x, :y} in *object.polygon
            table.insert packed, x
            table.insert packed, y

          world\add_collide_polygon object.x, object.y, packed

  Box(
    0, 0
    map.width * map.tilewidth
    map.height * map.tileheight
  )


class DialogScreen
  new: (@opts={}) =>
    import CenterAnchor, VList, Label, RevealLabel, Border from require "lovekit.ui"

    @seq = Sequence ->
      wait_until -> not CONTROLLER\is_down "one"
      wait_until -> CONTROLLER\is_down "one"
      @close!

    @content = Border(
      VList {
        align: "center"
        Label "how are you doing?"
        RevealLabel "press something, yeah"
      }
      {
        background: { 30, 30, 30, 200 }
        border: false
        padding: 2
      }
    )

    viewport = @opts.world.viewport
    x = viewport.w / 2
    y = viewport.h / 2

    @entities = DrawList!
    @entities\add CenterAnchor x,y, @content

  close: =>
    if @opts.world.current_dialog = @
      @opts.world.current_dialog = nil

  draw: =>
    return unless @layouted
    @entities\draw!

  update: (dt) =>
    @layouted = true
    @entities\update dt
    @seq\update dt

class Cursor
  parts: 3
  radius: 4
  rot: 0
  time: 0

  new: (opts={}) =>
    @object = assert opts.object, "Missing object"
    @radius = opts.radius
    @parts = opts.parts

  draw: =>
    cx, cy = @object\center!

    g.translate cx, cy

    split = math.pi * 2 / @parts
    rot = @rot

    alpha = math.min(1/3, @time) * 3 * 255

    COLOR\push 255, 255, 255, alpha
    g.setPointSize 2

    radius = @radius
    if @time < 1
      radius = radius * cubic_bez 1, 3, 0.5, 1, @time

    for i=0,@parts
      x, y = unpack Vec2d.from_radians(rot) * (radius + math.sin(@time + rot) * radius / 3)

      COLOR\push 0,0,0
      g.points x + 1, y + 1
      COLOR\pop!

      g.points x, y

      rot += split

    COLOR\pop!

  update: (dt) =>
    @time += dt * 2
    @rot += dt * 5
    true

class Ball
  linear_damping: 5
  angular_damping: 5

  new: (opts={}) =>
    {:world, :x, :y, :radius} = opts
    {:physics} = world

    linear_damping = opts.linear_damping
    angular_damping = opts.angular_damping

    @world = world
    @radius = radius

    @body = love.physics.newBody(
      physics
      assert x, "missing x"
      assert y, "missing y"
      "dynamic"
    )

    @body\setLinearDamping @linear_damping
    @body\setAngularDamping @angular_damping
    @shape = love.physics.newCircleShape (assert @radius, "missing radius")

    @fixture = love.physics.newFixture @body, @shape, 1
    @fixture\setRestitution 0.9

  draw: (mode="line")=>
    x,y = @body\getPosition!
    g.circle mode, x, y, @shape\getRadius!

  detach: =>
    error "not yet"

class Polygon
  type: "dynamic"

  new: (@opts={}) =>
    {:world, :x, :y} = @opts
    {:physics} = world

    @world = world
    @type = @opts.type

    @body = love.physics.newBody(
      physics
      assert x, "missing x"
      assert y, "missing y"
      @type
    )

    @body\setLinearDamping 5
    @body\setAngularDamping 5
    @shape = @make_shape!

    @fixture = love.physics.newFixture @body, @shape, 1
    @fixture\setRestitution 0.9

  draw: (mode="line") =>
    g.polygon mode, @body\getWorldPoints @shape\getPoints!

  make_shape: =>
    assert @opts.points, "missing points"
    love.physics.newPolygonShape unpack @opts.points

class PBox extends Polygon
  w: 10
  h: 10
  is_grabbable: true

  make_shape: =>
    {:w, :h} = @opts
    @w = w
    @h = h
    love.physics.newRectangleShape(
      (assert @w, "missing width")
      (assert @h, "missing height")
    )


class Npc extends Ball
  radius: 4
  linear_damping: 20

  is_npc: true

  new: (@opts={}) =>
    @origin_x = @opts.x
    @origin_y = @opts.y
    super @opts

  center: =>
    @body\getPosition!

  draw: =>
    super!
    x, y = @body\getPosition!

    if name = @opts.name
      g.print name, x, y

    g.setPointSize 1
    g.points @origin_x, @origin_y

  update: (dt) =>
    x, y = @body\getPosition!
    dir = Vec2d(@origin_x, @origin_y) - Vec2d(x,y)
    if dir\len! > 1
      @body\applyForce unpack dir*3

    -- push them back to origin

class Player extends Ball
  radius: 4

  new: (...) =>
    super ...
    @jointed = {}

  draw: => super "fill"

  is_active: =>
    not @world.current_dialog

  update: (dt) =>
    if @is_active!
      move = CONTROLLER\movement_vector!
      @body\applyForce unpack move*6

    -- not used
    -- @ball.body\applyLinearImpulse unpack move*dt*10

    closest, d = @closest_object!
    @current_closest = closest and d < @radius * 2 and closest

    if @is_active! and CONTROLLER\downed "one"
      if @current_closest
        @interact_with @current_closest
      else
        @release_joints!

  interact_with: (object) =>
    if object.is_npc
      @world\start_dialog_with object
    elseif object.is_grabbable
      @grab object

  grab: (object) =>
    ax, ay = @body\getPosition!
    bx, by = object.body\getPosition!
    dist = (Vec2d(ax, ay) - Vec2d(bx, by))\len!

    -- joint = love.physics.newWeldJoint @body, @current_closest.body, sx, sy, false
    joint = love.physics.newRopeJoint(
      @body
      @current_closest.body
      ax, ay
      bx, by
      dist*1.01
      true
    )

    print "Created joint"
    @jointed[@current_closest] = joint

  release_joints: =>
    print "Destroying joints"
    return unless next @jointed

    for _, joint in pairs @jointed
      joint\destroy!

    @jointed = {}

  closest_object: =>
    sx, sy = @body\getPosition!

    local min_dist, min_object

    for object in *@world.objects
      continue if object == @
      continue if object.body\getType! != "dynamic"
      continue if @jointed[object]

      t = object.shape\type!

      x,y = object.body\getPosition!

      -- cast a ray toward it
      @world.physics\rayCast sx, sy, x, y, (fixture, x, y) ->
        if fixture != object.fixture
          -- wrong object
          return -1

        dist = (Vec2d(sx, sy) - Vec2d(x,y))\len!
        if not min_dist or dist < min_dist
          min_dist = dist
          min_object = object

        0

    min_object, min_dist

class Game
  new: =>
    @viewport = EffectViewport {
      pixel_scale: true
      scale: GAME_CONFIG.scale
    }

    cx, cy = @viewport\center!

    love.physics.setMeter 64
    @physics = love.physics.newWorld 0, 0, true

    @entities = DrawList!
    @entities\add Cursor {
      parts: 4
      object: {
        center: -> 10, 10
      }
    }

    @objects = {
      PBox {
        world: @
        x: 65
        y: 58
      }

      PBox {
        world: @
        x: 45
        y: 45
      }

      PBox {
        world: @
        x: 57
        y: 48
      }

      PBox {
        world: @
        x: 70
        y: 42
      }
    }

    @map = load_map "maps.room", @

    -- thing = @objects[2]
    -- love.physics.newRopeJoint @ball.body, thing.body, cx, cy, 65, 58, 20

  add_player: (x, y) =>
    assert not @player, "player already added"

    @player = Player {
      world: @
      :x, :y
    }
    table.insert @objects, @player

  add_npc: (x,y, name) =>
    print "Adding NPC"
    table.insert @objects, Npc {
      :name
      :x, :y
      world: @
    }

  add_collide_polygon: (x, y, points) =>
    table.insert @objects, Polygon {
      type: "static"
      world: @
      :x, :y
      :points
    }

  start_dialog_with: (object) =>
    @current_dialog = DialogScreen {
      world: @
      object: object
    }

  draw: =>
    g.setLineStyle "rough"

    @viewport\apply!

    for object in *@objects
      if object.draw
        if @player.current_closest == object
          COLOR\push 255, 100, 100
        else
          COLOR\push 255, 255,255

        object\draw!

        COLOR\pop!

    @entities\draw!

    if @current_dialog
      -- undo translate
      g.translate @viewport.x, @viewport.y
      @current_dialog\draw!

    @viewport\pop!

  update: (dt) =>
    px, py = @player.body\getPosition!
    @viewport\center_on_pt px, py, @map, dt*2

    @viewport\update dt
    @physics\update dt
    @entities\update dt

    if @current_dialog
      @current_dialog\update dt

    for object in *@objects
      if object.update
        object\update dt


love.load = ->
  fonts = {
    default: load_font "images/font.png",
      [[ abcdefghijklmnopqrstuvwxyz-1234567890!.,:;'"?$&%]]
  }

  g.setFont fonts.default

  export CONTROLLER = Controller GAME_CONFIG.keys, "auto"
  export DISPATCHER = Dispatcher -> Game!
  DISPATCHER\bind love