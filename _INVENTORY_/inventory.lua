local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"
local itemInfo = require "_ITEM_INFORMATION_.itemInfo"
local itemData = require "_ITEM_.item"

local inventory = {}
local itemNumber = {}
local getItemNum =    { 1, 2, 1, 1, 4, 1, 1, 1, 0, 0, 0, 0 }
local itemSortIndex = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } --보유하고 있는 아이템의 번호를 차곡차곡 쌓습니다
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

function sortIndex()
  itemSortIndex = {0,0,0,0,0,0,0,0,0,0,0,0}
  local cnt = 1
  for i = 1, 12, 1 do
    if getItemNum[i] ~= 0 then
      itemSortIndex[cnt] = i
      cnt = cnt + 1
    end
  end
  for i = 1, 12, 1 do
    --print(itemSortIndex[i])
  end
end

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
        if mx >= 815+110*j and my >= 365+110*i and mx <= 885+110*j and my <= 435+110*i and itemInfo.isOpen() == false and itemSortIndex[i*3+j+1] ~= 0 then
          nm = tostring(i*3 + j + 1) .. "번 아이템 설명창"
          print(nm)
          itemInfo.pop_up(itemSortIndex[i*3+j+1], 815+110*j, 365+110*i)
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
     --getItemNum[n] : item_N 의 개수
    sortIndex()

    for i=1, 4, 1 do
        for j = 1, 3, 1 do
            if itemSortIndex[(i-1)*3+j] > 0 then
              print "addbtn_"
              print((i-1)*3+j)
                local num = itemSortIndex[(i-1)*3+j]
                pop_up.addContext(
                {
                    contextType = "button",
                    x = defaultX + 110*j,
                    y = defaultY + 110*i,
                    width = 70,
                    height = 70,
                    --defaultFile = "/_INVENTORY_/item".. (i-1)*3+j ..".png",
                    --overFile = "/_INVENTORY_/item".. (i-1)*3+j .."_clicked.png",
                    defaultFile = itemData.getImage(num),
                    overFile = "/_INVENTORY_/테스트용버튼눌렸음.png",

                    onEvent = function(e)
                    if e.phase == "began" then
                        print ((i - 1) * 3 + j)
                        if getItemNum[num] > 0 then
                          getItemNum[num] = getItemNum[num] - 1
                        else
                          print "오류[inventory.lua]: 아이템을 다 소모했기 때문에 더이상 사용할 수 없습니다"
                        end
                        inventory_closed()
                    end
                end
                })
            end
        end
    end

    pop_up.open()

    for i=1, 4, 1 do
        for j = 1, 3, 1 do
            local num = itemSortIndex[(i-1)*3+j]
            if num ~= 0 and getItemNum[num] > 0 then
              itemNumber[(i-1)*3+j] = display.newText(getItemNum[num], 985 + defaultX + 110*j, 560 + defaultY + 110*i, font.bold, 20 )
              itemNumber[(i-1)*3+j]:setFillColor( 0, 0, 0 )
              itemNumber[(i-1)*3+j]:toFront()
            end
        end
    end

end

function inventory.addItem(item)
    itemSet[item] = itemSet[item] + 1
end

function inventory_closed()
  print "끝"
  stopMouse()

  for i=1, 12, 1 do
    local num = itemSortIndex[i]
    if num ~= 0 and getItemNum[num] > 0 then
      itemNumber[i]:removeSelf()
    end
  end

  pop_up.removeContext()
  if itemInfo.isOpen() then
    itemInfo.pop_down()
  end
  pop_up.close()

end

return inventory
