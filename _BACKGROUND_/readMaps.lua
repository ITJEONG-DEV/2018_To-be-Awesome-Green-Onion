local physics = require "physics"

local readMaps = {}

local drawingInfo, drawingWallInfo = {}, {}
local bg

local wall, floor = "_BACKGROUND_/2_1.png", "_BACKGROUND_/2_0.png"

local function drawing(content, i, j)
	drawingInfo[i][j] = display.newImage( floor, 440 + 40*(j-1), (content  == 0 and 20 or 0) + 40*(i-1) )

	if content == 1 then
		drawingWallInfo[i][j] = display.newImage( wall, 440 + 40*(j-1), 40*(i-1) )
		local physicsData = (require ("_BACKGROUND_.2_"..content) ).physicsData(1)

		physics.addBody( drawingInfo[i][j], "static",  physicsData:get(("obj")))
	end
end

function readMaps.readFile(stageNum)
	if stageNum < 1 or stageNum > 4 then
		print("Error : Invalid Stage")
		return
	end

	local path = system.pathForFile( "_BACKGROUND_/2_" .. stageNum .. ".txt", system.ResourceDirectory )

	local file, errorString = io.open( path, "r" )

	if not file then
		print( "Error : File Error " .. errorString )
		return
	end

	local content = 0

	bg = display.newImage("_BACKGROUND_/2_outside.png")

	for i = 1, 27, 1 do
		drawingInfo[i] = {}
		drawingWallInfo[i] = {}
		for j = 1, 27, 1 do
			content = file:read( "*n" )

			drawing( content, i, j )
		end
	end
end

local preOrder, order = 0, math.floor(27/2)
function readMaps.setLayer(x, y)
	preOrder = order
	order = math.floor(y / 40)

	if order < preOrder then
	elseif order > preOrder then
		for i = order, 27, 1 do
			for j = 1, 27, 1 do
				if drawingWallInfo[i][j] then
					drawingWallInfo[i][j]:toFront()
				end
			end
		end
	end
end

return readMaps
