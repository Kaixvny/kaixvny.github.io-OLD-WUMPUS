--easy configs--
missLimit = 10 --this is the miss limit, if you put the value 0 you will die instantly, so dont put 0
cantDie = false --if the value is true you can only die by the miss limit
showHealthBar = true --if the value is false the health bar will not be shown
textSize = 30 --da text size


--da code--
function onCreate()
	makeLuaText('limitText', 'Miss limit:', 300, 20, 670)
	setTextAlignment('limitText', 'left')
	setObjectCamera('limitText', 'hud')
	setTextSize('limitText', textSize)
	setProperty('limitText.alpha', 0)
	addLuaText('limitText')

	makeLuaText('limit', missLimit, 300, 230, 670)
	setTextAlignment('limit', 'left')
	setObjectCamera('limit', 'hud')
	setTextSize('limit', textSize)
	setProperty('limit.alpha', 0)
	addLuaText('limit')
end

function onUpdate()
	if misses >= missLimit then
		setProperty('health', 0)
	end
	if cantDie == true then
    	if getProperty('health') <= 0.1 then
      	  setProperty('health', 0.025)
    	end
	end
	if showHealthBar == false then
		setProperty('healthBarBG.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
	end
end

function onSongStart()
	doTweenAlpha('limitTextTween', 'limitText', 1, 0.5, linear)
	doTweenAlpha('limitTween', 'limit', 1, 0.3, linear)
end


-- Script by TKTems

-- To use the script, use drainHealth(angle of the healthbar, health loss).
-- Use resetHealth() after every usage so the healthbar starts working normally again.
-- IMPORTANT: MAKE SURE TO ADD AN "curStep > *when you want it to stop*" when using the drainHealth function. 
-- I am not a good LUA coder and this may break if you don't follow what I say.
if curStep == 50 then

local hp;
local iconY;
local barDraining;

function onCreate()
	local isDownscroll = getPropertyFromClass('ClientPrefs', 'downScroll')
	if isDownscroll == true then
		iconY = 8
	end
	if isDownscroll == false then
		iconY = 570
	end
end

function onUpdate()
    hp = getProperty('health')

    if hp > 2 then
	hp = 2
    end
end


function drainHealth(angle, loss)
	doTweenAngle('drainBarHP', 'healthBar', angle, 0.1, 'linear')
        doTweenAngle('drainBarIcon1', 'iconP1', angle, 0.1, 'linear')
        doTweenAngle('drainBarIcon2', 'iconP2', angle, 0.1, 'linear')
	setProperty('iconP1.y', ((iconY - (angle * 1.2) + (hp * (-6 * angle)) + (8 * angle))))
        setProperty('iconP2.y', ((iconY + (angle * 1.25) + (hp * (-6 * angle)) + (4 * angle))))

	barDraining = 0

	if barDraining == 0 then
		if angle > 0 then
			setProperty('health', hp - (loss * 0.002))
		end
		if angle < 0 then
			setProperty('health', hp + (loss * 0.002))	
		end
	end
end
function resetHealth()
	doTweenAngle('drainBarHP', 'healthBar', 0, 0.1, 'linear')
        doTweenAngle('drainBarIcon1', 'iconP1', 0, 0.1, 'linear')
        doTweenAngle('drainBarIcon2', 'iconP2', 0, 0.1, 'linear')
	setProperty('iconP1.y', iconY)
        setProperty('iconP2.y', iconY)
	barDraining = 1
end
end