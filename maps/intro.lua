return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 11,
  height = 6,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 65,
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
      image = "../images/intro.png",
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
          x = 85.75,
          y = 72.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 26.25,
          y = 59.25,
          width = 13.25,
          height = 9.25,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room"
          }
        },
        {
          id = 55,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 128,
          y = 57,
          width = 15.75,
          height = 12,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "exit"
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
          id = 57,
          name = "",
          type = "",
          shape = "polygon",
          x = -2,
          y = 2.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 189, y = -0.75 },
            { x = 83.75, y = -19 }
          },
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "polygon",
          x = 2.75,
          y = -3.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 2, y = 128.75 },
            { x = -15.5, y = 54.25 }
          },
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "polygon",
          x = 180,
          y = -5.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -3.5, y = 123.5 },
            { x = 27.75, y = 57.5 }
          },
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "polygon",
          x = -9.25,
          y = 104.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 208.75, y = 0 },
            { x = 79.25, y = 20.5 }
          },
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "polygon",
          x = 19,
          y = 13.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 2.25, y = 29.25 },
            { x = 137, y = 30.75 },
            { x = 137.75, y = -4.75 },
            { x = 58.5, y = -6.5 }
          },
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "polygon",
          x = 58.25,
          y = 39.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 2, y = 15 },
            { x = 42.25, y = 15.75 },
            { x = 48.75, y = -0.25 }
          },
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "text",
          x = 17.25,
          y = 87,
          width = 146.25,
          height = 9.5,
          rotation = 0,
          visible = true,
          text = "gamepad or arrows move, x confirm ",
          fontfamily = "Sans Serif",
          pixelsize = 7,
          wrap = true,
          color = { 255, 255, 255 },
          properties = {}
        }
      }
    }
  }
}
