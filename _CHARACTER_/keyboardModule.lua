local keyboardModule = {}

local speedX, speedY = 0, 0
local a = 0.2
local _MAX_SPEED_ = 10
local command_list = {}

function keyboardModule.getXY()
	return speedX, speedY
end

local function keyEventProcessor()

	if command_list["w"] == 1 then speedY = speedY - a end
	if command_list["a"] == 1 then speedX = speedX - a end
	if command_list["s"] == 1 then speedY = speedY + a end
	if command_list["d"] == 1 then speedX = speedX + a end

	if speedX < -1 * _MAX_SPEED_ then speedX = _MAX_SPEED_ * -1 end
	if speedX > _MAX_SPEED_ then speedX = _MAX_SPEED_ end
	if speedY < -1 * _MAX_SPEED_ then speedY = _MAX_SPEED_ * -1 end
	if speedY > _MAX_SPEED_ then speedY = _MAX_SPEED_ end

	if command_list["w"] == command_list["s"] then speedY = 0 end

	if command_list["a"] == command_list["d"] then speedX = 0 end

end

local function onKeyEvent( event )
	if event.phase == "down" then
		if event.keyName == "w" or event.keyName == "a" or event.keyName == "s" or event.keyName == "d" then
			command_list[event.keyName] = 1

			-- print( "down " .. event.keyName )
		end

	elseif event.phase == "up" then

		if event.keyName == "w" or event.keyName == "a" or event.keyName == "s" or event.keyName == "d" then
			command_list[event.keyName] = 0

			-- print( "up " .. event.keyName )
		end
	end
end

function keyboardModule.startEvent()
	command_list["w"] = 0
	command_list["a"] = 0
	command_list["s"] = 0
	command_list["d"] = 0
	
	Runtime:addEventListener("key",onKeyEvent)
	Runtime:addEventListener("enterFrame", keyEventProcessor)
end

function keyboardModule.endEvent()
	Runtime:removeEventListener("key",onKeyEvent)
	Runtime:removeEventListener("enterFrame", keyEventProcessor)
end

return keyboardModule
