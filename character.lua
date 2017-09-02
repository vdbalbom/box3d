local contants = require("global")

local sample = {
  position = {x = 500, y = 825, z = MARGIN},
  size = {x = 50, y = 50},
  speed = 200,
  jumpTime = 0,
  v0 = math.sqrt(200 * 2 * G),
  p0 = nil
}

function border(c, b)
  if b == RIGHT then
    return c.position.x + c.size.x/2
  elseif b == LEFT then
    return c.position.x - c.size.x/2
  elseif b == UP then
    return c.position.y - c.size.x/2
  elseif b == DOWN then
    return c.position.y + c.size.x/2
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
  if love.keyboard.isDown("z") or sample.jumpTime > 0 then
    if sample.jumpTime == 0 then
      sample.p0 = sample.position.y
    end
    jumpSample()
  end
end

function jumpSample()
  sample.jumpTime = sample.jumpTime + DT
  p = -sample.v0*sample.jumpTime + G*sample.jumpTime*sample.jumpTime/2
  if border(sample,DOWN) > 850 and sample.jumpTime > 0 then
    sample.jumpTime  = 0
    sample.position.y = sample.p0
  else
    sample.position.y = sample.p0 + p
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
