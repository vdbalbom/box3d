DT = 0
G = 10 * 500
SAMPLE = "sample"
RIGHT = "right"
LEFT = "left"
DOWN = "down"
UP = "up"
BEHIND = "behind"
FRONT = "front"
FILL = "fill"
LINE = "line"
MARGIN = 4
CURRENT_LEVEL = "level1"
RESOLUTION = 100 -- percent

function calcResolution(number)
  return number*RESOLUTION/100
end

function getPlayer()
  require("sample/player/info")
  return player
end

function getBox()
  require("sample/levels/" .. CURRENT_LEVEL .. "/info")
  require("sample/boxes/" .. level.box .. "/info")
  return box
end

function getLevel()
  require("sample/levels/" .. CURRENT_LEVEL .. "/info")
  return level
end

function gravity(object, box)

  object.gravity_time = object.gravity_time + DT

  posi= box.gravity.acceleration*object.gravity_time*object.gravity_time

  if box.gravity.surface == "down" then
    object.position.y = object.position.y - posi
    if checkCollision() then
      object.position.y = object.position.y + posi
      object.gravity_time = 0
    end
    if love.keyboard.isDown("a") and object.speed["y+"] > 0 then
      object.gravity_time = 0
    end
  elseif box.gravity.surface == "up" then
    object.position.y = object.position.y + posi
    if checkCollision() then
      object.position.y = object.position.y - posi
      object.gravity_time = 0
    end
    if love.keyboard.isDown("z") and object.speed["y-"] > 0 then
      object.gravity_time = 0
    end
  elseif box.gravity.surface == "left" then
    object.position.x = object.position.x - posi
    if checkCollision() then
      object.position.x = object.position.x + posi
      object.gravity_time = 0
    end
    if love.keyboard.isDown("right") and object.speed["x+"] > 0 then
      object.gravity_time = 0
    end
  elseif box.gravity.surface == "right" then
    object.position.x = object.position.x + posi
    if checkCollision() then
      object.position.x = object.position.x - posi
      object.gravity_time = 0
    end
    if love.keyboard.isDown("left") and object.speed["x-"] > 0 then
      object.gravity_time = 0
    end
  elseif box.gravity.surface == "background" then
    object.position.z = object.position.z - posi
    if checkCollision() then
      object.position.z = object.position.z + posi
      object.gravity_time = 0
    end
    if love.keyboard.isDown("down") and object.speed["z+"] > 0 then
      object.gravity_time = 0
    end
  end
end
