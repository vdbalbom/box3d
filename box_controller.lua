require("global")

function drawRightWall()
  w = calcResolution(box.size.width)
  d = calcResolution(box.size.depth)
  h = calcResolution(box.size.height)
  img = box.image.right
  d = d/2
  for i = 0,d-1 do
    quad = love.graphics.newQuad(i, 0, 1, h - 2*d + 2*i, d, h - 2*d + 2*i)
    love.graphics.draw( img , quad, w - d + i - 1, d - i, 0, 1, 1, 0, 0, 0, 0 )
  end
end

function drawFloor(box)
  w = calcResolution(box.size.width)
  d = calcResolution(box.size.depth)
  h = calcResolution(box.size.height)
  img = box.image.down
  d = d/2
  for i = 0,d-1 do
    quad = love.graphics.newQuad(0, i, w - 2*d + 2*i, 1, w - 2*d + 2*i, d)
    love.graphics.draw( img , quad, d - i, h - d + i - 1, 0, 1, 1, 0, 0, 0, 0 )
  end
end

function drawCeiling(box)
  w = calcResolution(box.size.width)
  d = calcResolution(box.size.depth)
  h = calcResolution(box.size.height)
  img = box.image.up
  d = d/2
  for i = 0,d-1 do
    quad = love.graphics.newQuad(0, i, w - 2*i, 1, w - 2*i, d)
    love.graphics.draw( img , quad, i, i, 0, 1, 1, 0, 0, 0, 0 )
  end
end

function drawLeftWall(box)
  w = calcResolution(box.size.width)
  d = calcResolution(box.size.depth)
  h = calcResolution(box.size.height)
  img = box.image.left
  d = d/2
  for i = 0,d-1 do
    quad = love.graphics.newQuad(i, 0, 1, h - 2*i, d, h - 2*i)
    love.graphics.draw( img , quad, i, i, 0, 1, 1, 0, 0, 0, 0 )
  end
end

function drawBackground(box)
  w = calcResolution(box.size.width)
  d = calcResolution(box.size.depth)
  h = calcResolution(box.size.height)
  img = box.image.background
  d = d/2
  quad = love.graphics.newQuad(0, 0, w-2*d, h-2*d, w-2*d, h-2*d)
  love.graphics.draw( img , quad, d, d, 0, 1, 1, 0, 0, 0, 0 )
end

function drawBox()
  box = getBox()
  drawFloor(box)
  drawCeiling(box)
  drawLeftWall(box)
  drawRightWall(box)
  drawBackground(box)
end
