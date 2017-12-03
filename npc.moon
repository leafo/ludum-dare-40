{graphics: g} = love
import CenterAnchor, RevealLabel, Border from require "lovekit.ui"
import Ball from require "ball"

DEG30 = math.pi / 6

class Npc extends Ball
  radius: 4
  linear_damping: 20
  name: "npc"
  time: 0

  is_npc: true

  new: (@opts={}) =>
    @origin_x = @opts.x
    @origin_y = @opts.y
    @name = @opts.name
    @time_offset = love.math.random! * math.pi * 2

    @facing = Vec2d 0, 1
    @default_facing_rad = @facing\radians!
    @smooth_facing = @facing

    @seq = Sequence ->
      while true
        wait 1.0 + love.math.random!
        @default_facing_rad = love.math.random! * math.pi

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
    if balls = @get_body_balls!
      @draw_balls balls, scale: 1.3, outline_eyes: true
    else
      @draw_node!

    if @label
      @label\draw!

  -- balls that make up the body
  get_body_balls: =>
    eye_direction = @smooth_facing
    eye_pos = eye_direction * 3

    {
      {0,0,0,  4, WHITE}
      {0,-4,0, 4, WHITE}

      {eye_pos[1], -5, eye_pos[2], 2, BLACK} -- eye
    }

  -- if it's not a balls, just add the node
  draw_node: =>
    Ball.draw @
    g.setPointSize 1
    g.points @origin_x, @origin_y

  update: (dt) =>
    @time += dt
    x, y = @body\getPosition!

    @seq\update dt

    -- push them back to their origin
    dir = Vec2d(@origin_x, @origin_y) - Vec2d(x,y)
    if dir\len! > 1
      @body\applyForce unpack dir*3

    if @world.player
      to_player = Vec2d(@world.player\center!) - Vec2d(x,y)
      local facing
      if to_player\len! < 40
        -- abs makes it always look down
        facing = math.abs to_player\normalized!\radians!
        facing = math.min math.pi - DEG30, math.max DEG30, facing
      else
        facing = @default_facing_rad

      -- wobble with me
      facing += math.sin(@time_offset + @time * 3) * DEG30/3
      @facing = Vec2d.from_radians facing

    @smooth_facing = @smooth_facing\merge_angle @facing, dt*10

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
