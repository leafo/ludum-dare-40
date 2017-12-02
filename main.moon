require "lovekit.all"
{graphics: g} = love
export DEBUG = false

import CenterAnchor, VList, Label, RevealLabel, Border from require "lovekit.ui"
import Dialog from require "dialog"
import Cursor from require "cursor"

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
            when "npc"
              world\add_npc object.x, object.y, object.name
            when "box"
              world\add_box object.x, object.y

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
  default_dialog:  {
    default: ->
      say "I have nothing to say to you"
  }

  new: (@opts={}) =>
    @object = assert @opts.object, "missing object"

    dialog = Dialog {
      spec: require("dialogs")[@object.name] or @default_dialog
      object: @object
    }

    @seq = Sequence ->
      wait_until -> dialog\is_done!

      -- just so we don't trigger action immediately
      @entities = DrawList!
      wait_until ->
        not CONTROLLER\is_down("one") and not CONTROLLER\is_down("two")

      @close!

    @content = Border dialog, {
      background: { 30, 30, 30, 200 }
      border: false
      padding: 2
    }

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

  center: =>
    @body\getPosition!

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

  center: =>
    @body\getPosition!

  draw: (mode="line") =>
    g.polygon mode, @body\getWorldPoints @shape\getPoints!

  make_shape: =>
    assert @opts.points, "missing points"
    love.physics.newPolygonShape unpack @opts.points

class PBox extends Polygon
  w: 10
  h: 10
  is_grabbable: true

  draw: (...) =>
    super ...
    g.points @center!

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
  name: "npc"

  is_npc: true

  new: (@opts={}) =>
    @origin_x = @opts.x
    @origin_y = @opts.y
    @name = @opts.name
    super @opts

  center: =>
    @body\getPosition!

  draw: =>
    super!
    x, y = @body\getPosition!

    g.setPointSize 1
    g.points @origin_x, @origin_y

    if @label
      @label\draw!

  update: (dt) =>
    x, y = @body\getPosition!
    dir = Vec2d(@origin_x, @origin_y) - Vec2d(x,y)
    if dir\len! > 1
      @body\applyForce unpack dir*3

    if @world.current_target == @
      @label or= CenterAnchor x, y - @radius*2, RevealLabel @name
    else
      @label = nil

    if @label
      @label\update dt

    -- push them back to origin

class Player extends Ball
  radius: 4

  new: (...) =>
    super ...
    @holding = {}
    @cursors = DrawList!

  draw: =>
    super "fill"

  is_active: =>
    not @world.current_dialog

  update: (dt) =>
    if @is_active!
      move = CONTROLLER\movement_vector!
      @body\applyForce unpack move*6

    -- not used
    -- @ball.body\applyLinearImpulse unpack move*dt*10

    @cursors\update dt

    closest, d = @closest_object!
    @current_closest = closest and d < @radius * 2 and closest

    if @is_active! and CONTROLLER\downed "one"
      if @current_closest
        @interact_with @current_closest
      else
        @drop_everything!

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

    @cursors\add Cursor {
      :object
      radius: 7
      is_active: -> @holding[object]
    }

    @holding[@current_closest] = joint

  drop_everything: =>
    return unless next @holding

    for _, joint in pairs @holding
      joint\destroy!

    @holding = {}

  closest_object: =>
    sx, sy = @body\getPosition!

    local min_dist, min_object

    for object in *@world.objects
      continue if object == @
      continue if object.body\getType! != "dynamic"
      continue if @holding[object]

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

    @objects = {}
    @map = load_map "maps.room", @

  add_player: (x, y) =>
    assert not @player, "player already added"

    @player = Player {
      world: @
      :x, :y
    }

    @viewport\center_on_pt @player\center!
    table.insert @objects, @player

  add_box: (x, y) =>
    table.insert @objects, PBox {
      world: @
      :x, :y
    }

  add_npc: (x,y, name) =>
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
        if @current_target == object
          COLOR\push 255, 100, 100
        else
          COLOR\push 255, 255,255

        object\draw!

        COLOR\pop!

    @entities\draw!

    if @player
      @player.cursors\draw!

    if @current_dialog
      -- undo translate
      g.translate @viewport.x, @viewport.y
      @current_dialog\draw!

    @viewport\pop!

  update: (dt) =>
    px, py = if @current_dialog
      @current_dialog.object\center!
    else
      @player\center!

    @viewport\center_on_pt px, py, @map, dt*2

    @viewport\update dt
    @physics\update dt
    @entities\update dt

    if @current_dialog
      @current_dialog\update dt

    for object in *@objects
      if object.update
        object\update dt

    @current_target = @player and @player.current_closest

love.load = ->
  fonts = {
    default: load_font "images/font2.png",
      [[ abcdefghijklmnopqrstuvwxyz-1234567890!.,:;'"?$&%]]
  }

  g.setFont fonts.default

  export CONTROLLER = Controller GAME_CONFIG.keys, "auto"
  export DISPATCHER = Dispatcher -> Game!
  DISPATCHER\bind love