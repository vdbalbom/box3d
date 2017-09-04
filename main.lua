local character = require("character")
local global = require("global")

love.window.setMode(calcResolution(getBox().size.width),calcResolution(getBox().size.height))

function love.load()

end

function love.draw()
  setCharacter(SAMPLE)
end

function love.update(dt)
  DT = dt
  updateCharacter(SAMPLE)
end
