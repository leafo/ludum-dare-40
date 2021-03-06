require "lovekit.all"
{graphics: g} = love
export DEBUG = false

import CenterAnchor, VList, Label, RevealLabel, Border from require "lovekit.ui"
import Dialog from require "dialog"

import Ball from require "ball"
import Player from require "player"
import Map from require "map"
import Npc from require "npc"

export DEFAULT_COLOR = {255,255,255}
export HIGHLIGHT = {120, 255, 100}
export DIALOG_BG = { 30, 30, 30, 220 }

export WHITE = {255,255,255}
export BLACK = {0,0,0}

export RED = {255,100,100}
export BLUE = {100,100,255}
export GREEN = {100,255,100}


load_font = (img, chars)->
  font_image = imgfy img
  g.newImageFont font_image.tex, chars

class SweepTransition extends Sequence
  time: 0.8

  new: (@before, @after) =>
    @p = 0
    super ->
      return unless @before and @after
      tween @, @time, p: 1.0

  update: (dt) =>
    @after\update dt
    @after.lock_movement = @p < 0.5
    super dt

  draw: =>
    height = g.getHeight!

    @before.viewport.canvas_offset_y = -@p * height
    @after.viewport.canvas_offset_y = -@p * height + height

    @before\draw!
    @after\draw!


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
      entry_point: @opts.entry_point
    }

    @seq = Sequence ->
      wait_until -> dialog\is_done!

      -- just so we don't trigger action immediately
      @entities = DrawList!

      wait_until ->
        not CONTROLLER\is_down("one") and not CONTROLLER\is_down("two")

      @close!

    @content = Border dialog, {
      background: DIALOG_BG
      border: {120,120,120}
      padding: 4
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
    @hidden = @opts.hidden

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

  npc_owner: =>
    @world.npcs[@opts.owner_name]

  test_grab: =>
    if owner = @npc_owner!
      owner\allowed_grab @
    else
      true

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

class Portal extends Box
  new: (opts={}) =>
    @w = opts.w
    @h = opts.h
    @x = opts.x
    @y = opts.y

    @destination = opts.destination
    @dialog = opts.dialog

    @world = assert opts.world, "missing world"

    @seq = Sequence ->
      while true
        wait_until -> not @touches_pt @world.player\center!
        wait_until -> @touches_pt @world.player\center!
        if @dialog
          print "show dialog: #{@dialog}"
        elseif @destination
          if @destination == "exit"
            love.event.push "quit"
          else
            @world\travel_to @destination

  draw: =>
    return unless DEBUG
    @outline {100, 255,255}

  update: (dt) =>
    @seq\update dt

-- contains a map, objects on map, and any state
class World
  new: (opts={}) =>
    @viewport = EffectViewport {
      pixel_scale: true
      crop: true
      scale: GAME_CONFIG.scale
    }

    @name = assert opts.name, "world: missing name"
    @game = assert opts.game, "world: missing game"

    cx, cy = @viewport\center!
    @physics = love.physics.newWorld 0, 0, true

    @entities = DrawList!

    @objects = {}
    @portals = {}
    @npcs = {}

    @map = Map {
      world: @
      module: assert opts.map, "missing map"
    }

    assert @player, "woops, no player spawned"

  on_show: =>
    switch @name
      when "town", "beach"
        unless AUDIO.current_music == "town"
          AUDIO\play_music "town"
      when "room", "house", "store"
        unless AUDIO.current_music == "room"
          AUDIO\play_music "room"
      when "intro"
        label1 = RevealLabel "use gamepad or arrows move", {
          fixed_size: true
          max_width: 160
        }

        label2 = RevealLabel "x or button 1 to confirm", {
          fixed_size: true
          max_width: 160
        }


        @entities\add VList {
          padding: 0
          Border label1, {
            padding: 2
            background: DIALOG_BG
            border: false
          }
          Border label2, {
            padding: 2
            background: DIALOG_BG
            border: false
          }
        }


  on_hide: =>
    if @player
      @player\drop_everything!

  travel_to: (map_name) =>
    assert map_name, "no map name provided to travel to"
    print "Going to", map_name
    next_world = @game\get_world map_name
    next_world\place_player @name, @player.smooth_facing

    DISPATCHER\replace next_world

  -- place player on portal
  place_player: (source_portal, direction) =>
    for portal in *@portals
      if portal.destination == source_portal
        @player.body\setPosition portal\center!
        @player.body\setLinearVelocity 0, 0

        if direction
          @player.facing = direction
          @player.smooth_facing = direction

        px, py = @player\center!
        @viewport\center_on_pt px, py, @map

  add_portal: (p) =>
    p.world = @
    table.insert @portals, Portal p

  add_player: (x, y) =>
    assert not @player, "player already added"

    @player = Player {
      world: @
      :x, :y
    }

    @viewport\center_on_pt @player\center!
    table.insert @objects, @player

  add_box: (x, y, owner) =>
    table.insert @objects, PBox {
      world: @
      owner_name: owner
      :x, :y
    }

  add_npc: (x,y, name) =>
    npc = Npc {
      :name
      :x, :y
      world: @
    }
    @npcs[name] = npc
    table.insert @objects, npc

  add_collide_polygon: (x, y, points) =>
    table.insert @objects, Polygon {
      type: "static"
      hidden: true
      world: @
      :x, :y
      :points
    }

  start_dialog_with: (object, entry_point) =>
    @current_dialog = DialogScreen {
      world: @
      object: object
      :entry_point
    }

  draw: =>
    g.setLineStyle "rough"

    @viewport\apply!

    @map\draw!

    table.sort @objects, (a, b) ->
      atype = a.body\getType!
      btype = a.body\getType!

      if atype == btype
        ax, ay = a.body\getPosition!
        bx, by = b.body\getPosition!
        ay < by
      else
        atype = "static"

    for object in *@objects
      continue if object.hidden

      if object.draw
        if @current_target == object
          COLOR\push HIGHLIGHT
        else
          COLOR\push DEFAULT_COLOR

        object\draw!

        COLOR\pop!

    @entities\draw!

    for portal in *@portals
      portal\draw!

    if @player and @player\is_active!
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

    @map\update dt
    @viewport\update dt
    @physics\update dt
    @entities\update dt

    for portal in *@portals
      portal\update dt

    if @current_dialog
      @current_dialog\update dt

    for object in *@objects
      if object.update
        object\update dt

    @current_target = @player and @player.current_closest


class Game
  new: =>
    @worlds = {}
    @state = {}

  get_world: (name) =>
    unless @worlds[name]
      @worlds[name] = World {
        :name
        game: @
        map: "maps.#{name}"
      }

    @worlds[name]

love.load = ->
  fonts = {
    default: load_font "images/font2.png",
      [[ abcdefghijklmnopqrstuvwxyz-1234567890!.,:;'"?$&%]]
  }

  love.physics.setMeter 64
  g.setFont fonts.default

  game = Game!

  export AUDIO = Audio "sound"

  AUDIO\preload {
    "step"
  }

  s = AUDIO\get_source "step"
  s\setVolume 0.1

  export CONTROLLER = Controller GAME_CONFIG.keys, "auto"
  export DISPATCHER = Dispatcher -> game\get_world "intro"
  DISPATCHER.default_transition = SweepTransition

  DISPATCHER\bind love