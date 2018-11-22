local widget = require "widget"

local object = {}

context = {}
local index = 1

function object.new(imageUrl, width, height, x, y)
  context[index] = display.newImageRect(imageUrl, width, height)
  context[index].x = x
  context[index].y = y
  context[index]:toFront()
  index = index + 1
end

return object
