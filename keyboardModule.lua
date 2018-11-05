module("charMovementModule", package.seeall)

local speedX, speedY = 0,0   --x방향 속도와 y방향 속도
local a = 0.2                --가속도
local _MAX_SPEED_ = 10       --속도 한계값
local keyDown = ""           --y마지막으로 눌린 방향키를 저장합니다
local cnt = 0                --현재 눌린 방향키의 개수를 뜻합니다

function charMovementModule.getXy()--x좌표 속도와 y좌표 속도를 순서대로 반환합니다
	return speedX, speedY
end

function getForce() -- 키보드 입력과 그에 따른 속도 변화
	
	local function keyEventProcessor()                                 --enterframe function
		if(cnt == 0)then --[[ 아무것도 안 눌려있을 때 ]]
			speedX = 0
			speedY = 0
		end
		else --[[ 눌려있을때 ]]
			if(keyDown == "w")then
				if(speedY > 0)then
					speedY = speedY - a
				end
				else
					speedY = 0
				then
			end
			if(keyDown == "a")then
				if(speedX > 0)then
					speedX = speedX - a
				end
				else
					speedX = 0
				end
			then
			if(keyDown == "s")then
				if(speedY < _MAX_SPEED_)then
					speedY = speedY + a
				end
				else
					speedY = _MAX_SPEED_
				then
			end
			if(keyDown == "d")then
				if(speedX < _MAX_SPEED_)
					speedX = speedX + a
				end
				else
					speedY = _MAX_SPEED_
				then
			end
		end
	end


	local function onKeyEvent( event )                         --event function

    	if(event.keyName == "w")then
    		if(event.phase = "down")then
    			keyDown = "w"
    			cnt = cnt + 1
    		end
    		if(event.phase = "up")then
    			speedX = 0
    			speedY = 0
    			cnt = cnt - 1
    		end
    	end
    	if(event.keyName == "a")then
    		if(event.phase = "down")then
    			speedX = speedY - a
    			cnt = cnt + 1
    		end
    		if(event.phase = "up")then
    			speedX = 0
    			speedY = 0
    			cnt = cnt - 1
    		end
    	end
    	if(event.keyName == "s")then
    		if(event.phase = "down")then
    			speedY = speedY + a
    			cnt = cnt + 1
    		end
    		if(event.phase = "up")then
    			speedX = 0
    			speedY = 0
    			cnt = cnt - 1
    		end
    	end
		if(event.keyName == "d")then
    		if(event.phase = "down")then
    			speedX = speedX + a
    			cnt = cnt + 1
    		end
    		if(event.phase = "up")then
    			speedX = 0
    			speedY = 0
    			cnt = cnt - 1
    		end
    	end
 
    	-- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    	-- This lets the operating system execute its default handling of the key
    	return false
	end

	Runtime:addEventListener( "key", onKeyEvent )
	Runtime:addEventListener( "enterFrame", keyEventProcessor )

end