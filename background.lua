local contants = require("global")

function setBackground(type)
  if type == SAMPLE then
    sample()
  end
end

function sample()
  love.graphics.rectangle(LINE, 150, 150, 700, 700 )
  love.graphics.polygon(LINE, 0, 0, 150, 150, 850, 150, 1000, 0)
  love.graphics.polygon(LINE, 0, 1000, 150, 850, 850, 850, 1000, 1000)

  love.graphics.line(237.5, 850, 125, 1000)
  love.graphics.line(325, 850, 250, 1000)
  love.graphics.line(412.5, 850, 375, 1000)
  love.graphics.line(500, 850, 500, 1000)
  love.graphics.line(587.5, 850, 625, 1000)
  love.graphics.line(675, 850, 750, 1000)
  love.graphics.line(762.5, 850, 875, 1000)

  love.graphics.line(112.5, 887.5, 887.5, 887.5)
  love.graphics.line(75, 925, 925, 925)
  love.graphics.line(37.5, 962.5, 962.5, 962.5)
end
