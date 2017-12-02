require "lovekit.all"
{graphics: g} = love
export DEBUG = false

class Game
  new: =>
    @viewport = EffectViewport {
      pixel_scale: true
      scale: GAME_CONFIG.scale
    }

  draw: =>
    @viewport\apply!
    g.print "hello, it's me... \n\nyour' garbage game", 10, 10
    @viewport\pop!

  update: (dt) =>

love.load = ->
  export DISPATCHER = Dispatcher -> Game!
  DISPATCHER\bind love