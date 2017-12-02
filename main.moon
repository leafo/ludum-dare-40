require "lovekit.all"
{graphics: g} = love
export DEBUG = false

load_font = (img, chars)->
  font_image = imgfy img
  g.newImageFont font_image.tex, chars

class Ball
  new: (opts={}) =>
    {:world, :x, :y, :radius} = opts
    {:physics} = world

    @world = world
    @radius = radius

    @body = love.physics.newBody(
      physics
      assert x, "missing x"
      assert y, "missing y"
      "dynamic"
    )

    @body\setLinearDamping 5
    @body\setAngularDamping 0.5
    @shape = love.physics.newCircleShape (assert @radius, "missing radius")

    @fixture = love.physics.newFixture @body, @shape, 1
    @fixture\setRestitution 0.9

  draw: (mode="line")=>
    x,y = @body\getPosition!
    g.circle mode, x, y, @shape\getRadius!

  detach: =>
    error "not yet"

class Box
  w: 10
  h: 10

  new: (opts={}) =>
    {:world, :x, :y, :w, :h} = opts
    {:physics} = world

    @world = world
    @w = w
    @h = h

    @body = love.physics.newBody(
      physics
      assert x, "missing x"
      assert y, "missing y"
      "dynamic"
    )

    @body\setLinearDamping 5
    @body\setAngularDamping 5
    @shape = love.physics.newRectangleShape(
      (assert @w, "missing width")
      (assert @h, "missing height")
    )

    @fixture = love.physics.newFixture @body, @shape, 1
    @fixture\setRestitution 0.9

  draw: (mode="line") =>
    g.polygon mode, @body\getWorldPoints @shape\getPoints!


class Npc extends Ball
  radius: 4
  draw: =>
    super!
    x, y = @body\getPosition!
    g.print "dude", x, y

class Player extends Ball
  radius: 4

  new: (...) =>
    super ...
    @jointed = {}

  draw: => super "fill"

  update: (dt) =>
    move = CONTROLLER\movement_vector!
    @body\applyForce unpack move*6

    -- not used
    -- @ball.body\applyLinearImpulse unpack move*dt*10

    closest, d = @closest_object!
    @current_closest = closest and d < @radius * 2 and closest

    if CONTROLLER\downed "one"
      if @current_closest
        -- create a joint
        ax, ay = @body\getPosition!
        bx, by = @current_closest.body\getPosition!
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

        print "Created joint"
        @jointed[@current_closest] = joint
      else
        @release_joints!

      print "closest", d

  release_joints: =>
    print "Destroying joints"
    return unless next @jointed

    for _, joint in pairs @jointed
      joint\destroy!

    @jointed = {}

  closest_object: =>
    sx, sy = @body\getPosition!

    local min_dist, min_object

    for object in *@world.objects
      continue if object == @
      continue if @jointed[object]

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

class Game
  new: =>
    @viewport = EffectViewport {
      pixel_scale: true
      scale: GAME_CONFIG.scale
    }

    cx, cy = @viewport\center!

    love.physics.setMeter 64
    @physics = love.physics.newWorld 0, 0, true

    @player = Player {
      world: @
      x: cx
      y: cy

    }

    @objects = {
      @player

      Npc {
        world: @
        x: 15
        y: cy
      }

      Box {
        world: @
        x: 65
        y: 58
      }

      Box {
        world: @
        x: 45
        y: 45
      }

      Box {
        world: @
        x: 57
        y: 48
      }

      Box {
        world: @
        x: 70
        y: 42
      }
    }

    -- thing = @objects[2]
    -- love.physics.newRopeJoint @ball.body, thing.body, cx, cy, 65, 58, 20

  draw: =>
    g.setLineStyle "rough"

    @viewport\apply!
    -- g.print "babys first box2d", 10, 10

    for object in *@objects
      if object.draw
        if @player.current_closest == object
          COLOR\push 255, 100, 100
        else
          COLOR\push 255, 255,255

        object\draw!

        COLOR\pop!

    @viewport\pop!

  update: (dt) =>
    @physics\update dt

    for object in *@objects
      if object.update
        object\update dt


love.load = ->
  fonts = {
    default: load_font "images/font.png",
      [[ abcdefghijklmnopqrstuvwxyz-1234567890!.,:;'"?$&%]]
  }

  g.setFont fonts.default

  export CONTROLLER = Controller GAME_CONFIG.keys, "auto"
  export DISPATCHER = Dispatcher -> Game!
  DISPATCHER\bind love