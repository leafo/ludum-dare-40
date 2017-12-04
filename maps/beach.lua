return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 31,
  height = 23,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 118,
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
      image = "../images/beach.png",
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
          x = 274,
          y = 247.75,
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
          x = 209.25,
          y = 31,
          width = 27.75,
          height = 6.25,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "town"
          }
        },
        {
          id = 113,
          name = "talldude",
          type = "npc",
          shape = "rectangle",
          x = 411.333,
          y = 238.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "dude",
          type = "npc",
          shape = "rectangle",
          x = 379.667,
          y = 230.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 115,
          name = "stranger",
          type = "npc",
          shape = "rectangle",
          x = 54,
          y = 254.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 116,
          name = "dude2",
          type = "npc",
          shape = "rectangle",
          x = 130.667,
          y = 230,
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
          id = 55,
          name = "",
          type = "",
          shape = "polygon",
          x = 206,
          y = 38.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -17.75, y = 25 },
            { x = -44, y = -17.5 }
          },
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "polygon",
          x = 189.25,
          y = 60.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -59.5, y = 17.5 },
            { x = -56.5, y = -28.75 }
          },
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "polygon",
          x = 132.25,
          y = 75.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -19.25, y = 34.5 },
            { x = -26.75, y = -4.5 }
          },
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "polygon",
          x = 113.25,
          y = 104.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 3.5, y = 29 },
            { x = -13, y = 26 }
          },
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "polygon",
          x = 154.25,
          y = 114.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 106.75, y = 14.25 },
            { x = 60, y = -18.75 },
            { x = 9.25, y = -24.5 }
          },
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "polygon",
          x = 163.75,
          y = 91.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 41, y = -17.25 },
            { x = 48.5, y = 10.25 }
          },
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "polygon",
          x = 240.25,
          y = 42.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -38, y = 34.25 },
            { x = -0.25, y = 32.5 }
          },
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "polygon",
          x = 240.5,
          y = 33.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -1, y = 14.25 },
            { x = 27.75, y = 4 },
            { x = 6.75, y = -6 }
          },
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "polygon",
          x = 205.5,
          y = 27,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -0.25, y = 15.25 },
            { x = -17.25, y = 0.5 },
            { x = -9, y = -5 }
          },
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "polygon",
          x = 200.5,
          y = 24.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 1.25, y = 3 },
            { x = 23.75, y = -13.75 },
            { x = 53.5, y = 6.75 },
            { x = 46, y = 6.5 }
          },
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "polygon",
          x = 114.5,
          y = 131.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 127.25, y = 14 },
            { x = 49.75, y = 25.25 }
          },
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "polygon",
          x = 241,
          y = 145.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 24.5, y = 13.75 },
            { x = 23, y = 27.5 },
            { x = 4.25, y = 39.75 }
          },
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "polygon",
          x = 259.5,
          y = 126.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 41.25, y = 31.75 },
            { x = 47.25, y = 22.5 },
            { x = 3, y = -12.25 }
          },
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "polygon",
          x = 300.5,
          y = 156.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -6.75, y = 12.75 },
            { x = -5.75, y = 32 },
            { x = 7.75, y = 12.75 }
          },
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "polygon",
          x = 247.25,
          y = 182.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -10, y = 55.25 },
            { x = -23.75, y = 54.5 },
            { x = -25, y = 42.75 },
            { x = -7.5, y = -2.25 }
          },
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "polygon",
          x = 245.5,
          y = 191.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -12.5, y = 0.5 },
            { x = -19.75, y = -5.5 },
            { x = -14.5, y = -12.5 },
            { x = 3.25, y = -12.75 }
          },
          properties = {}
        },
        {
          id = 73,
          name = "",
          type = "",
          shape = "polygon",
          x = 292.75,
          y = 187.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 16.75, y = 47.75 },
            { x = 28.25, y = 47.75 },
            { x = 26.75, y = 39.75 },
            { x = 6.5, y = -9.5 }
          },
          properties = {}
        },
        {
          id = 74,
          name = "",
          type = "",
          shape = "polygon",
          x = 301.25,
          y = 190,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 10.25, y = 3.75 },
            { x = 18.5, y = -7.5 },
            { x = 2, y = -18.75 }
          },
          properties = {}
        },
        {
          id = 75,
          name = "",
          type = "",
          shape = "polygon",
          x = 316.5,
          y = 182.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 14.75, y = 6 },
            { x = 24, y = 5 },
            { x = 33, y = -2.25 },
            { x = 13.5, y = -15.5 }
          },
          properties = {}
        },
        {
          id = 76,
          name = "",
          type = "",
          shape = "polygon",
          x = 348,
          y = 194.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 23.5, y = 3 },
            { x = 27.75, y = -31.75 },
            { x = -3.75, y = -32.25 }
          },
          properties = {}
        },
        {
          id = 77,
          name = "",
          type = "",
          shape = "polygon",
          x = 370.25,
          y = 186.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 44.25, y = 1.5 },
            { x = 44.5, y = -30 },
            { x = -1, y = -27.5 }
          },
          properties = {}
        },
        {
          id = 78,
          name = "",
          type = "",
          shape = "polygon",
          x = 409,
          y = 180.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 29.5, y = 17.5 },
            { x = 80.5, y = 3.75 },
            { x = 39.25, y = -28.5 }
          },
          properties = {}
        },
        {
          id = 79,
          name = "",
          type = "",
          shape = "polygon",
          x = 474.75,
          y = 184.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -13.5, y = 40.5 },
            { x = -2.75, y = 54.25 },
            { x = 23.25, y = 29.25 }
          },
          properties = {}
        },
        {
          id = 80,
          name = "",
          type = "",
          shape = "polygon",
          x = 475,
          y = 230.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -15.75, y = 15.25 },
            { x = -11.5, y = 52 },
            { x = -4, y = 58 },
            { x = 24, y = 21.75 }
          },
          properties = {}
        },
        {
          id = 81,
          name = "",
          type = "",
          shape = "polygon",
          x = 472,
          y = 279.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -5, y = 15.5 },
            { x = 9.5, y = 14.5 }
          },
          properties = {}
        },
        {
          id = 82,
          name = "",
          type = "",
          shape = "polygon",
          x = 475.75,
          y = 296.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -51.75, y = -12.5 },
            { x = -30.5, y = 26 }
          },
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "polygon",
          x = 428.75,
          y = 284,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -46.5, y = -10.5 },
            { x = -21.5, y = 23.25 }
          },
          properties = {}
        },
        {
          id = 84,
          name = "",
          type = "",
          shape = "polygon",
          x = 387.75,
          y = 273.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -28, y = -0.5 },
            { x = -12.5, y = 18.25 }
          },
          properties = {}
        },
        {
          id = 85,
          name = "",
          type = "",
          shape = "polygon",
          x = 361.75,
          y = 272.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -37.75, y = 13.5 },
            { x = -8, y = 25.75 }
          },
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "",
          shape = "polygon",
          x = 330.75,
          y = 282.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -34.75, y = 12.25 },
            { x = -7.75, y = 27.25 }
          },
          properties = {}
        },
        {
          id = 87,
          name = "",
          type = "",
          shape = "polygon",
          x = 301.5,
          y = 293,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -43, y = 1.75 },
            { x = -18.25, y = 17.75 }
          },
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "polygon",
          x = 267.75,
          y = 295.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -44, y = -3.75 },
            { x = -27.25, y = 6.5 }
          },
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "polygon",
          x = 230,
          y = 293.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -31, y = -8.5 },
            { x = -20.75, y = 8.25 }
          },
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "polygon",
          x = 203,
          y = 286.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -29.75, y = -8.25 },
            { x = -18.25, y = 8.5 }
          },
          properties = {}
        },
        {
          id = 91,
          name = "",
          type = "",
          shape = "polygon",
          x = 175.75,
          y = 278,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -28.25, y = 1.25 },
            { x = -8.25, y = 17.75 }
          },
          properties = {}
        },
        {
          id = 92,
          name = "",
          type = "",
          shape = "polygon",
          x = 150,
          y = 279,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -35.25, y = 8.75 },
            { x = -7.25, y = 18.75 }
          },
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "polygon",
          x = 119.75,
          y = 286.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -34, y = 5.25 },
            { x = -9.5, y = 17.25 }
          },
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "polygon",
          x = 89,
          y = 291.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -27.75, y = 0.25 },
            { x = -6.5, y = 16 }
          },
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "polygon",
          x = 68.5,
          y = 292.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -29.75, y = -2.75 },
            { x = -7.25, y = 12.25 }
          },
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "polygon",
          x = 97.75,
          y = 218.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 5.25, y = 5.25 },
            { x = 14.75, y = 1.5 },
            { x = 11.75, y = -64 },
            { x = -3.25, y = -65.25 }
          },
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "polygon",
          x = 120.25,
          y = 206,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 11.75, y = 16 },
            { x = 43.25, y = 15.5 },
            { x = 53, y = 6.25 },
            { x = 25.5, y = -10.25 }
          },
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "polygon",
          x = 169,
          y = 212.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 33.75, y = 5 },
            { x = 57, y = -8.5 },
            { x = 28, y = -32.25 }
          },
          properties = {}
        },
        {
          id = 99,
          name = "",
          type = "",
          shape = "polygon",
          x = 216.75,
          y = 203.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 19, y = -2.25 },
            { x = -5.5, y = -32 }
          },
          properties = {}
        },
        {
          id = 100,
          name = "",
          type = "",
          shape = "polygon",
          x = 109,
          y = 195.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 14.75, y = 12.5 },
            { x = 17.5, y = -15.25 }
          },
          properties = {}
        },
        {
          id = 101,
          name = "",
          type = "",
          shape = "polygon",
          x = 99.25,
          y = 196.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -30.25, y = -0.25 },
            { x = -17.25, y = -30.25 }
          },
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "polygon",
          x = 79.25,
          y = 192.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -3.25, y = 10.25 },
            { x = -48.5, y = 9 },
            { x = -36.25, y = -11 }
          },
          properties = {}
        },
        {
          id = 103,
          name = "",
          type = "",
          shape = "polygon",
          x = 34,
          y = 198.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 17.5 },
            { x = -24.75, y = 6.75 }
          },
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "polygon",
          x = 31.5,
          y = 212,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 12, y = 21.5 },
            { x = -17.75, y = 33 },
            { x = -20.75, y = 9.5 }
          },
          properties = {}
        },
        {
          id = 105,
          name = "",
          type = "",
          shape = "polygon",
          x = 28.75,
          y = 235.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -9.25, y = 11.75 },
            { x = -23.25, y = 1.5 }
          },
          properties = {}
        },
        {
          id = 106,
          name = "",
          type = "",
          shape = "polygon",
          x = 19,
          y = 243.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 10.5, y = 17.25 },
            { x = -13.25, y = 20.75 }
          },
          properties = {}
        },
        {
          id = 107,
          name = "",
          type = "",
          shape = "polygon",
          x = 29,
          y = 254.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -1.5, y = 15.75 },
            { x = -25, y = 13 }
          },
          properties = {}
        },
        {
          id = 108,
          name = "",
          type = "",
          shape = "polygon",
          x = 27.5,
          y = 265.25,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -5.75, y = 11.5 },
            { x = -19.25, y = 7 }
          },
          properties = {}
        },
        {
          id = 109,
          name = "",
          type = "",
          shape = "polygon",
          x = 19.5,
          y = 272.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 25.25, y = 19 },
            { x = 5.25, y = 25.5 }
          },
          properties = {}
        },
        {
          id = 110,
          name = "",
          type = "",
          shape = "polygon",
          x = 399.455,
          y = 217.273,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 11.4545, y = 10.1818 },
            { x = 25.8182, y = 10.9091 },
            { x = 30.1818, y = 6.36364 },
            { x = 30.9091, y = -5.27273 },
            { x = 14.9091, y = -15.8182 },
            { x = 2.54545, y = -10.3636 }
          },
          properties = {}
        },
        {
          id = 111,
          name = "",
          type = "",
          shape = "polygon",
          x = 372.364,
          y = 217.818,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 16.1818, y = 1.09091 },
            { x = 34.1818, y = -1.81818 },
            { x = 25.4545, y = -7.81818 },
            { x = 3.81818, y = -6.36364 }
          },
          properties = {}
        }
      }
    }
  }
}
