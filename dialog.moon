
import VList, HList, RevealLabel, Label from require "lovekit.ui"

scope = setmetatable {
  say: (message) ->
    coroutine.yield {"say", message}

  ask: (message, choices) ->
    coroutine.yield {"say", message, { wait_for_tap: false }}
    response = coroutine.yield {"select", [t[1] for t in *choices]}

    if t = choices[response]
      t[2]!

}, __index: _G

class Dialog extends VList
  @scope: scope

  new: (opts={}) =>
    super {
      align: "center"
    }

    spec = assert opts.spec, "missing spec"
    entry_point = opts.entry_point or "default"

    fn = assert spec[entry_point], "failed to find entry point for conversation"
    setfenv fn, scope
    @thread = coroutine.wrap fn

    @seq = Sequence ->
      wait_for_tap = ->
        wait 0.1
        wait_until -> not CONTROLLER\is_down "one"
        wait_until -> CONTROLLER\is_down "one"

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

            @items = { label }

            wait_until ->
              if CONTROLLER\downed "one"
                label.rate /= 100

              revealed

            unless opts and opts.wait_for_tap == false
              wait_for_tap!

          when "select"
            choices = ...
            selected = 1

            make_choice = (label, idx) ->
              HList {
                yalign: "center"

                with Box 0, 0, 5,5
                  .draw = =>
                    if selected == idx
                      Box.draw @
                    else
                      Box.outline @

                Label label\lower!
              }

            table.insert @items, HList [make_choice c, idx for idx, c in ipairs choices]
            wait_for_tap!
          else
            print "unhandled action", name

      action = @.thread opts.object, @ -- kick it off with object

      while action
        dispatch_action unpack action
        action = @.thread!

  is_done: =>
    @seq\is_dead!

  update: (dt) =>
    super dt
    @seq\update dt

{:Dialog}
