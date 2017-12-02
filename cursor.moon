{graphics: g} = love

class Cursor
  parts: 4
  radius: 4
  rot: 0
  time: 0

  new: (opts={}) =>
    @object = assert opts.object, "Missing object"
    @radius = opts.radius
    @parts = opts.parts
    @is_active = opts.is_active

  draw: =>
    cx, cy = @object\center!

    g.push!
    g.translate cx, cy

    split = math.pi * 2 / @parts
    rot = @rot

    alpha = math.min(1/3, @time) * 3 * 255

    COLOR\push 255, 255, 255, alpha
    g.setPointSize 2

    radius = @radius
    if @time < 1
      radius = radius * cubic_bez 1, 3, 0.5, 1, @time

    for i=0,@parts
      x, y = unpack Vec2d.from_radians(rot) * (radius + math.sin(5*@time + rot) * radius / 5)

      COLOR\push 0,0,0
      g.points x + 1, y + 1
      COLOR\pop!

      g.points x, y

      rot += split

    COLOR\pop!
    g.pop!

  update: (dt) =>
    @time += dt * 2
    @rot += dt * 5
    if @is_active
      @is_active!
    else
      true


{:Cursor}
