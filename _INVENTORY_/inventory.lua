local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"
local itemInfo = require "_ITEM_INFORMATION_.itemInfo"

local inventory = {}
local itemSortIndex = { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 } --보유하고 있는 아이템의 번호를 차곡차곡 쌓습니다
local _W = display.contentWidth



--[[
***************item-list***************
- item_1:
- item_2:
- item_3:
- item_4:
- item_5:
- item_6:
- item_7:
- item_8:
- item_9:
- item_10:
- item_11:
- item_12:
]]

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


function ifMouseIsHover()
  local mx = 0
  local my = 0
  function onMouseEvent( event )
    -- Print the mouse cursor's current position to the log.
    local message = "Mouse Position = (" .. tostring(event.x) .. "," .. tostring(event.y) .. ")"
    mx = event.x
    my = event.y
    result = 0
    for i = 0,3,1 do
      for j = 0,2,1 do
        if mx >= 815+110*j and my >= 365+110*i and mx <= 885+110*j and my <= 435+110*i and itemInfo.isOpen() == false then
          nm = tostring(i*3 + j + 1) .. "번 아이템 설명창"
          print(nm)
          itemInfo.pop_up(1)
        end
      end
    end
  end
  -- Add the mouse event listener.
  Runtime:addEventListener( "mouse", onMouseEvent )

end

function stopMouse()
  Runtime:removeEventListener( "mouse", onMouseEvent )
end


function inventory.pop_up()
    pop_up.setCloseButtonFunction(inventory_closed)
    ifMouseIsHover()
    pop_up.setShapeType("image")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setImageLink("/_INVENTORY_/INVENTORY_배경_2.png")
    pop_up.setShapeAlpha(1)
    pop_up.setTitle(
    {
        titleText = "",
        font = font.bold,
        textSize = 50,
        textColor = "FFFFFF"
    })

    local defaultX = -220
    local defaultY = -250

    --inventory_Update()
    local getItemNum = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } --getItemNum[n] : item_N 의 개수
    local cnt = 1
    for i = 1, 12, 1 do
        if getItemNum[i] == 1 then
            itemSortIndex[cnt] = i
            cnt = cnt + 1
        end
    end

    for i=1, 4, 1 do
        for j = 1, 3, 1 do
            if itemSortIndex[(i-1)*3+j] ~= 0 then
                pop_up.addContext(
                {
                    contextType = "button",
                    x = defaultX + 110*j,
                    y = defaultY + 110*i,
                    width = 70,
                    height = 70,
                    --defaultFile = "/_INVENTORY_/item".. (i-1)*3+j ..".png",
                    --overFile = "/_INVENTORY_/item".. (i-1)*3+j .."_clicked.png",
                    defaultFile = "/_INVENTORY_/테스트용버튼.png",
                    overFile = "/_INVENTORY_/테스트용버튼눌렸음.png",
                    onEvent = function(e)
                    if e.phase == "began" then
                        print ((i - 1) * 3 + j)
                    end
                end
                })
            end
        end
    end
    pop_up.open()
end

function inventory.addItem(item)
    itemSet[item] = itemSet[item] + 1
end

function inventory_closed()
  print "끝"
  pop_up.close()
  stopMouse()
end

return inventory
