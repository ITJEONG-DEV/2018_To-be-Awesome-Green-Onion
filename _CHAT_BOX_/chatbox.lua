local composer = require "composer"
local pop_up = require "_POP_UP_.pop_up"
local widget = require "widget"
local font = require "_FONT_.font"

local chatbox = {}

function chatbox.pop_chatbox(name, message)
  timer.performWithDelay(20, function(event) chatbox.chatboxInit(name, message, event.count+1) end,string.len(message)-1)
end

function chatbox.chatboxInit(name, message, num)
    pop_up.setCloseButtonFunction(inventory_closed)

    pop_up.setShapeType("image")
    pop_up.setShapeSize(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setShapePosition(_MAX_WIDTH_*0.5, _MAX_HEIGHT_*0.5)
    pop_up.setImageLink("/_CHAT_BOX_/Main_UI_대화창_후면.png")
    pop_up.setShapeAlpha(1)
    pop_up.setTitle(
    {
        titleText = "",
        font = font.bold,
        textSize = 50,
        textColor = "FFFFFF"
    })

    local defaultX = -220
    local defaultY = -250

    pop_up.addContext(
    {
      contextType = "text",
      x = -700,
      y = 290,
      text = name,
      textSize = 50,
      textColor = "FFFFFF",
      font = font.bold,
    })



    ms = string.sub(message, 1, num)

    pop_up.addContext(
    {
      contextType = "text",
      x = -700 + num*5.75,
      y = 380,
      text = ms,
      textSize = 40,
      textColor = "FFFFFF",
      font = font.regular,
    })



    pop_up.open()
end

return chatbox
