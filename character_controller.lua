local contants = require("global")

function updateCharacter()
  p = getPlayer()
  b = getBox()

  gravityToControllableObject(p,b)
  updateControllableObject(p,b)
end

function drawCharacter()
  x = calcResolution(getPlayer().position.x)
  y = calcResolution(getPlayer().position.y)
  z = calcResolution(getPlayer().position.z)
  pw = calcResolution(getPlayer().size.width)
  ph = calcResolution(getPlayer().size.height)
  pd = calcResolution(getPlayer().size.depth)
  bw = calcResolution(getBox().size.width)
  bh = calcResolution(getBox().size.height)
  bd = calcResolution(getBox().size.depth)

  x = x - pw/2
  y = y + ph
  z = z/2

  bd = bd/2
  pd = pd/2

  sizeX = pw * (bw-2*(bd-z))/bw
  sizeY = ph * (bh-2*(bd-z))/bh

  positionX = bd - z + x * (bw-2*(bd-z))/bw
  positionY = bh - (bd - z + y * (bh-2*(bd-z))/bh)

  love.graphics.rectangle(FILL, positionX, positionY, sizeX , sizeY)
end
