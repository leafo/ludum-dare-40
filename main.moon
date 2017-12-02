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

-- class Viewport extends EffectViewport

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

  new: (@opts={}) =>
    @origin_x = @opts.x
    @origin_y = @opts.y
    super @opts

  draw: =>
    super!
    x, y = @body\getPosition!

    if name = @opts.name
      g.print name, x, y

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

  update: (dt) =>
    move = CONTROLLER\movement_vector!
    @body\applyForce unpack move*6

    -- not used
    -- @ball.body\applyLinearImpulse unpack move*dt*10

    closest, d = @closest_object!
    @current_closest = closest and d < @radius * 2 and closest

    if CONTROLLER\downed "one"
      if @current_closest
        -- create a joint
        ax, ay = @body\getPosition!
        bx, by = @current_closest.body\getPosition!
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
      else
        @release_joints!

      print "closest", d

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

  draw: =>
    g.setLineStyle "rough"

    @viewport\apply!
    -- g.print "babys first box2d", 10, 10

    for object in *@objects
      if object.draw
        if @player.current_closest == object
          COLOR\push 255, 100, 100
        else
          COLOR\push 255, 255,255

        object\draw!

        COLOR\pop!

    @viewport\pop!

  update: (dt) =>
    px, py = @player.body\getPosition!
    @viewport\center_on_pt px, py, @map, dt*2

    @viewport\update dt
    @physics\update dt

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