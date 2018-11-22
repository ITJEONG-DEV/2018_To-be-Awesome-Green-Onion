local physics = require "physics"

local chicken_sprite = {}

local character, wall, shadow

local sheetOptions_chicken =
{
    sheetContentWidth = 320,
    sheetContentHeight = 160,
    width = 80,
    height = 80,
    numFrames = 8
}

local sheet_chicken = graphics.newImageSheet( "/_CHARACTER_/chicken.png", sheetOptions_chicken )

local sequences_chicken =
{
    { name = "1", frames = { 1 }, time = 10, loopCount = 0 },
    { name = "2", frames = { 2 }, time = 10, loopCount = 0 },
    { name = "3", frames = { 3 }, time = 10, loopCount = 0 },
    { name = "4", frames = { 4 }, time = 10, loopCount = 0 },
    { name = "5", frames = { 5 }, time = 10, loopCount = 0 },
    { name = "6", frames = { 6 }, time = 10, loopCount = 0 },
    { name = "7", frames = { 7 }, time = 10, loopCount = 0 },
    { name = "8", frames = { 8 }, time = 10, loopCount = 0 },
}

function chicken_sprite.makeSprite()

    physics.start()
    physics.setGravity(0, 0)

    local chicken

    chicken = display.newSprite( sheet_chicken, sequences_chicken )
    chicken.name = "enemy"

    physics.addBody( chicken, "static", (require "_CHARACTER_.chicken").physicsData(1.0):get("sample"))

    function chicken:setPos(x,y)
        chicken.x, chicken.y = x, y
    end

    function chicken:addPos(x,y)
        chicken.x, chicken.y = chicken.x + x, chicken.y + y
    end

    function chicken:setSequence(n)
        chicken:setSequence(n)
    end

    function chicken:remove()
        physics.stop()
        physics.removeBody( chicken )
        if chicken then chicken:removeSelf() end
    end

    chicken:setPos(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)

    return chicken
end

return chicken_sprite
