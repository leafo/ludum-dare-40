return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 26,
  height = 26,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 49,
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
          id = 11,
          name = "dude",
          type = "npc",
          shape = "rectangle",
          x = 157.25,
          y = 88,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "dude2",
          type = "npc",
          shape = "rectangle",
          x = 128,
          y = 313,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "stranger",
          type = "npc",
          shape = "rectangle",
          x = 136.25,
          y = 94.75,
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
          x = 140.5,
          y = 72.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 20,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 118.75,
          y = 69,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 21,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 106.5,
          y = 71,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 22,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 110,
          y = 84.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 27,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 82.3333,
          y = 164.667,
          width = 79.3333,
          height = 25.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "town"
          }
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
            { x = 0, y = 0 },
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
            { x = -43.25, y = 61.25 },
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
        }
      }
    }
  }
}
