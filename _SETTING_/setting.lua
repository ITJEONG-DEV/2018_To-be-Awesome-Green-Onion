local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"

local setting = {}

local head

local _W = display.contentWidth

function setting.settingInit()
    pop_up.setCloseButtonFunction(inventory_closed)

    pop_up.setShapeType("image")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setImageLink("/_SETTING_/Setting_글씨 있는 버전.png")
    pop_up.setShapeAlpha(1)
    pop_up.setTitle(
    {
        titleText = "",
        font = font.bold,
        textSize = 60,
        textColor = "FFFFFF"
    })

    local defaultX = -220
    local defaultY = -250

    pop_up.addContext(
    {
        contextType = "button",
        x = defaultX + 110,
        y = defaultY + 110,
        width = 150,
        height = 150,
        defaultFile = "/_INVENTORY_/테스트용버튼.png",
        overFile = "/_INVENTORY_/테스트용버튼눌렸음.png",
        onEvent = function(e)
        if e.phase == "began" then

        end
    end
    })

    pop_up.open()
end

return setting
