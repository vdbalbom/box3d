local contants = require("global")
local GRAVITY_TIME = 0

function gravity()
  p = getPlayer()
  b = getBox()

  GRAVITY_TIME = GRAVITY_TIME + DT

  posi= b.gravity.acceleration*GRAVITY_TIME*GRAVITY_TIME

  if b.gravity.surface == "down" then
    p.position.y = p.position.y - posi
    if checkCollision() then
      p.position.y = p.position.y + posi
      GRAVITY_TIME = 0
    end
    if love.keyboard.isDown("a") and p.speed["y+"] > 0 then
      GRAVITY_TIME = 0
    end
  elseif b.gravity.surface == "up" then
    p.position.y = p.position.y + posi
    if checkCollision() then
      p.position.y = p.position.y - posi
      GRAVITY_TIME = 0
    end
    if love.keyboard.isDown("z") and p.speed["y-"] > 0 then
      GRAVITY_TIME = 0
    end
  elseif b.gravity.surface == "left" then
    p.position.x = p.position.x - posi
    if checkCollision() then
      p.position.x = p.position.x + posi
      GRAVITY_TIME = 0
    end
    if love.keyboard.isDown("right") and p.speed["x+"] > 0 then
      GRAVITY_TIME = 0
    end
  elseif b.gravity.surface == "right" then
    p.position.x = p.position.x + posi
    if checkCollision() then
      p.position.x = p.position.x - posi
      GRAVITY_TIME = 0
    end
    if love.keyboard.isDown("left") and p.speed["x-"] > 0 then
      GRAVITY_TIME = 0
    end
  elseif b.gravity.surface == "background" then
    p.position.z = p.position.z - posi
    if checkCollision() then
      p.position.z = p.position.z + posi
      GRAVITY_TIME = 0
    end
    if love.keyboard.isDown("down") and p.speed["z+"] > 0 then
      GRAVITY_TIME = 0
    end
  end
end

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
  b = getBox()

  if b.gravity.surface ~= "none" then
    gravity()
  end

  if love.keyboard.isDown(RIGHT) then
    p.position.x = p.position.x + p.speed["x+"]*DT
    if checkCollision() then
      p.position.x = p.position.x - p.speed["x+"]*DT
    end
  end
  if love.keyboard.isDown(LEFT) then
    p.position.x = p.position.x - p.speed["x-"]*DT
    if checkCollision() then
      p.position.x = p.position.x + p.speed["x-"]*DT
    end
  end
  if love.keyboard.isDown(UP) then
    p.position.z = p.position.z - p.speed["z-"]*DT
    if checkCollision() then
      p.position.z = p.position.z + p.speed["z-"]*DT
    end
  end
  if love.keyboard.isDown(DOWN) then
    p.position.z = p.position.z + p.speed["z+"]*DT
    if checkCollision() then
      p.position.z = p.position.z - p.speed["z+"]*DT
    end
  end
  if love.keyboard.isDown("z") then
    p.position.y = p.position.y - p.speed["y-"]*DT
    if checkCollision() then
      p.position.y = p.position.y + p.speed["y-"]*DT
    end
  end
  if love.keyboard.isDown("a") then
    p.position.y = p.position.y + p.speed["y+"]*DT
    if checkCollision() then
      p.position.y = p.position.y - p.speed["y+"]*DT
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
