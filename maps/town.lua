return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 31,
  height = 19,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 48,
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
      image = "../images/town.png",
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
          id = 2,
          name = "spawn",
          type = "spawn",
          shape = "rectangle",
          x = 278,
          y = 95.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 314.678,
          y = 77.0644,
          width = 14.875,
          height = 5.75,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room"
          }
        },
        {
          id = 6,
          name = "dude",
          type = "npc",
          shape = "rectangle",
          x = 202.167,
          y = 207.416,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "stranger",
          type = "npc",
          shape = "rectangle",
          x = 291.333,
          y = 231.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "dude2",
          type = "npc",
          shape = "rectangle",
          x = 237.333,
          y = 236,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 247.583,
          y = 104.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 10,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 318.917,
          y = 99.6667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 11,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 339.917,
          y = 95,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 12,
          name = "box",
          type = "box",
          shape = "rectangle",
          x = 299.667,
          y = 105,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
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
          id = 13,
          name = "",
          type = "",
          shape = "polygon",
          x = 279.75,
          y = 81,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -20, y = 13.75 },
            { x = -44.5, y = 11.25 },
            { x = -32.5, y = 5 }
          },
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "polygon",
          x = 306,
          y = 83.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 29.6364, y = 0.363636 },
            { x = 36.75, y = 1 },
            { x = 49.5, y = -9 },
            { x = 48.75, y = -58.5 },
            { x = 35.5, y = -64.2045 },
            { x = 11.1818, y = -72.7273 }
          },
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 310.25,
          y = 82.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0.545436, y = 0.181818 },
            { x = -53.5, y = -2.25 },
            { x = -53.25, y = -41.25 },
            { x = -38.7727, y = -52.0682 },
            { x = 1.25005, y = -70.2046 }
          },
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "polygon",
          x = 305.819,
          y = 74.3636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 26.5455, y = -0.727273 },
            { x = 12.1818, y = -63.6364 },
            { x = -2, y = -58.5455 }
          },
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "polygon",
          x = 240,
          y = 91.6667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -21.3333, y = 9.33333 },
            { x = -39.6667, y = -1 }
          },
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "polygon",
          x = 214.333,
          y = 95.3333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -12.6667, y = 9.33333 },
            { x = -29.3333, y = -1.33333 }
          },
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "polygon",
          x = 196.667,
          y = 98.3333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -7.66667, y = 14.6667 },
            { x = -27.6667, y = 2 }
          },
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "polygon",
          x = 184,
          y = 107.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -13.3333, y = 11.3333 },
            { x = -31, y = -1.33333 }
          },
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "polygon",
          x = 165,
          y = 113.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -8.66667, y = 12.6667 },
            { x = -26, y = -0.333333 }
          },
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "polygon",
          x = 156.667,
          y = 120,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -28, y = 14.3333 },
            { x = -45.6667, y = 0.666667 }
          },
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "polygon",
          x = 349,
          y = 74.3333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 27.6667, y = 14.3333 },
            { x = 28.6667, y = -47.3333 }
          },
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "polygon",
          x = 370.333,
          y = 81.3333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -10, y = 33.3333 },
            { x = 14.3333, y = 21.3333 }
          },
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "polygon",
          x = 366,
          y = 109.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -29.3333, y = 19 },
            { x = 3, y = 27.6667 }
          },
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "polygon",
          x = 322,
          y = 108.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -46.3333, y = 18 },
            { x = -92, y = 53.6667 },
            { x = 38.6667, y = 36 }
          },
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "polygon",
          x = 230.333,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 4.33333, y = 41 },
            { x = 33, y = 40 },
            { x = 31.3333, y = -4.66667 }
          },
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "polygon",
          x = 281.333,
          y = 150.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 5, y = 52 },
            { x = 47.3333, y = 51.6667 },
            { x = 79.6667, y = 27 },
            { x = 74, y = -9.66667 }
          },
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "polygon",
          x = 258.667,
          y = 185.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 30.6667, y = -2.33333 },
            { x = 10, y = -45.3333 }
          },
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "polygon",
          x = 125.667,
          y = 162.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -15, y = 4.33333 },
            { x = -27.6667, y = -46 },
            { x = 9, y = -30 }
          },
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "polygon",
          x = 92.6667,
          y = 175.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -11.3333, y = -46.3333 },
            { x = -68.6667, y = -43.3333 },
            { x = -66, y = -4.33333 },
            { x = -27.3333, y = 14.6667 }
          },
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "polygon",
          x = 110.667,
          y = 148.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -27, y = 14 },
            { x = -23.3333, y = -33.3333 }
          },
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "polygon",
          x = 30,
          y = 151,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -22, y = -5.33333 },
            { x = 11.6667, y = -46.3333 }
          },
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "polygon",
          x = 314,
          y = 198.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 18.3333, y = 40.3333 },
            { x = 92.3333, y = -19.3333 }
          },
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "polygon",
          x = 330,
          y = 224.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -22, y = 37.3333 },
            { x = 53.6667, y = 46.6667 }
          },
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "polygon",
          x = 315,
          y = 259.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -29, y = 40.6667 },
            { x = 65, y = 31.3333 }
          },
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "polygon",
          x = 217,
          y = 298,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -17.6667, y = -43.6667 },
            { x = -152.333, y = 0.666667 }
          },
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "polygon",
          x = 62.6667,
          y = 184.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -5, y = 49.3333 },
            { x = -57.3333, y = 14.3333 }
          },
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "polygon",
          x = 49,
          y = 215,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 52, y = 42.6667 },
            { x = -14, y = 45.3333 }
          },
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "polygon",
          x = 83.3333,
          y = 254,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 83, y = 18.6667 },
            { x = -2, y = 30.6667 }
          },
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "polygon",
          x = 208.333,
          y = 297,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 94, y = 3 },
            { x = 38.6667, y = 17.6667 }
          },
          properties = {}
        }
      }
    }
  }
}
