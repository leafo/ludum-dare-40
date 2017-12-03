
{graphics: g} = love

import Ball from require "ball"
import Cursor from require "cursor"

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

{:Player}
