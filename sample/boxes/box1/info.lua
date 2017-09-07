box = {
  size = {
    height = 700,
    width = 700,
    depth = 200
  },
  image = {
    down = love.graphics.newImage("sample/boxes/box1/images/down.png"),
    up = love.graphics.newImage("sample/boxes/box1/images/up.png"),
    background = love.graphics.newImage("sample/boxes/box1/images/background.png"),
    right = love.graphics.newImage("sample/boxes/box1/images/right.png"),
    left = love.graphics.newImage("sample/boxes/box1/images/left.png")
  },
  gravity = {
    surface = "down", -- "left", "right", "up", "down", "background" or "none"
    acceleration = 5
  }
}
