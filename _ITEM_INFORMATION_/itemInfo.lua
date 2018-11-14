local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"
local itemData = require "_ITEM_.item"

local itemInfo = {}
local info_isOpen = false
local _W = display.contentWidth

function itemInfo.isOpen()
  return info_isOpen
end

function closed()
  print "끝"
  info_isOpen = false
  pop_up.close()
end

function printf()
  print "f"
end

function itemInfo.pop_up(item)
    pop_up.setCloseButtonFunction(closed)
    info_isOpen = true
    pop_up.setShapeType("image")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setImageLink("/_ITEM_INFORMATION_/아이템 설명창.png")
    pop_up.setShapeAlpha(1)
    pop_up.setTitle(
    {
        titleText = itemData.getItemName(item),
        font = font.bold,
        textSize = 60,
        textColor = "FFFFFF"
    })

    local defaultX = -220
    local defaultY = -250

    pop_up.addContext(
    {
      contextType = "text",
      x = 0,
      y = -10,
      text = itemData.getItemText(item),
      textSize = 35,
      textColor = "FFFFFF",
      font = font.regular,
    })

    pop_up.addContext(
    {
      contextType = "text",
      x = 0,
      y = 90,
      text = itemData.getItemEffect(item),
      textSize = 35,
      textColor = itemData.getTextColor(item),
      font = font.regular,
    })

    pop_up.open()
end

return itemInfo
