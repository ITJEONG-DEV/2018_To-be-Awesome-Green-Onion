local composer = require( "composer" )
local font = require ("_FONT_.font")
local widget = require "widget"
local music = require "_MUSIC_.music"

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local text, img1, bg, bg2, bg3

local function onClickButton(e)
    if e.phase == "began" then
        text.alpha = 1
        img1.alpha = 1
    elseif e.phase == "ended" then
        text.alpha = 0
        img1.alpha = 0
        text:removeSelf()
        img1:removeSelf()
        bg:removeSelf()
        bg2:removeSelf()
        bg3:removeSelf()
        music.stop()
        composer.gotoScene( "_STAGE2_.stage2" )
    end
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    music.setAudio(0)
    music.loadStream()

    bg = display.newRect( 0, 0, _MAX_WIDTH_, _MAX_HEIGHT_ )
    bg.x, bg.y = _MAX_WIDTH_ * 0.5, _MAX_HEIGHT_ * 0.5
    bg:toFront()
    bg:setFillColor(_CONVERT_COLOR_("222222"))

    bg2 = widget.newButton({
        x = 960,
        y = 660,
        defaultFile = "_GAME_START_/tmp4.png",
        overFile = "_GAME_START_/tmp.png",
        onEvent = onClickButton
    })
    bg2:toFront()

    bg2.x, bg2.y = 960, 660
    bg2:scale(3,3)

    bg3 = display.newText( "To be Awesome Green Onion!", 960, 250, font.bold, 100 )

    text = display.newText("game start!", 1320, 625, font.regular, 70)
    text.alpha = 0

    img1 = display.newImage("_GAME_START_/tmp2.png")
    img1:scale(2,2)
    img1.x, img1.y = 1320, 500

    img1.alpha = 0
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the sce  ne is still off screen (but is about to come on screen)
        music.play()

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

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
