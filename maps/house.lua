return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 7,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 72,
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
      image = "../images/house.png",
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
          x = 146,
          y = 74.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 122.75,
          y = 102.25,
          width = 27,
          height = 5.25,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "town"
          }
        },
        {
          id = 71,
          name = "talldude",
          type = "npc",
          shape = "rectangle",
          x = 39.5,
          y = 83,
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
          x = 96.25,
          y = 75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -5, y = 1.25 },
            { x = -79.5, y = 2.75 },
            { x = -39.5, y = -28.25 }
          },
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "polygon",
          x = 133.25,
          y = 44,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 1.5, y = 1 },
            { x = 9.5, y = 11.5 },
            { x = 48, y = 9.5 }
          },
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "polygon",
          x = 156.75,
          y = 52.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 10.75, y = 13 },
            { x = 23, y = -2.25 }
          },
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "polygon",
          x = 167,
          y = 61,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -6.5, y = 17.75 },
            { x = -5.75, y = 40.5 },
            { x = 16, y = 31.25 }
          },
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "polygon",
          x = 182.5,
          y = 99,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -32.5, y = 1 },
            { x = -28.75, y = 10.75 }
          },
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "polygon",
          x = 117.25,
          y = 100.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 4.75, y = 8.5 },
            { x = -119.75, y = 9 },
            { x = -23, y = 1 }
          },
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "polygon",
          x = 94.5,
          y = 98,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -96.75, y = 1.25 },
            { x = 0, y = 8 }
          },
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "polygon",
          x = -2.5,
          y = 72.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 15.25, y = 8.75 },
            { x = 20.75, y = 31.25 },
            { x = -4.5, y = 24.75 }
          },
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "polygon",
          x = 2,
          y = 78.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 17.25, y = -8.5 },
            { x = -0.25, y = -20 }
          },
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "polygon",
          x = 13,
          y = 69.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 4.5, y = 8.25 },
            { x = 16.5, y = -5 }
          },
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "polygon",
          x = 98,
          y = 27.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 44, y = 0 },
            { x = 43, y = -31 }
          },
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "polygon",
          x = 97.75,
          y = -3.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 3, y = 74.75 },
            { x = -27, y = 75.5 }
          },
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "polygon",
          x = 86,
          y = 74,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 4.5, y = 4 },
            { x = 14.25, y = -2.75 },
            { x = 3, y = -12 }
          },
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "polygon",
          x = 118.25,
          y = 107.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 37, y = -0.25 },
            { x = 18.5, y = 5.75 }
          },
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "polygon",
          x = 136,
          y = 22.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 11.25, y = 16 },
            { x = 41.75, y = -2.5 }
          },
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "polygon",
          x = 136.25,
          y = 46.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0.5, y = -10.25 },
            { x = 31, y = -12 }
          },
          properties = {}
        }
      }
    }
  }
}
