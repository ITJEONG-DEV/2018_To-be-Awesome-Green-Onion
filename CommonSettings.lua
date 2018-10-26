_MAX_WIDTH_ = display.contentWidth
_MAX_HEIGHT_ = display.contentHeight

function _CONVERT_COLOR_(hex)
    local r = tonumber( hex:sub(1, 2), 16 ) / 255
    local g = tonumber( hex:sub(1, 2), 16 ) / 255
    local b = tonumber( hex:sub(1, 2), 16 ) / 255
    local a

    if #hex == 8 then
        a = tonumber( hex:sub(7, 8), 16 ) / 255
    else
        a = 255 / 255
    end

    return r, g, b, a
end
