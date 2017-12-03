{graphics: g} = love

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


{:Ball}
