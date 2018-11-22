local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"
local itemData = require "_ITEM_.item"

local itemInfo = {}
local info_isOpen = false
local _W = display.contentWidth

function ifMouseIsHovered(x, y)
  local mx = 0
  local my = 0
  function onMouse( event )
    -- Print the mouse cursor's current position to the log.
    local message = "Mouse Position = (" .. tostring(event.x) .. "," .. tostring(event.y) .. ")"
    mx = event.x
    my = event.y
    result = 0
    print(message)
    if mx < x or my < y or mx > x + 70 or my > y + 70 then
      itemInfo.pop_down()
    end
  end
  -- Add the mouse event listener.
  Runtime:addEventListener( "mouse", onMouse )
end

function itemInfo.isOpen()
  return info_isOpen
end

function itemInfo.pop_down()
  info_isOpen = false
  bg:removeSelf()
  title:removeSelf()
  itemText:removeSelf()
  itemEffect:removeSelf()
  Runtime:removeEventListener( "mouse", onMouse )
end

function itemInfo.pop_up(item, x, y)
  info_isOpen = true
  ifMouseIsHovered(x,y)
  print(x)
  print(y)

  bg = display.newImageRect( "/_ITEM_INFORMATION_/아이템 설명창.png", 550 , 370 )
  bg.x = x + 295 --960
  bg.y = y + 205 --540
  bg:toFront()

  title = display.newText( itemData.getItemName(item), x + 295, y + 90--[[430]], font.bold , 60)
  title:setFillColor( 1, 1, 1 )
  title:toFront()

  itemText = display.newText( itemData.getItemText(item), x + 295, y + 190--[[530]], font.regular, 35)
  itemText:setFillColor( 1, 1, 1 )
  itemText:toFront()

  itemEffect = display.newText( itemData.getItemEffect(item), x + 295,y + 290 --[[630]], font.regular, 35 )
  itemEffect:setFillColor( _CONVERT_COLOR_( itemData.getTextColor(item)) )
  itemEffect:toFront()

end
--[[
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
]]
return itemInfo
