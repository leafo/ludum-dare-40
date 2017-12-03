
class Map extends Box
  new: (opts={}) =>
    @world = assert opts.world, "missing world"
    @images = {}

    map = require assert(opts.module, "missing module")
    super 0,0, map.width * map.tilewidth, map.height * map.tileheight
    @add_layers map.layers

  update: (dt) =>

  draw: =>
    for image in *@images
      image.image\draw image.x, image.y

  add_layers: (layers) =>
    for layer in *layers
      switch layer.name
        when "objects"
          @add_object_layer layer
        when "collide"
          @add_collide_layer layer
        when "background"
          -- cool hack
          fname = assert layer.image\match("([^/]+)$"), "failed to get file name"
          table.insert @images, {
            x: layer.offsetx or 0
            y: layer.offsety or 0
            image: imgfy "images/#{fname}"
          }

  add_object_layer: (layer) =>
    for object in *layer.objects
      switch object.type
        when "spawn"
          @world\add_player object.x, object.y
        when "npc"
          @world\add_npc object.x, object.y, object.name
        when "portal"
          @world\add_portal {
            x: object.x
            y: object.y
            w: object.width
            h: object.height
            destination: object.properties.map
          }
        when "box"
          owner = (object.properties or {}).owner
          @world\add_box object.x, object.y, owner

  add_collide_layer: (layer) =>
    for object in *layer.objects
      continue unless object.shape == "polygon"
      packed = {}
      for {:x, :y} in *object.polygon
        table.insert packed, x
        table.insert packed, y

      @world\add_collide_polygon object.x, object.y, packed

{:Map}

