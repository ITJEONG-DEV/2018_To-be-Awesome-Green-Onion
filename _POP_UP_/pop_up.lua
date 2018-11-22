local pop_up = {}
local font = require "_FONT_.font"
local widget = require "widget"

local isOpen = false
local this =
{
    shapeType = "rect",
    width = _MAX_WIDTH_ * 0.5,
    height = _MAX_HEIGHT_ * 0.5,
    x = _MAX_WIDTH_ * 0.5,
    y = _MAX_HEIGHT_ * 0.5,
    imageLink = nil,
    color = "ffffff",
    alpha = 1,
    enabled = true,
    title =
        {
            titleText = "untitled",
            font = font.bold,
            textSize = 20,
            textColor = "000000"
        },
    context =
    {
    },
    onClickCloseButton = function()
        if event.phase == "ended" then
            pop_up.close()
        end
    end
}

pop_up.context = {}

local displayBox, displayTitle, displayContext

function pop_up.setShapeType(shapeType)
    print(shapeType)
    if shapeType == "rect" then
        this.shapeType = "rect"
    elseif shapeType == "roundedRect" then
        this.shapeType = "roundedRect"
    elseif shapeType == "image" then
        this.shapeType = "image"
    end
end
function pop_up.setShapeSize(width, height)
    if width > 0 and width <= _MAX_WIDTH_ then
        this.width = width
    else
        print "Invalid Value: width"
    end

    if height > 0 and height <= _MAX_HEIGHT_ then
        this.height = height
    else
        print "Invalid Value: height"
    end
end
function pop_up.setShapePosition(x, y)
    if x + this.width * 0.5 <= _MAX_WIDTH_ and x - this.width * 0.5 >= 0 then
        this.x = x
    else
        print "Invalid Value : x"
    end

    if y + this.height * 0.5 <= _MAX_HEIGHT_ and y - this.height * 0.5 >= 0 then
        this.y = y
    else
        print "Invalid Value : y"
    end
end
function pop_up.setImageLink(imageLink)
    if this.shapeType == "image" then
        this.imageLink = imageLink
    else
        this.imageLink = nil
        print "pop_up type is not image"
    end
end
function pop_up.setShapeColor(color)
    if this.shapeType == "rect" or this.shapeType == "roundedRect" then
        this.color = color
    else
        this.color = nil
        print "pop_up type is not rect or roundedRect"
    end
end
function pop_up.setShapeAlpha(alpha)
    if alpha >= 0 and alpha <= 1 then
        this.alpha = 1
    end
end
function pop_up.setCloseButton(enabled)
    if enabled == true then
        this.enabled = true
    else
        this.enabled = false
    end
end
function pop_up.setTitle(context)
    if context then

        if context.titleText then
            this.title.titleText = context.titleText
        else
            print "Nil Value : context.titleText"
            return
        end

        if context.font then
            this.title.font = context.font
        else
            print "Nil Value : context.font"
            return
        end

        if context.textSize then
            this.title.textSize = context.textSize
        else
            print "Nil Value : context.font"
            return
        end

        if context.textColor then
            this.title.textColor = context.textColor
        else
            print "Nil Value : context.textColor"
            return
        end

    else
        print "Nil Value : context"
    end
end
function pop_up.addContext(context)
    if context then

        local index = #this.context + 1

        this.context[index] = {}

        if context.contextType then
            this.context[index].contextType = context.contextType
        else
            print "Nil Value : context.contextType"
            return
        end

        if context.x then
            this.context[index].x = context.x
        else
            print "Nil Value : context.x"
            return
        end

        if context.y then
            this.context[index].y = context.y
        else
            print "Nil Value : y"
            return
        end

        if context.contextType == "text" then

            if context.text then
                this.context[index].text = context.text
            else
                print "Nil Value : context.text"
                return
            end

            if context.textSize then
                this.context[index].textSize = context.textSize
            else
                print "Nil Value : context.textSize"
                return
            end

            if context.textColor then
                this.context[index].textColor = context.textColor
            else
                print "Nil Value : context.textColor"
                return
            end

            if context.font then
                this.context[index].font = context.font
            else
                print "Nil Value : context.font"
                return
            end

        elseif context.contextType == "rect" then

            if context.width then
                this.context[index].width = context.width
            else
                print "Nil Value : context.width"
                return
            end

            if context.height then
                this.context[index].height = context.height
            else
                print "Nil Value : context.height"
                return
            end

            if context.color then
                this.context[index].color = context.color
            else
                print "Nil Value : context.color"
                return
            end

        elseif context.contextType == "roundedRect" then

            if context.width then
                this.context[index].width = context.width
            else
                print "Nil Value : context.width"
                return
            end

            if context.height then
                this.context[index].height = context.height
            else
                print "Nil Value : context.height"
                return
            end

            if context.radius then
                this.context[index].radius = context.radius
            else
                print "Nil Value : context.radius"
            end

            if context.color then
                this.context[index].color = context.color
            else
                print "Nil Value : context.color"
                return
            end

        elseif context.contextType == "image" then

            if context.width then
                this.context[index].width = context.width
            else
                print "Nil Value : context.width"
                return
            end

            if context.height then
                this.context[index].height = context.height
            else
                print "Nil Value : context.height"
                return
            end

            if context.imageLink then
                this.context[index].imageLink = context.imageLink
            else
                print "Nil Value : context.imageLink"
                return
            end

        elseif context.contextType == "button" then

            if context.width then
                this.context[index].width = context.width
            else
                print "Nil Value : context.width"
                return
            end

            if context.height then
                this.context[index].height = context.height
            else
                print "Nil Value : context.height"
                return
            end

            if context.defaultFile then
                this.context[index].defaultFile = context.defaultFile
            else
                print "Nil Value : context.defaultFile"
                return
            end

            if context.overFile then
                this.context[index].overFile = context.overFile
            else
                print "Nil Value : context.overFile"
                return
            end

            if context.onEvent then
                this.context[index].onEvent = context.onEvent
            else
                print "Nil Value : context.onEvent"
                return
            end
        end
    else
        print "Nil Value : context"
        return
    end
