return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 9,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 70,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      image = "../images/store.png",
      properties = {}
    },
    {
      type = "objectgroup",
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 5,
          name = "player spawn",
          type = "spawn",
          shape = "rectangle",
          x = 65.25,
          y = 76.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 82.5455,
          y = 109.455,
          width = 20.5455,
          height = 4,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "town"
          }
        },
        {
          id = 69,
          name = "dude2",
          type = "npc",
          shape = "rectangle",
          x = 106.364,
          y = 72.5455,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "collide",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 54,
          name = "",
          type = "",
          shape = "polygon",
          x = 72.25,
          y = 97,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0.613636, y = 20.2045 },
            { x = -73, y = 11.75 },
            { x = -72.5, y = -6.75 }
          },
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "polygon",
          x = 53.75,
          y = 77.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -24, y = 16.5 },
            { x = -53.25, y = -0.75 },
            { x = 0.25, y = -11.5 }
          },
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "polygon",
          x = 50.75,
          y = 71.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 34, y = -1.25 },
            { x = 41.5, y = -8.75 },
            { x = 19.25, y = -13.75 }
          },
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "polygon",
          x = 91.75,
          y = 63.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 4.25, y = 3.5 },
            { x = 14.5, y = 3.25 },
            { x = 17.5, y = -1 },
            { x = 8, y = -6.5 }
          },
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "polygon",
          x = 104,
          y = 63.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 20, y = 0.25 },
            { x = 9.5, y = -16.75 }
          },
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "polygon",
          x = 119.25,
          y = 61.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 1, y = 13 },
            { x = 8.25, y = 19.25 },
            { x = 48, y = 18 }
          },
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "polygon",
          x = 161,
          y = 79,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 8.5, y = 6.75 },
            { x = 11.75, y = -3 }
          },
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "polygon",
          x = 181.25,
          y = 101.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -14.9091, y = 0.727273 },
            { x = -68.3864, y = 3.97727 },
            { x = -69.3636, y = 16.4091 },
            { x = 7.5, y = 10 }
          },
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "polygon",
          x = 68.4545,
          y = 112.182,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 1.27273, y = 2.36364 },
            { x = 49.1364, y = 1.36364 },
            { x = 22.25, y = 7.5 }
          },
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "polygon",
          x = 173.455,
          y = 83.4545,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -14.9091, y = 3.27273 },
            { x = -14, y = 12.1818 },
            { x = -7.09091, y = 20.1818 }
          },
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "polygon",
          x = 32.9091,
          y = 88.5455,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 20.5455, y = 6.72727 },
            { x = 1.27273, y = 9.81818 }
          },
          properties = {}
        }
      }
    }
  }
}
