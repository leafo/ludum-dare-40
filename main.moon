require "lovekit.all"
{graphics: g} = love
export DEBUG = false

import CenterAnchor, VList, Label, RevealLabel, Border from require "lovekit.ui"
import Dialog from require "dialog"
import Cursor from require "cursor"

import Ball from require "ball"
import Player from require "player"

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