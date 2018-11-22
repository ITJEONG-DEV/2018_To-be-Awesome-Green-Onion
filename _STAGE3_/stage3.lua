local composer = require "composer"
local widget = require "widget"
local physcis = require "physics"
local pop_up = require "_POP_UP_.pop_up"
local font = require "_FONT_.font"
local character_sprite = require "_CHARACTER_.character_sprite"
local ui = require "_UI_.uiModule"
local chicken_sprite = require "_CHARACTER_.chicken_sprite"
local sheep_sprite = require "_CHARACTER_.sheep_sprite"
local cow_sprite = require "_CHARACTER_.cow_sprite"

local scene = composer.newScene()

local _W = display.contentWidth
local i = 0
local image, shadow = {}, {}
local life = 6

function force(n, r)
  if i > 60 * n then i = 0
  else
    xForce = math.cos(6/n*i)*r
    yForce = math.sin(6/n*i)*r
    i = i + 1
  end
  return xForce, yForce
end

function circle(x, y, j)
  local rec = sheep_sprite.makeSprite()
  rec.x = x
  rec.y = y + 240


  image[j] = chicken_sprite.makeSprite()
  image[j]:setPos(x, y)
  image[j].n = 1

  -- image[j]:setAngularVelopcity(50)

  local hi = image[j]

  function hi:enterFrame( event )
    image[j].n = image[j].n + 1
    if image[j].n > 8 then image[j].n = image[j].n - 8 end

    image[j]:setSequence( tostring(image[j].n) )
    image[j]:addPos(force(1500,5))
  end

  Runtime:addEventListener( "enterFrame", hi )

  function hi:delete()
      Runtime:removeEventListener("enterFrame", hi )
      image[j]:remove()
      rec:delete()
  end

end


function initUI(x,y)
  bg = display.newImageRect("/_STAGE3_/스테이지3_바닥.png", 1920, 1080)
  bg.x = 960
  bg.y = 540
  bg:toBack()

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

  cow = cow_sprite.makeSprite()
  cow.x = 1350
  cow.y = 540

  ultari1 = display.newImageRect("/_STAGE3_/배경_스테이지3_위.png", 1920, 540)
  ultari1.x = 960
  ultari1.y = 270

  ultari2 = display.newImageRect("/_STAGE3_/배경_스테이지3_아래.png", 1920, 540)
  ultari2.x = 960
  ultari2.y = 810

  ui.on()
end

local function newScene()
    physics.stop()
    Runtime:removeEventListener("collision", onGlobalCollision)
    character_sprite:delete()
    ui.off()
    if ultari2 then ultari2:removeSelf() end
    if ultari1 then ultari1:removeSelf() end
    if cow then cow:delete() end
    if bg then bg:removeSelf() end

    for i = 1, 6, 1 do
        if image[i] then
            local hi = image[i]
            hi.delete()
        end
    end

    composer.gotoScene( "_GAME_OVER_.gameOver" )
    print("hihoho")
end

function onGlobalCollision( e )
    if e.phase == "began" then
        if e.object1.name == "character" and e.object2.name == "enemy" or e.object1.name == "enemy" and e.object2.name == "character" then
            -- collision with enemy
            print "collision with enemy!"
            life = life - 1
            if life == 0 then
                newScene()
            else ui.setLife(life)
            end
        end
    end

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
        physics.setGravity(0,0)
        physics.setDrawMode( "hybrid" )

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        -- initUI()
        initUI(960,540)
        ui.setLife(6)
        character_sprite.makeSprite(3)
        character_sprite.setPos( 100, _MAX_HEIGHT_ * 0.5)

        Runtime:addEventListener("collision", onGlobalCollision)
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
