local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"

local inventory = {}

local _W = display.contentWidth

getItemNum = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } --getItemNum[n] : item_N 의 개수

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


function pop_up_set()
    pop_up.setShapeType("image")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setImageLink("/_INVENTORY_/INVENTORY_BG.png")
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

    inventory_Update()

    for i=1, 4, 1 do
        for j = 1, 3, 1 do
            if itemSortIndex[(i-1)*3+j] == 0 then
                pop_up.addContext(
                {
                    contextType = "button",
                    x = defaultX + 110*j,
                    y = defaultY + 110*i,
                    width = 70,
                    height = 70,
                    defaultFile = "/_INVENTORY_/테스트용버튼.png",
                    overFile = "/_INVENTORY_/테스트용버튼눌렸음.png",
                    onEvent = function(e)
                    if e.phase == "began" then
                        print ((i - 1) * 3 + j)
                    end
                end
                })
            else
                pop_up.addContext(
                {
                    contextType = "button",
                    x = defaultX + 110*j,
                    y = defaultY + 110*i,
                    width = 70,
                    height = 70,
                    defaultFile = "/_INVENTORY_/item".. (i-1)*3+j ..".png",
                    overFile = "/_INVENTORY_/item".. (i-1)*3+j .."_clicked.png",
                    onEvent = function(e)
                    if e.phase == "began" then
                        print ((i - 1) * 3 + j)
                    end
                end
                })
            end
        end
    end
    --[[
    pop_up.addContext(
    {
        contextType = "text",
        x = 1 * _MAX_WIDTH_*0.1,
        y =  _MAX_HEIGHT_ * 0,
        text = "my new context",
        textSize = 35,
        textColor = "66ff00",
        font = font.regular,
    })
    ]]
end

function addItem(item)
    itemSet[item] = itemSet[item] + 1
end

function pop_up_inventory()
    pop_up_set()
end

function inventory_Update()
    local itemSortIndex = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } --보유하고 있는 아이템의 번호를 차곡차곡 쌓습니다
    local cnt = 1
    for i = 1, 12, 1 do
        if getItemNum[i] == 1 then
            itemSortIndex[cnt] = i
            cnt = cnt + 1
        end
    end
end

function initUI()
    --[[for i=1, 12, 1 do
        print (itemSet[i])
    end]]
    pop_up_set()

    sample_button = widget.newButton({
        x = _MAX_WIDTH_ * 0.5,
        y = _MAX_HEIGHT_ * 0.5,
        width = 200,
        height = 200,
        defaultFile = "Icon.png",
        overFile = "Icon.png",
        onEvent = function(e)
            if e.phase == "ended" then
                pop_up.open()
            end
        end
    })


end

return inventory
