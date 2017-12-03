{graphics: g} = love

BLACK = {0,0,0}

-- a character base
class Ball
  linear_damping: 5
  angular_damping: 5

  canvas_size: 128 -- should be divisible by 2

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

  -- {x,y,z, radius, color}
  draw_balls: (balls, opts={}) =>
    -- fix depth
    table.sort balls, (a, b) ->
      {ax, ay, az} = a
      {bx, by, bz} = b

      az - ay / 2 < bz - by / 2
      -- (a[2] + a[3] / 2) < (a[2] + b[3] / 2)

    @draw_balls_static balls, opts

  -- this is buggy, no time to fix
  draw_balls_canvas: (balls, opts) =>
    old_canvas = g.getCanvas!
    canvas = @get_canvas!
    do
      g.setCanvas canvas
      g.clear()

      g.push!
      g.origin!

      -- put origin in center of canvas
      g.translate @canvas_size / 2, @canvas_size / 2

      if s = opts.scale
        g.scale s, s

      for {x,y,z, radius, color} in *balls
        COLOR\push unpack color
        g.circle "fill", x, y + z / 2, radius
        COLOR\pop!

      g.pop!

    if old_canvas
      g.setCanvas old_canvas
    else
      g.setCanvas!

    -- TODO: draw the outline

    -- now draw the canvas
    g.push!
    g.translate @center!
    g.setBlendMode "alpha", "premultiplied"
    g.draw canvas, -@canvas_size / 2, -@canvas_size /2
    g.draw canvas, 0, 0
    g.setBlendMode "alpha"
    g.pop!

  -- don't use canvas
  draw_balls_static: (balls, opts={}) =>
    g.push!

    g.translate @center!

    if s = opts.scale
      g.scale s, s

    -- draw the outline
    COLOR\push unpack BLACK
    for ox=-1,1,2
      for oy=-1,1,2
        for {x,y,z, radius, color} in *balls
          g.circle "fill", (ox * 2 / 3) + x, (oy * 2 / 3) + y + z / 2, radius

    COLOR\pop!

    -- draw the actual character
    for {x,y,z, radius, color} in *balls
      COLOR\push unpack color
      g.circle "fill", x, y + z / 2, radius
      COLOR\pop!

    g.pop!

  get_canvas: =>
    unless @canvas
      @canvas = g.newCanvas @canvas_size, @canvas_size
      @canvas\setFilter "nearest", "nearest"

    @canvas

  center: =>
    @body\getPosition!


{:Ball}
