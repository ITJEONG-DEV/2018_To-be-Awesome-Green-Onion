local inventory = require "_INVENTORY_.inventory"

local uiModule = {}

activeData = {"","",""}

function createBtn()

	setBtn = display.newImageRect("/_UI_/아이콘_환경설정.png", 120, 120)
	setBtn.x = 1840
	setBtn.y = 80

	storeBtn = display.newImageRect("/_UI_/인벤토리 아이콘.png", 115,115)
	storeBtn.x = 1840
	storeBtn.y = 1003
	function storeBtnTouch(event)
		if ( event.phase == "began" ) then
			print( "Touch" )
			--uiModule.off()
		elseif ( event.phase == "ended" ) then
			inventory.pop_up()
		end
	return true
	end
	storeBtn:addEventListener( "touch", storeBtnTouch )

end

function createLife()
	life = {}
	for i = 1,3,1 do
		life[i] = display.newImageRect("/_UI_/아이콘_LIFE.png", 60, 54)
		life[i].x = 80 + (i-1)*70
		life[i].y = 67
	end
end

function createBar()

	bar = display.newImageRect("/_UI_/bar.png", 360, 8)
	bar.x = 220
	bar.y = 114

end

function activeRect()

	active = display.newImageRect("/_UI_/active.png", 50, 50)
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
			display.newImageRect("/_UI_/인벤토리 아이콘_클릭.png", 115,115)
	  elseif ( event.phase == "ended" ) then
 	    display.newImageRect("/_UI_/인벤토리 아이콘.png", 115,115)
 	        --pop up inventory dialog
 	  end
    return true
	end
	setBtn:addEventListener( "touch", setTouchListener )
	storeBtn:addEventListener("touch", storeTouchListener)
end

function uiModule.on()
	createBtn()
	createLife()
	createBar()
	activeRect()
	--addListener()
end

function uiModule.off()
  setBtn:removeSelf()
	storeBtn:removeSelf()
	life[1]:removeSelf()
	life[2]:removeSelf()
	life[3]:removeSelf()
	bar:removeSelf()
	active:removeSelf()
end

function uiModule.setLife(num) -- num: 0 ~ 6
	if num < 0 or num > 6 then
		print "오류: 범위에 맞지 않는 숫자입니다[생명력]"
		return
	end
	life[1]:removeSelf()
	life[2]:removeSelf()
	life[3]:removeSelf()
	life[1].x = 80
	life[1].y = 67
	life[2].x = 151
	life[2].y = 67
	life[3].x = 225
	life[3].y = 67
	for i = 1, num/2, 1 do
		life[i] = display.newImageRect("/_UI_/아이콘_LIFE.png", 60, 54)
		life[i].x = 80 + (i-1)*70
		life[i].y = 67
	end
	if num % 2 == 1 then
		m = tostring(num/2+0.5)
		print(m)
		life[num/2+0.5] = display.newImageRect("/_UI_/아이콘_LIFE2.png", 60, 54)
		life[num/2+0.5].x = 80 + (num/2-0.5)*70
		life[num/2+0.5].y = 67
	end
end

return uiModule
