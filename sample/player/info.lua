player = {
  size = {
    height = 50,
    width = 50,
    depth = 8
  },
  speed = {
    -- If the speed for some direction is zero then the moviment
    -- on this direction is forbidden.
    ["x+"] = 200,
    ["x-"] = 200,
    ["y+"] = 200,
    ["y-"] = 200,
    ["z+"] = 200,
    ["z-"] = 200
  },
  jump_height = 200,
  position = {
    x = 300,
    y = 0,
    z = 100
  },
  gravity_time = 0
}
