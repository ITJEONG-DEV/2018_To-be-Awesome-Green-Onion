local character_sprite = {}

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

character_sprite = display.newSprite( sheet_character, sequences_character )
character_sprite.x, character_sprite.y = _MAX_WIDTH_ * 0.5, _MAX_HEIGHT_ * 0.5
character_sprite:play()

return character_sprite
