local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"
local itemData = require "_ITEM_.item"

local itemInfo = {}

local _W = display.contentWidth

function inventory_closed()
  print "끝"
  pop_up.close()
end

function printf()
  print "f"
end

function itemInfo.itemInfoInit(item)
    pop_up.setCloseButtonFunction(inventory_closed)

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
      x = 0--[[= defaultX*0.5]],
      y = -10--[[= defaultY*0.5]],
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
