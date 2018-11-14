module("uiModule", package.seeall)

function createBtn()

	setBtn = display.newImageRect("아이콘_환경설정.png", 120, 120)
	setBtn.x = 1840
	setBtn.y = 80

	storeBtn = display.newImageRect("인벤토리 아이콘.png", 115,115)
	storeBtn.x = 1840
	storeBtn.y = 1003

end

function creaetLife()

	local life1 = display.newImageRect("아이콘_LIFE.png", 60, 54)
	life1.x = 80
	life1.y = 67

	local life2 = display.newImageRect("아이콘_LIFE.png", 60, 54)
	life2.x = 151
	life2.y = 67

	local life3 = display.newImageRect("아이콘_LIFE.png", 60, 54)
	life3.x = 225
	life3.y = 67

end

function createBar()

	local bar = display.newImageRect("bar.png", 360, 8)
	bar.x = 220
	bar.y = 114

end

function activeRect()

	local active = display.newImageRect("active.png", 50, 50)
	active.x = 75
	active.y = 158

end

function addListener()

	function setTouchListener(event)
		if ( event.phase == "began" ) then
			--셋팅은 클릭 이미지 없나용?
	    elseif ( event.phase == "ended" ) then
	    	--셋팅은 클릭 이미지 없나용?222
 	        --pop up setting dialog
 	   end
    return true

	end

	function storeTouchListener(event)
		if ( event.phase == "began" ) then
			display.newImageRect("인벤토리 아이콘_클릭.png", 115,115)
	    elseif ( event.phase == "ended" ) then
 	        display.newImageRect("인벤토리 아이콘.png", 115,115)
 	        --pop up inventory dialog
 	   end
    return true

	end

	setBtn:addEventListener( "touch", setTouchListener )
	storeBtn:addEventListener("touch", storeTouchListener)

end
