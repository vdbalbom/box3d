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
CURRENT_CONFIG = "config1"
RESOLUTION = 100 -- percent

function calcResolution(number)
  return number*RESOLUTION/100
end

function getPlayer()
  require("sample/player/info")
  return player
end

function getBox()
  require("sample/configs/" .. CURRENT_CONFIG .. "/info")
  require("sample/boxes/" .. config.box .. "/info")
  return box
end

function getLevel()
  require("sample/configs/" .. CURRENT_CONFIG .. "/info")
  return config
end

function checkBoxCollision(object,box)
  if object.position.x > box.size.width - object.size.width/2 then
    return true
  elseif object.position.x < 0 + object.size.width/2 then
    return true
  elseif object.position.z > box.size.depth then
    return true
  elseif object.position.z < 0 + object.size.depth then
    return true
  elseif object.position.y > box.size.height - object.size.height then
    return true
  elseif object.position.y < 0 then
    return true
  else
    return false
  end
end

function checkCollision(object,box)
  return checkBoxCollision(object,box)
end

function gravityToControllableObject(object, box)
  if box.gravity.surface ~= "none" and object.gravity_sensitive then
    object.gravity_time = object.gravity_time + DT

    posi= box.gravity.acceleration*object.gravity_time*object.gravity_time

    if box.gravity.surface == "down" then
      object.position.y = object.position.y - posi
      if checkCollision(object,box) then
        object.position.y = object.position.y + posi
        object.gravity_time = 0
      end
      if love.keyboard.isDown("a") and object.speed["y+"] > 0 then
        object.gravity_time = 0
      end
    elseif box.gravity.surface == "up" then
      object.position.y = object.position.y + posi
      if checkCollision(object,box) then
        object.position.y = object.position.y - posi
        object.gravity_time = 0
      end
      if love.keyboard.isDown("z") and object.speed["y-"] > 0 then
        object.gravity_time = 0
      end
    elseif box.gravity.surface == "left" then
      object.position.x = object.position.x - posi
      if checkCollision(object,box) then
        object.position.x = object.position.x + posi
        object.gravity_time = 0
      end
      if love.keyboard.isDown("right") and object.speed["x+"] > 0 then
        object.gravity_time = 0
      end
    elseif box.gravity.surface == "right" then
      object.position.x = object.position.x + posi
      if checkCollision(object,box) then
        object.position.x = object.position.x - posi
        object.gravity_time = 0
      end
      if love.keyboard.isDown("left") and object.speed["x-"] > 0 then
        object.gravity_time = 0
      end
    elseif box.gravity.surface == "background" then
      object.position.z = object.position.z - posi
      if checkCollision(object,box) then
        object.position.z = object.position.z + posi
        object.gravity_time = 0
      end
      if love.keyboard.isDown("down") and object.speed["z+"] > 0 then
        object.gravity_time = 0
      end
    end
  end

  function updateControllableObject(object, box)
    if love.keyboard.isDown(RIGHT) then
      object.position.x = object.position.x + object.speed["x+"]*DT
      if checkCollision(object,box) then
        object.position.x = object.position.x - object.speed["x+"]*DT
      end
    end
    if love.keyboard.isDown(LEFT) then
      object.position.x = object.position.x - object.speed["x-"]*DT
      if checkCollision(object,box) then
        object.position.x = object.position.x + object.speed["x-"]*DT
      end
    end
    if love.keyboard.isDown(UP) then
      object.position.z = object.position.z - object.speed["z-"]*DT
      if checkCollision(object,box) then
        object.position.z = object.position.z + object.speed["z-"]*DT
      end
    end
    if love.keyboard.isDown(DOWN) then
      object.position.z = object.position.z + object.speed["z+"]*DT
      if checkCollision(object,box) then
        object.position.z = object.position.z - object.speed["z+"]*DT
      end
    end
    if love.keyboard.isDown("z") then
      object.position.y = object.position.y - object.speed["y-"]*DT
      if checkCollision(object,box) then
        object.position.y = object.position.y + object.speed["y-"]*DT
      end
    end
    if love.keyboard.isDown("a") then
      object.position.y = object.position.y + object.speed["y+"]*DT
      if checkCollision(object,box) then
        object.position.y = object.position.y - object.speed["y+"]*DT
      end
    end
    if love.keyboard.isDown("x") or object.jump_time < 2*object.speed["jump"]/box.gravity.acceleration then
      if object.gravity_time == 0 and object.jump_time < 2*object.speed["jump"]/box.gravity.acceleration then
        object.jump_time = 2*object.speed["jump"]/box.gravity.acceleration
      else
        object.jump_time = object.jump_time - DT
        object.position.y = object.position.y + object.speed["jump"]*object.jump_time
      end
    end
  end
end
