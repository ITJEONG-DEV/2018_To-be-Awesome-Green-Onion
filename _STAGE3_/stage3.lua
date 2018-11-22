local composer = require "composer"
local widget = require "widget"
local physcis = require "physics"
local pop_up = require "_POP_UP_.pop_up"
local font = require "_FONT_.font"
local ui = require "_UI_.uiModule"
local object = require "_STAGE3_.object"

local scene = composer.newScene()

local _W = display.contentWidth
local i = 0
local image = {}

function force(n, r)
  if i > 60 * n then i = 0
  else
    xForce = math.cos(6/n*i)*r
    yForce = math.sin(6/n*i)*r
    i = i + 1
  end
  return xForce, yForce
end

function circle(x,y, j)
  local rec = display.newImageRect("/_STAGE3_/쿼터-양2.png", 200, 150)
  rec.x = x
  rec.y = y + 240

  image[j] = display.newImageRect("/_STAGE3_/한마리 닭 최종.png", 180, 100)
  image[j].x = x
  image[j].y = y


  local move = function( event )
    if i == 0 then
      image[j].x = x
      image[j].y = y
    end
    local speed_x , speed_y = force(1500, 5)
    image[j].x = image[j].x + speed_x
    image[j].y = image[j].y + speed_y
  end

  Runtime:addEventListener( "enterFrame", move )

end

function initUI(x,y)
  object.new("/_STAGE3_/오른쪽-걷는-양파1.png", 300, 300, 1000, 500)

  bg = display.newImageRect("/_STAGE3_/스테이지3_바닥.png", 1920, 1080)
  bg.x = 960
  bg.y = 540

  local speed = 1
  --[[local rec2 = display.newImageRect("Icon.png", 64, 64)
  rec2.x = x
  rec2.y = y + 340
  ]]

  circle(x, 0, 2)
  circle(x, y, 1)

  circle(x-600, 0, 3)
  circle(x-600, y, 4)

  circle(x+600, 0, 5)
  circle(x+600, y, 6)

  cow = display.newImageRect("/_STAGE3_/쿼터-소.png", 250, 160)
  cow.x = 960 - 910
  cow.y = 540

  char = display.newImageRect("/_STAGE3_/오른쪽-걷는-양파1.png", 80, 80)
  char.x = 960
  char.y = 540


  ultari1 = display.newImageRect("/_STAGE3_/배경_스테이지3_위.png", 1920, 540)
  ultari1.x = 960
  ultari1.y = 270

  ultari2 = display.newImageRect("/_STAGE3_/배경_스테이지3_아래.png", 1920, 540)
  ultari2.x = 960
  ultari2.y = 810

  ui.on()
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
