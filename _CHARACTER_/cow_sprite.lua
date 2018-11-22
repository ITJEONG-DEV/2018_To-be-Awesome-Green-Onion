local physics = require "physics"

local cow_sprite = {}

local sheetOptions_cow =
{
    sheetContentWidth = 480,
    sheetContentHeight = 480,
    width = 160,
    height = 120,
    numFrames = 12
}

local sheet_cow = graphics.newImageSheet( "/_CHARACTER_/cow.png", sheetOptions_cow )

local sequence_cow =
{
    { name = "right", frames = { 1, 2, 3 }, time = 300, loopCount = 0 },
    { name = "left", frames = { 4, 5, 6 }, time = 300, loopCount = 0 },
    { name = "front", frames = { 7, 10 }, time = 150, loopCount = 0 },
    { name = "back", frames = { 8, 11 }, time = 150, loopCount = 0 },
}

function cow_sprite.makeSprite()
    physics.start()
    physics.setGravity( 0, 0 )

    local cow

    cow = display.newSprite( sheet_cow, sequence_cow )
    cow.name = "enemy"

    physics.addBody( cow, "static", (require "_CHARACTER_.cow").physicsData(1.0):get("sample2") )

    cow:play()

    function cow:setPos(x,y)
        cow.x, cow.y = x, y
    end

    function cow:addPos(x,y)
        cow.x, cow.y = cow.x + x, cow.y + y
    end

    function cow:setSequence(name)
        cow:setSequence(name)
    end

    return cow
end

return cow_sprite
