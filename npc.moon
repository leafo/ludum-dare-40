{graphics: g} = love
import CenterAnchor, RevealLabel, Border from require "lovekit.ui"
import Ball from require "ball"

WHITE = {255,255,255}
BLACK = {0,0,0}

RED = {255,100,100}
BLUE = {100,100,255}
GREEN = {100,255,100}

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

    eye_direction = Vec2d.from_radians love.timer.getTime! * 3
    eye_pos = eye_direction * 3

    @draw_balls {
      {0,0,0,  4, WHITE}
      {0,-4,0, 4, WHITE}

      {eye_pos[1], -5, eye_pos[2], 2, BLACK} -- eye
    }, scale: 1.3

    if @label
      @label\draw!

  update: (dt) =>
    x, y = @body\getPosition!
    dir = Vec2d(@origin_x, @origin_y) - Vec2d(x,y)
    if dir\len! > 1
      @body\applyForce unpack dir*3

    if @world.current_target == @
      @label or= CenterAnchor(
        x, y - @radius*5
        Border RevealLabel(@name), {
          background: { 30, 30, 30, 200 }
          border: false
          padding: 2
        }
      )
    else
      @label = nil

    if @label
      @label\update dt


{:Npc}
