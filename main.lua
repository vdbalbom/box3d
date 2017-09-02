local background = require("background")
local character = require("character")
local global = require("global")

local resolution = {wiDTh = 1000, height = 1000}

function love.load()
  love.window.setMode(resolution.wiDTh,resolution.height)
end

function love.draw()
  setBackground(SAMPLE)
  setCharacter(SAMPLE)
end

function love.update(dt)
  DT = dt
  updateCharacter(SAMPLE)
end
