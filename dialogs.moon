{
  diary: {
    default: =>
      say "It's a good day to relax"
      ask "What would you like to see", {
        {"Show me my friends", ->
        }
        {"Show me my places", ->
        }
      }

    intro: =>
  }
  dude: {
    default: =>
      ask "What do you want out of life?", {
        {"A new car", ->
          say "Me too"
        }
        {"Happineess", ->
          say "Well isn't that endearing..."
        }
      }

    grab_box: =>
      ask "What are you doing touching my boxes?", {
        {"Sorry"}
        {"Chill out bucko'"}
      }
  }
  dude2: {
    default: => say "Bring me boxes please"
  }
}
