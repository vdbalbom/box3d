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
RESOLUTION = 1000

function calcResolution(number)
  return number*RESOLUTION/1000
end

function getBox()
  require("sample/levels/" .. CURRENT_LEVEL .. "/info")
  require("sample/boxes/" .. level.box .. "/info")
  return box
end
