local contants = require("global")

function updateCharacter()

  p = getPlayer()

  if love.keyboard.isDown(RIGHT) then
    p.position.x = p.position.x + p.speed*DT
  end
  if love.keyboard.isDown(LEFT) then
    p.position.x = p.position.x - p.speed*DT
  end
  if love.keyboard.isDown(UP) then
    p.position.z = p.position.z - p.speed*DT/2
  end
  if love.keyboard.isDown(DOWN) then
    p.position.z = p.position.z + p.speed*DT/2
  end
  if love.keyboard.isDown("z") then

  end
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

  sizeX = pw * (bw-2*(bd-z))/bw
  sizeY = ph * (bh-2*(bd-z))/bh

  x = x - pw/2
  y = y + ph

  positionX = bd - z + x * (bw-2*(bd-z))/bw
  positionY = bh - (bd - z + y * (bh-2*(bd-z))/bh)

  love.graphics.rectangle(FILL, positionX, positionY, sizeX , sizeY)
end
