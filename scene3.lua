local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local font = require "_FONT_.font"

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

function pop_up_set()
    pop_up.setShapeType("rect")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapeColor("FF6600")
    pop_up.setShapeAlpha(1)
    pop_up.setTitle(
    {
        titleText = "my pop-up title",
        font = font.bold,
        textSize = 50,
        textColor = "FFFFFF"
    })
    pop_up.addContext(
    {
        contextType = "roundedRect",
        x = -1 * _MAX_WIDTH_ * 0.1,
        y = _MAX_HEIGHT_ * 0.05,
        width = 200,
        height = 250,
        radius = 20,
        color = "eeeeee"
    })
    pop_up.addContext(
    {
        contextType = "text",
        x = 1 * _MAX_WIDTH_*0.1,
        y =  _MAX_HEIGHT_ * 0.05,
        text = "my new context",
        textSize = 35,
        textColor = "ff0066",
        font = font.regular,
    })

    pop_up.open()
end

function initUI()
    pop_up_set()
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

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

        initUI()

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
