local physics = require "physics"
local keyboardModule = require "_CHARACTER_.keyboardModule"

local character_sprite = {}

local character, wall

local sheetOptions_character =
{
    sheetContentWidth = 432,
    sheetContentHeight = 192,
    width = 48,
    height = 48,
    numFrames = 36
}
local sheet_character = graphics.newImageSheet( "/_CHARACTER_/sprite_sample.png", sheetOptions_character )
local sequences_character =
{
    {
        name = "front",
        frames = { 28, 29, 30, 31 },
        time = 400,
        loopCount = 0,
    },
    {
        name = "back",
        frames = { 23, 24, 25, 24 },
        time = 400,
        loopCount = 0,
    },
    {
        name = "beside",
        frames = { 6, 7, 10, 11 },
        time = 400,
        loopCount = 0,
    }
}

local function makeWall()
    wall = {}

    -- top
    wall[#wall+1] = display.newRect( _MAX_WIDTH_ * 0.5, -10, _MAX_WIDTH_, 10 )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )

    -- left
    wall[#wall+1] = display.newRect( 210, _MAX_HEIGHT_ * 0.5, 420, _MAX_HEIGHT_ )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )

    -- bottom
    wall[#wall+1] = display.newRect( _MAX_WIDTH_ * 0.5, _MAX_HEIGHT_ + 10, _MAX_WIDTH_, 10 )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )
    wall[#wall+1] = display.newRect( 1920 - 210, _MAX_HEIGHT_ * 0.5, 420, _MAX_HEIGHT_ )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )
end

local function setPhysics()
    physics.start()
    physics.setGravity( 0, 0 )

end

local force_factor = 20

local function moveCharacter()
    local xForce, yForce = keyboardModule.getXY()
    character:setLinearVelocity( xForce * force_factor, yForce * force_factor )
    print( keyboardModule.getXY() )
end

function character_sprite.makeSprite(stage_number)
    setPhysics()
    if stage_number == 2 then
        makeWall()
    end
    character = display.newSprite( sheet_character, sequences_character )
    physics.addBody( character, "dynamic", { density = 2.0, friction = 0, bounce = 0 } )
    character.x, character.y = _MAX_WIDTH_ * 0.5, _MAX_HEIGHT_ * 0.5
    character:play()

    keyboardModule.startEvent()
    Runtime:addEventListener( "enterFrame", moveCharacter )

end

function character_sprite.startSprite()
    character:play()
end

function character_sprite.stopSprite()
    character:stop()
end

return character_sprite
