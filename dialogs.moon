{
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
  }
  dude2: {
    default: => say "Bring me boxes please"
  }
}
