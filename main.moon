require "lovekit.all"
{graphics: g} = love
export DEBUG = false

make_ball = (physics, x=GAME_CONFIG.viewport_width / 2, y=GAME_CONFIG.viewport_height / 2) ->
  body = love.physics.newBody(
    physics
    x
    y
    "dynamic"
  )

  body\setLinearDamping 5
  body\setAngularDamping 0.5
  shape = love.physics.newCircleShape 4

  fixture = love.physics.newFixture body, shape, 1
  fixture\setRestitution 0.9

  { :body, :shape, :fixture }

make_rect = (physics, x=0, y=0) ->
  body = love.physics.newBody(
    physics
    x
    y
    "dynamic"
  )

  body\setLinearDamping 5
  body\setAngularDamping 0.5
  shape = love.physics.newRectangleShape 10, 10

  fixture = love.physics.newFixture body, shape, 1
  fixture\setRestitution 0.9

  { :body, :shape, :fixture }

class Game
  new: =>
    @viewport = EffectViewport {
      pixel_scale: true
      scale: GAME_CONFIG.scale
    }

    love.physics.setMeter 64
    @physics = love.physics.newWorld 0, 0, true

    @ball = make_ball @physics

    @objects = {
      @ball
      make_ball @physics, 65, 58
      make_rect @physics, 45, 45
      make_rect @physics, 57, 48
      make_rect @physics, 70, 42
    }

  draw: =>
    @viewport\apply!
    g.print "babys first box2d", 10, 10

    for object in *@objects
      t = object.shape\type!
      switch t
        when "CircleShape"
          mode = if object == @ball then "fill" else "line"
          g.circle mode, object.body\getX!, object.body\getY!, object.shape\getRadius!
        when "PolygonShape"
          {:body, :shape} = object
          g.polygon "line", body\getWorldPoints shape\getPoints!
        else
          error "unknown shape: #{t}"

    @viewport\pop!

  update: (dt) =>
    @physics\update dt

    move = CONTROLLER\movement_vector!
    @ball.body\applyForce unpack move*6
    -- @ball.body\applyLinearImpulse unpack move*dt*10

love.load = ->
  export CONTROLLER = Controller GAME_CONFIG.keys, "auto"
  export DISPATCHER = Dispatcher -> Game!
  DISPATCHER\bind love