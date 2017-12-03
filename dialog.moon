
import VList, HList, RevealLabel, Label from require "lovekit.ui"
import Cursor from require "cursor"

scope = setmetatable {
  say: (message) ->
    coroutine.yield {"say", message}

  ask: (message, choices) ->
    coroutine.yield {"say", message, { wait_for_tap: false }}
    response = coroutine.yield {"select", [t[1] for t in *choices]}

    if t = choices[response]
      if fn = t[2]
        fn!

}, __index: _G

class ChoiceTick extends Box
  x: 0
  y: 0
  w: 4
  h: 4

  new: (opts={}) =>
    @is_selected = opts.is_selected

  is_selected: => false

  update: (dt) =>
    if @is_selected!
      @cursor or= Cursor {
        object: @
        radius: 4
      }
      @cursor\update dt
    else
      @cursor = nil

  draw: =>
    if @is_selected!
      super!
      @cursor\draw! if @cursor
    else
      super.outline @

class Dialog extends VList
  @scope: scope

  new: (opts={}) =>
    super {
      align: "center"
    }

    object = opts.object

    spec = assert opts.spec, "missing spec"
    entry_point = opts.entry_point or "default"

    fn = assert spec[entry_point], "failed to find entry point for conversation"
    setfenv fn, scope
    @thread = coroutine.wrap fn

    @seq = Sequence ->
      wait_for_tap = (button="one")->
        wait 0.1
        wait_until -> not CONTROLLER\is_down button
        wait_until -> CONTROLLER\is_down button

      -- wait for one of the buttons to be pressed after not being pressed
      wait_for_controller = (...) ->
        buttons = {...}
        fns = for button in *buttons
          ->
            wait_until -> not CONTROLLER\is_down button
            wait_until -> CONTROLLER\is_down button
            true

        idx = wait_for_one unpack fns
        buttons[idx]

      dispatch_action = (name, ...) ->
        switch name
          when "say"
            msg, opts = ...
            revealed = false

            label = RevealLabel assert(msg, "missing message")\lower!, nil, nil, {
              fixed_size: true
              max_width: 160
              -> revealed = true
            }

            @items = { Label(object.name), label }

            wait_for_one(
              ->
                wait_until -> not CONTROLLER\is_down "one"
                wait_until -> CONTROLLER\is_down "one"
                label.rate /= 100

              ->
                wait_until -> revealed
            )

            unless opts and opts.wait_for_tap == false
              wait_for_tap!

          when "select"
            choices = ...
            selected = 1

            make_choice = (label, idx) ->
              HList {
                yalign: "center"

                ChoiceTick is_selected: => selected == idx
                Label label\lower!
              }

            table.insert @items, HList [make_choice c, idx for idx, c in ipairs choices]
            wait 0.2 -- don't let them skip by accident without reading

            while true
              switch wait_for_controller "left", "right", "one", "two"
                when "left"
                  selected -= 1
                  if selected <= 0
                    selected += #choices

                when "right"
                  selected += 1
                  if selected > #choices
                    selected -= #choices

                when "one", "two"
                  break
            
            return selected
          else
            print "unhandled action", name

        return

      action = @.thread opts.object, @ -- kick it off with object

      while action
        res = dispatch_action unpack action

        action = if res
          @.thread res
        else
          @.thread!

  is_done: =>
    @seq\is_dead!

  update: (dt) =>
    super dt
    @seq\update dt

{:Dialog}
