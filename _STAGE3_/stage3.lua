local composer = require "composer"
local widget = require "widget"
local physcis = require "physics"
local pop_up = require "_POP_UP_.pop_up"
local font = require "_FONT_.font"


local scene = composer.newScene()

local _W = display.contentWidth
local i = 0

function force(n, r)
  if i > 60 * n then i = 0
  else
    xForce = math.cos(6/n*i)*r
    yForce = math.sin(6/n*i)*r
    i = i + 1
  end
  return xForce, yForce
end

function initUI(x,y)
  local speed = 1

  local rec = display.newImageRect("/_STAGE3_/쿼터-양2.png", 140, 100)
  rec.x = x
  rec.y = y + 240

  --[[local rec2 = display.newImageRect("Icon.png", 64, 64)
  rec2.x = x
  rec2.y = y + 340
  ]]
  
  local image = display.newImageRect("Icon.png", 100, 100)
  image.x = x
  image.y = y


  local move = function( event )
    if i == 0 then
      image.x = x
      image.y = y
    end
    speed_x , speed_y = force(280, 5)
    image.x = image.x + speed_x
    image.y = image.y + speed_y
  end

  Runtime:addEventListener( "enterFrame", move )
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
        physics.start()
        -- physics.setDrawMode( "hybrid" )

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        -- initUI()
        initUI(960,540)
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
