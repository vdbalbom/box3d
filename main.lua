local box_controller = require("box_controller")
local character_controller = require("character_controller")
local global = require("global")

love.window.setMode(calcResolution(getBox().size.width),calcResolution(getBox().size.height))

function love.load()

end

function love.draw()
  drawBox()
  drawCharacter()
end

function love.update(dt)
  DT = dt
  updateCharacter()
end
