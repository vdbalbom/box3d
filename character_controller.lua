local contants = require("global")

function checkBoxCollision()
  p = getPlayer()
  b = getBox()
  if p.position.x > b.size.width - p.size.width/2 then
    return true
  elseif p.position.x < 0 + p.size.width/2 then
    return true
  elseif p.position.z > b.size.depth then
    return true
  elseif p.position.z < 0 + p.size.depth then
    return true
  elseif p.position.y > b.size.height - p.size.height then
    return true
  elseif p.position.y < 0 then
    return true
  else
    return false
  end
end

function checkCollision()
  return checkBoxCollision()
end

function updateCharacter()

  p = getPlayer()

  if love.keyboard.isDown(RIGHT) then
    p.position.x = p.position.x + p.speed*DT
    if checkCollision() then
      p.position.x = p.position.x - p.speed*DT
    end
  end
  if love.keyboard.isDown(LEFT) then
    p.position.x = p.position.x - p.speed*DT
    if checkCollision() then
      p.position.x = p.position.x + p.speed*DT
    end
  end
  if love.keyboard.isDown(UP) then
    p.position.z = p.position.z - p.speed*DT
    if checkCollision() then
      p.position.z = p.position.z + p.speed*DT
    end
  end
  if love.keyboard.isDown(DOWN) then
    p.position.z = p.position.z + p.speed*DT
    if checkCollision() then
      p.position.z = p.position.z - p.speed*DT
    end
  end
  if love.keyboard.isDown("z") then
    p.position.y = p.position.y - p.speed*DT
    if checkCollision() then
      p.position.y = p.position.y + p.speed*DT
    end
  end
  if love.keyboard.isDown("a") then
    p.position.y = p.position.y + p.speed*DT
    if checkCollision() then
      p.position.y = p.position.y - p.speed*DT
    end
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
