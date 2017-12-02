

import Dialog from require "dialog"

d = Dialog {
  spec: {
    default: =>
      print "before...", @
      say "What's going on there friend?"
      ask "What burger do you like?"
      print "after"
  }

}

require("moon").p d.thread!
require("moon").p d.thread!

