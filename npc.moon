{graphics: g} = love
import CenterAnchor, RevealLabel, Border from require "lovekit.ui"
import Ball from require "ball"

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

  allowed_grab: =>
    if @has_dialog_tree "grab_box"
      @world\start_dialog_with @, "grab_box"
      return false

    true

  center: =>
    @body\getPosition!

  has_dialog_tree: (name) =>
    spec = @get_dialog_spec!
    spec and spec[name]

  get_dialog_spec: =>
    require("dialogs")[@name]

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


{:Npc}
