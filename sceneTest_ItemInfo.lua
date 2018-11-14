local composer = require "composer"
local widget = require "widget"
local pop_up = require "_POP_UP_.pop_up"
local font = require "_FONT_.font"
local itemData = require "_ITEM_.item"
local itemInfo = require "_ITEM_INFORMATION_.itemInfo"
local chatbox = require "_CHAT_BOX_.chatbox"
local setting = require "_SETTING_.setting"

local scene = composer.newScene()

local _W = display.contentWidth

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the sce  ne is still off screen (but is about to come on screen)
        -- physics.setDrawMode( "hybrid" )

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        -- initUI()

        local myRectangle = display.newRect( 960, 540 , 1920, 1080)
        myRectangle.strokeWidth = 3
        myRectangle:setFillColor( 0.5 )

        --itemInfo.itemInfoInit(6)
        --chatbox.chatboxInit("???", "abcdefg")
        ----chatbox.pop_chatbox("???", "가나다라마바사아자차카타파하.")

        setting.settingInit()

        --itemInfo.printf()
        --[[ms = itemDAta.getItemName(1)
        print(ms)]]
    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
