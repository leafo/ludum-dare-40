
{graphics: g} = love

import Ball from require "ball"
import Cursor from require "cursor"

class Player extends Ball
  radius: 4
  stride_target: 0
  stride_speed: 1
  stride: 0

  new: (...) =>
    super ...
    @holding = {}
    @cursors = DrawList!
    @entities = DrawList!

    @facing = Vec2d 0, 1
    @smooth_facing = @facing


    @entities\add Sequence ->
      while true
        wait_until -> CONTROLLER\movement_vector!\is_zero!
        @stride_speed = 2

        wait_until -> @is_active!
        wait_until -> not CONTROLLER\movement_vector!\is_zero!

        @stride_speed = 5

        @flip_foot = not @flip_foot
        @last_move_time = love.timer.getTime!

    @entities\add Sequence ->
      while true
        wait_until ->
          @is_active and not CONTROLLER\movement_vector!\is_zero!

        AUDIO\play "step"
        wait 0.25

  draw: =>
    x,y = @body\getPosition!

    eye_size = 2
    eye_protrusion = 4

    facing = @smooth_facing
    -- the balls that make up yr body
    -- {x,y,z, radius, color}
    balls = {
      -- the player's body
      {0,0,0, @radius, WHITE}
    }

    for i=-1,2,2
      eye_dir = facing\rotate math.pi / 6 * i

      eyeball = eye_dir * eye_protrusion * 0.9

      for b in *@make_pupil eye_dir, eye_size, eye_protrusion
        table.insert balls, b

      -- eyeball thing
      table.insert balls, {
        eyeball[1]
        -3
        eyeball[2]
        eye_size + 1
        WHITE
      }

    speed = math.sqrt(Vec2d(@body\getLinearVelocity!)\len!) / 10

    leg_t = if @last_move_time
      love.timer.getTime! - @last_move_time
    else
      0

    table.insert balls, @make_leg 3, 6, math.sin(
      (@flip_foot and math.pi or 0) + leg_t * 12
    ) * @stride

    table.insert balls, @make_leg -3, 6, math.sin(
      (@flip_foot and 0 or math.pi) + leg_t * 12
    ) * @stride

    @draw_balls balls, scale: 1.3

  make_pupil: (eye_dir, radius, protrusion) =>
    pupil = eye_dir * protrusion

    l = pupil\rotate(0.1) * 1.2
    r = pupil\rotate(-0.1) * 1.2

    {
      {
        pupil[1]
        -3
        pupil[2]
        radius
        BLACK
      }

      {
        l[1]
        -3
        l[2]
        radius * 2/3
        BLACK
      }

      {
        r[1]
        -3
        r[2]
        radius * 2/3
        BLACK
      }
    }


  make_leg: (r, stride, t) =>
    facing = @smooth_facing
    joint = facing\cross! * r -- the origin of the leg on the body 
    -- now move ball along joint according to t
    pos = joint + t*stride*facing

    { pos[1], 0, pos[2], 3, {255,255,255} }

  is_active: =>
    not @world.current_dialog and not @world.lock_movement

  update: (dt) =>
    move = if @is_active!
      CONTROLLER\movement_vector!
    else
      Vec2d 0, 0

    @stride_target = move\len!

    unless move\is_zero!
      @facing = move\normalized!
      @body\applyForce unpack move*6

    @smooth_facing = @smooth_facing\merge_angle @facing, dt*10
    @stride = smooth_approach @stride, @stride_target, @stride_speed * dt

    @cursors\update dt
    @entities\update dt

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
      if object\test_grab!
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

{:Player}
