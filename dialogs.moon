{
  diary: {
    default: =>
      say "It's a good day to relax"
      ask "What would you like to see", {
        {"Show me my friends", ->
          say "It doesn't look like you have any friends."
          say "Well, except for me"
        }
        {"What are these boxes?", ->
          say "I don't know, you can drag them around I guess"
        }
        {"Nothing..."}
      }

    intro: =>
  }
  dude: {
    default: =>
      state = @state
      state.counter or= 1

      switch @world.name
        when "beach"
          say "Do you ever wonder if it's night or day?"
        else
          switch state.counter
            when 1
              say "I work at the docks here"
              say "I move these boxes around when I'm not relaxing"
            when 2
              ask "What do you want out of life?", {
                {"A TV", ->
                  say "Me too"
                }
                {"Happiness", ->
                  say "Well isn't that endearing..."
                }
              }
            else
              say "I live with Zoosma"
              say "You should say hi sometime"

          state.counter += 1

    grab_box: =>
      ask "What are you doing touching my boxes?", {
        {"Sorry"}
        {"I thought they were mine", ->
          say "Boxes aren't for everyone"
        }
      }
  }

  stranger: {
    default: =>
      state = @state

      switch @world.name
        when "beach"
          state.beach_counter or= 1
          switch (state.beach_counter - 1) % 2
            when 0
              say "Shells, sticks, starfish..."
              say "I eat things I find on the ground"
              say "Not the most respectable, but I like it"
            when 1
              say "That's my surfboard on the other side of the beach"
              say "..."
              say "Just kidding"
              say "I'm a turtle"

          state.beach_counter += 1
        else
          state.counter or= 1
          switch (state.counter - 1) % 2
            when 0
              say "I'm more like a turtle than a dog"
              say "But I can do a good dog impersonation"
              say "Arf.. arf.."
            when 1
              say "I like to pickup sticks at the beach"
              say "Despite being turtle-like"

          state.counter += 1
  }

  dude2: {
    default: =>
      state = @state

      switch @world.name
        when "store"
          state.store_counter or= 1
          switch (state.store_counter - 1) % 2
            when 0
              say "My wares are top notch"
            when 1
              say "I like to hang out at the beach"
              say "See you there sometime"

          state.store_counter += 1
        when "beach"
          state.beach_counter or= 1
          switch (state.beach_counter - 1) % 2
            when 0
              say "I can't hear the ocean, but at least it's beautiful"
            when 1
              say "Do you ever just hear music?"
              say "You know, in the background of your life"
          state.beach_counter += 1
        else
          say "I'm bored"
  }

  talldude: {
    default: =>
      switch @world.name
        when "house"
          say "This is my house."
          ask "Do you like it?", {
            {"It's okay", ->
              say "Yeah, well yours isn't that great either"
            }
            {"Great couch", ->
              say "Thanks"
            }
          }
        when "beach"
          say "It's not my couch, but it will do"
        else
          say "I'm not really sure about most things"

  }
}
