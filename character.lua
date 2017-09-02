local contants = require("global")

local sample = {
  position = {x = 500, y = 825, z = MARGIN},
  size = {x = 50, y = 50},
  speed = 200,
}

function border(c, b)
  if b == RIGHT then
    return c.position.x + c.size.x/2
  elseif b == LEFT then
    return c.position.x - c.size.x/2
  elseif b == BEHIND then
    return c.position.z - MARGIN
  elseif b == FRONT then
    -- I don't know why '+ c.size.y/4' :(
    return c.position.z + c.size.y/4 + MARGIN
  end
end

function setCharacter(type)
  if type == SAMPLE then
    setSample()
  end
end

function updateCharacter(type)
  if type == SAMPLE then
    updateSample()
  end
end

function updateSample()
  if love.keyboard.isDown(RIGHT) and border(sample, RIGHT) < 850 then
    sample.position.x = sample.position.x + sample.speed*DT
  end
  if love.keyboard.isDown(LEFT) and border(sample, LEFT) > 150 then
    sample.position.x = sample.position.x - sample.speed*DT
  end
  if love.keyboard.isDown(UP) and border(sample, BEHIND) > 0 then
    sample.position.z = sample.position.z - sample.speed*DT/2
  end
  if love.keyboard.isDown(DOWN) and border(sample, FRONT) < 150 then
    sample.position.z = sample.position.z + sample.speed*DT/2
  end
end

function setSample()
  iso = (sample.position.x - 500)*sample.position.z/350
  sizeX = (700+2*sample.position.z)*sample.size.x/700
  sizeY = (700+2*sample.position.z)*sample.size.x/700
  x = sample.position.x - sizeX/2 + iso
  y = sample.position.y - sizeY/2 + sample.position.z
  love.graphics.rectangle(FILL, x, y, sizeX , sizeY)
end
