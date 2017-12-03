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
  nextobjectid = 62,
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
          x = 285.333,
          y = 241.333,
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
          x = 449.67,
          y = 172.325,
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
          x = 307.666,
          y = 220,
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
          x = 475.583,
          y = 193.417,
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
          x = 475.917,
          y = 183,
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
          x = 405.917,
          y = 188.333,
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
          x = 426.334,
          y = 181.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["owner"] = "dude"
          }
        },
        {
          id = 58,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 235.956,
          y = 288.125,
          width = 31.0568,
          height = 9.20455,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "beach"
          }
        },
        {
          id = 59,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 92.5625,
          y = 163.761,
          width = 13.0568,
          height = 5.56819,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "house"
          }
        },
        {
          id = 60,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 264.805,
          y = 195.481,
          width = 16.9318,
          height = 5.45455,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "store"
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
            { x = -0.625, y = 6.125 },
            { x = 33.1667, y = 6.29167 },
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
            { x = 1.45455, y = 7.63636 },
            { x = -25.5455, y = 18.1818 },
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
            { x = 8.66663, y = 32.3333 },
            { x = 69.6666, y = 44.6667 }
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
            { x = -19.6667, y = 26.3333 },
            { x = -23.6667, y = 37.6666 },
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
            { x = 0.666667, y = -3.33333 },
            { x = -50, y = 3.6667 },
            { x = -37.6667, y = 44.3333 }
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
            { x = 17.6667, y = -31.6667 },
            { x = -27.3334, y = -35.3334 },
            { x = 8.33367, y = 9 }
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
            { x = 9.33333, y = 40.6666 },
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
            { x = 17, y = 0.333333 },
            { x = 55.6667, y = 30.3334 },
            { x = 16.6667, y = 38.3333 }
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
            { x = -1, y = -23 },
            { x = 112.333, y = 11 },
            { x = 36.3333, y = 16 }
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
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "polygon",
          x = 125.667,
          y = 192.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 60.3333, y = -28 },
            { x = 79.6667, y = 32.3333 },
            { x = 5.33333, y = 17.3333 }
          },
          properties = {}
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "polygon",
          x = 233.333,
          y = 163,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -47.4928, y = 1.73913 },
            { x = -29.3333, y = 61.6667 },
            { x = 5, y = 43 }
          },
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "polygon",
          x = 412.333,
          y = 209,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -31, y = 34.6667 },
            { x = -48.6667, y = -14.6667 }
          },
          properties = {}
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "polygon",
          x = 420.333,
          y = 259,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 15.6667, y = -47.6667 },
            { x = 69.6667, y = -18.6667 }
          },
          properties = {}
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "polygon",
          x = 425,
          y = 255.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -49.6667, y = 16 },
            { x = -4, y = 27.6667 }
          },
          properties = {}
        },
        {
          id = 54,
          name = "",
          type = "",
          shape = "polygon",
          x = 366.333,
          y = 197,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 83, y = -32 },
            { x = 17, y = -36 }
          },
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "polygon",
          x = 434.667,
          y = 159,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 62, y = 21 },
            { x = 39.6667, y = -14.3333 }
          },
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "polygon",
          x = 485,
          y = 172.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 13.6667, y = 62.3333 },
            { x = 37.6667, y = 54.6667 }
          },
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "polygon",
          x = 505,
          y = 226,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -26.3333, y = 13 },
            { x = -4, y = 22.3333 }
          },
          properties = {}
        }
      }
    }
  }
}
