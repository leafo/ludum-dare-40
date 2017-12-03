{
  diary: {
    default: =>
      say "It's a good day to relax"
      ask "What would you like to see", {
        {"Show me my friends", ->
          say "It doesn't look like you have any friends."
          say "Well, except for me"
          say "Come back after you've met some people."
        }
        {"Show me my places", ->
          say "You haven't visited anywhere but your room yet."
          say "Go get out there! Come back after you've visited some places."
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
        {"Happiness", ->
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
