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
  nextobjectid = 54,
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
      image = "../images/room.png",
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
          x = 68.75,
          y = 74.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 102.761,
          y = 86.2955,
          width = 0,
          height = 0,
          rotation = -20,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 137.604,
          y = 94.4587,
          width = 14.5833,
          height = 6.4583,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "town"
          }
        },
        {
          id = 52,
          name = "diary",
          type = "npc",
          shape = "rectangle",
          x = 124.375,
          y = 64.25,
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
          id = 36,
          name = "",
          type = "",
          shape = "polygon",
          x = 50.0833,
          y = 68.4167,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -1.5, y = -31.5 },
            { x = -36.5, y = -25.75 },
            { x = -40.5, y = 19.25 },
            { x = -13.25, y = 19 }
          },
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "polygon",
          x = 13.3333,
          y = 85.6667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -8.75, y = 18.25 },
            { x = -17.25, y = -0.5 }
          },
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "polygon",
          x = 153.833,
          y = 57.6667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 27.75, y = 52.5 },
            { x = 32, y = -17.5 }
          },
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "polygon",
          x = 115.083,
          y = 59.1667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -7.45455, y = 0 },
            { x = -68.25, y = 3 },
            { x = -72, y = -60.5 },
            { x = -0.25, y = -64 }
          },
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "polygon",
          x = 155.083,
          y = -2.58333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0.5, y = 64.75 },
            { x = -12.8864, y = 62.1591 },
            { x = -43.75, y = -7 }
          },
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "polygon",
          x = 1,
          y = 101,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 187, y = -0.666667 },
            { x = 86.3333, y = 20 }
          },
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "polygon",
          x = 106.063,
          y = 59.625,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 37.4375, y = 0.875 },
            { x = 17.8125, y = -19.625 }
          },
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "polygon",
          x = 109.364,
          y = 65.6364,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -3.90909, y = -12 },
            { x = 4.36364, y = -12.0909 }
          },
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "polygon",
          x = 140.455,
          y = 65.5455,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -4.63636, y = -9.90909 },
            { x = 4.27273, y = -10.1818 }
          },
          properties = {}
        }
      }
    }
  }
}