end
function pop_up.setCloseButtonFunction(onClickCloseButton)
    this.onClickCloseButton = onClickCloseButton
end
function pop_up.removeContext()
  -- 1 : box
  -- 2 : title
  -- index + 2
  for i = 3, this.enabled and #this.context - 1 or #this.context, 1 do
    this.context[i+2] = nil
  end

end
function displayBox()
    print ("haha "..this.shapeType)
    if this.shapeType == "rect" then
        pop_up.context[1]    = display.newRect( this.x, this.y, this.width, this.height )
        pop_up.context[1]:setFillColor( _CONVERT_COLOR_(this.color) )

    elseif this.shapeType == "roundedRect" then
        pop_up.context[1] = display.newRoundedRect( this.x, this.y, this.width, this.height, this.radius )
        pop_up.context[1]:setFillColor( _CONVERT_COLOR_(this.color) )
        pop_up.context[1].alpha = this.alpha

    elseif this.shapeType == "image" then
        pop_up.context[1] = display.newImage( this.imageLink, this.x, this.y)
        pop_up.context[1].alpha = this.alpha
    end
end
function displayTitle()
    pop_up.context[2] = display.newText( this.title.titleText, pop_up.context[1].x, pop_up.context[1].y - pop_up.context[1].contentHeight*0.5 + this.title.textSize*1.2, this.title.font, this.title.textSize)
    pop_up.context[2]:setFillColor(_CONVERT_COLOR_(this.title.textColor))
end
function displayContext()
    for i=1, #this.context, 1 do

        if not this.context[i] then
            return
        end

        if this.context[i].contextType == "text" then
            pop_up.context[i+2] = display.newText( this.context[i].text, pop_up.context[1].x + this.context[i].x, pop_up.context[1].y + this.context[i].y, this.context[i].font, this.context[i].textSize )
            pop_up.context[i+2]:setFillColor( _CONVERT_COLOR_(this.context[i].textColor) )

        elseif this.context[i].contextType == "rect" then
            pop_up.context[i+2] = display.newRect( pop_up.context[1].x + this.context[i].x, pop_up.context[1].y + this.context[i].y, this.context[i].width, this.context[i].height )
            pop_up.context[i+2]:setFillColor( _CONVERT_COLOR_(this.context[i].color) )

        elseif this.context[i].contextType == "roundedRect" then
            pop_up.context[i+2] = display.newRoundedRect( pop_up.context[1].x + this.context[i].x, pop_up.context[1].y + this.context[i].y, this.context[i].width, this.context[i].height, this.context[i].radius )
            pop_up.context[i+2]:setFillColor( _CONVERT_COLOR_(this.context[i] .color) )

        elseif this.context[i].contextType == "image" then
            pop_up.context[i+2] = display.newImage( this.context[i].imageLink, pop_up.context[1].x + this.context[i].x, pop_up.context[1].y + this.context[i].y )

        elseif this.context[i].contextType == "button" then
            pop_up.context[i+2] = widget.newButton({
                x = this.context[i].x + pop_up.context[1].x,
                y = this.context[i].y + pop_up.context[1].y,
                width = this.context[i].width,
                height = this.context[i].height,
                defaultFile = this.context[i].defaultFile,
                overFile = this.context[i].overFile,
                onEvent = this.context[i].onEvent
            })

        end
    end
end
function displayCloseButton()

    if this.enabled then
        local i = #pop_up.context + 1
        local closeButton_width = ( pop_up.context[1].contentWidth > pop_up.context[1].contentHeight and pop_up.context[1].contentHeight or pop_up.context[1].contentWidth ) * 0.1

        local button_info =
        {
            x = pop_up.context[1].x + pop_up.context[1].contentWidth * 0.5 - closeButton_width,
            y = pop_up.context[1].y - pop_up.context[1].contentHeight * 0.5 + closeButton_width,
            width = closeButton_width,
            height = closeButton_width,
            defaultFile = "Icon.png",
            overFile = "Icon.png",
            onEvent = this.onClickCloseButton
        }

        pop_up.context[i] = widget.newButton(button_info)
    end
end
function pop_up.IsOpen()
  return isOpen
end
function pop_up.open()
    displayBox()
    displayTitle()
    displayContext()
    displayCloseButton()
    isOpen = true
end

function pop_up.close()
    print "press close button"
    for i = 1, #pop_up.context, 1 do
        pop_up.context[i]:removeSelf()
    end
    isOpen = false
end

return pop_up
