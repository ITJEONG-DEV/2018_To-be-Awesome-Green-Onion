local physics = require "physics"
local keyboardModule = require "_CHARACTER_.keyboardModule"

local character_sprite = {}

local character, wall

local pre_key

local sheetOptions_character =
{
    sheetContentWidth = 512,
    sheetContentHeight = 256,
    width = 64,
    height = 64,
    numFrames = 32
}
local sheet_character = graphics.newImageSheet( "/_CHARACTER_/sprite_sample.png", sheetOptions_character )
local sequences_character =
{
    {
        name = "front",
        frames = { 11 },
        time = 400,
        loopCount = 0,
    },
    {
        name = "back",
        frames = { 7 },
        time = 400,
        loopCount = 0,
    },
    {
        name = "right",
        frames = { 13, 24 },
        time = 400,
        loopCount = 0,
    },
    {
        name = "left",
        frames = { 8, 6 },
        time = 400,
        loopCount = 0
    }
}

function character_sprite.setSequenceName(name)

    if not pre_key or pre_key == name then
    else
        print("pre_key : ".. pre_key .. " name : " .. name )

        if name == "front" then
            character:setSequence("front")
        elseif name == "back" then
            character:setSequence("back")
        elseif name == "left" then
            character:setSequence("left")
        elseif name == "right" then
            character:setSequence("right")
        end

    end



    character:play()
end

local function makeWall(stage_number)
    wall = {}

    -- top
    wall[#wall+1] = display.newRect( _MAX_WIDTH_ * 0.5, -10, _MAX_WIDTH_, 10 )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )
    wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))

    if stage_number == 2 then
        -- left
        wall[#wall+1] = display.newRect( 210, _MAX_HEIGHT_ * 0.5, 420, _MAX_HEIGHT_ )
        physics.addBody( wall[#wall], "static", { bounce = 0 } )
        wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))

        wall[#wall+1] = display.newRect( 1920 - 210, _MAX_HEIGHT_ * 0.5, 420, _MAX_HEIGHT_ )
        physics.addBody( wall[#wall], "static", { bounce = 0 } )
        wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))
    else
        -- left
        wall[#wall+1] = display.newRect( -5, _MAX_HEIGHT_ * 0.5, 10, _MAX_HEIGHT_ )
        physics.addBody( wall[#wall], "static", { bounce = 0 } )
        wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))

        wall[#wall+1] = display.newRect( 1920 + 5, _MAX_HEIGHT_ * 0.5, 10, _MAX_HEIGHT_ )
        physics.addBody( wall[#wall], "static", { bounce = 0 } )
        wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))

    end

    -- bottom
    wall[#wall+1] = display.newRect( _MAX_WIDTH_ * 0.5, _MAX_HEIGHT_ + 10, _MAX_WIDTH_, 10 )
    physics.addBody( wall[#wall], "static", { bounce = 0 } )
    wall[#wall]:setFillColor(_CONVERT_COLOR_("000000"))

end

local function setPhysics()
    physics.start()
    physics.setGravity( 0, 0 )

end

local force_factor = 20

local function moveCharacter()
    local xForce, yForce = keyboardModule.getXY()
    character:setLinearVelocity( xForce * force_factor, yForce * force_factor )

    character.rotation = 0

    if xForce == 0 then
        if yForce > 0 then
            character_sprite.setSequenceName("front")
            pre_key = "front"
        elseif yForce < 0 then
            character_sprite.setSequenceName("back")
            pre_key = "back"
        end
    elseif xForce > 0 then
        character_sprite.setSequenceName("right")
        pre_key = "right"
    elseif xForce < 0 then
        character_sprite.setSequenceName("left")
        pre_key = "left"
    end
    -- print( keyboardModule.getXY() )
end

function character_sprite.makeSprite(stage_number)
    setPhysics()
    pre_key = "front"
    makeWall(stage_number)
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

function character_sprite.getPos()
    return character.x, character.y
end

return character_sprite
