local physics = require "physics"

local sheep_sprite = {}

local sheetOptions_sheep =
{
    sheetContentWidth = 280,
    sheetContentHeight = 100,
    width = 140,
    height = 100,
    numFrames = 2
}

local sheet_sheep = graphics.newImageSheet( "/_CHARACTER_/sheep.png", sheetOptions_sheep )

local sequences_sheep =
{
    { name = "normal", frames = { 2, 2, 1, 2, 2, 2 }, time = 1500, loopCount = 0 }
}

function sheep_sprite.makeSprite()
    physics.start()
    physics.setGravity( 0, 0 )

    local sheep

    sheep = display.newSprite( sheet_sheep, sequences_sheep )
    sheep.name = "enemy"

    physics.addBody( sheep, "static", (require "_CHARACTER_.sheep").physicsData(1.0):get("sheep"))

    sheep:play()

    return sheep
end

return sheep_sprite
