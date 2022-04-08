function onCreate()
            setProperty('defaultUIZoom',-100)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onUpdate(elapsed)    if curStep == 0 then

    started = true

end

songPos = getSongPosition()

local currentBeat = (songPos/5000)*(curBpm/60)

doTweenY('opponentmove', 'dad', -100 - 150*math.sin((currentBeat+12*12)*math.pi), 2)

doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)

doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)

end


local xx = 520;
local yy = 450;
local xx2 = 820;
local yy2 = 450;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

-----------------------------
--------   VARIBLES   -------
-----------------------------
--------     DATA     -------
-----------------------------
scrollList = {};
defaultNotePos = {};
-----------------------------
--EDIT HOW FAST THE SHIT IS--
-----------------------------
info = {
    ----------
    --Y SHIT--
    ----------
    {2,3}, -- RANDOM TIME THE Y TWEENS USE
    {50,550}, -- RANDOM POSTIONS THE Y CHOOSES
    ----------
    --X SHIT--
    ----------
    {4,10}, -- RANDOM RANGE THE X MOVES
    {1--[[THIS CAN MAKE NOTE MOVMENT CHOPPY]], "LEFT"}, -- X MULTIPILER, DIRECTION CAN BE "LEFT" OR "RIGHT"
}
----------------------------
---SCRIPT BY LUNAR CLEINT---
----------------------------
--DISCORD:lunarcleint#8859--
----------------------------
function onCreatePost()
    for i = 0,7 do 
	    addScrollGroupObject("strumLineNotes",i,true,true)
        table.insert(defaultNotePos, {getPropertyFromGroup('strumLineNotes', i, 'x'), getPropertyFromGroup('strumLineNotes', i, 'y')})
        noteTweenY("y"..i,i, getRandomInt(info[2][1],info[2][2]), getRandomFloat(info[1][1],info[1][2]),getRandomEase())
    end
end

function onTweenCompleted(tag)
	for i = 0,7 do 
        shit = "y" .. tostring(i)
        if tag == shit then 
            noteTweenY("y"..i,i, getRandomInt(info[2][1],info[2][2]), getRandomFloat(info[1][1],info[1][2]),getRandomEase())
        end
    end
end

function addScrollObject(name,left,right)
    table.insert(scrollList, {false,name,left,right})
end

function addScrollGroupObject(group, index, left,right)
    table.insert(scrollList, {true,group,index,left,right})
end 

function screenWrap()
    for i = 1,#scrollList do 
            --VARS
            local width = getPropertyFromClass("flixel.FlxG", "width");
            local inGroup = scrollList[i][1];
            local off = 0;
            if (inGroup) then off = 1;
            --ACTUAL SCROLL SHIT
            if inGroup == true then 
                spritewidth = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "width");
                        if scrollList[i][4 + off] == true then --right
                            local x = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x");
                            if x >= width + spritewidth then 
                                setPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x", 0 - spritewidth);
                            end
                        else if scrollList[i][3 + off] == true then --left
                            local x = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x");
                            if x <= 0 - spritewidth then 
                                setPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x", width + spritewidth);
                            end
                        end
                    end
                end
            else 
                spritewidth = getPropertyFromClass("PlayState",name .."width");
                if scrollList[i][4 + off] == true then --right
                    local x = getPropertyFromClass("PlayState",name ..".x");
                    if x >= width + spritewidth then 
                        setPropertyFromClass("PlayState",name .. ".x", 0 - spritewidth);
                    end
                else if scrollList[i][3 + off] == true then --left
                    local x = getPropertyFromClass("PlayState",name ..".x");
                    if x <= 0 - spritewidth then 
                        setPropertyFromClass("PlayState",name .. ".x", width + spritewidth);
                    end
                end
            end
        end
    end
end

function getIndex(name,index)
    for j = 1,#scrollList do 
         if not index == nil then 
            if scrollList[i][2] == name and scrollList[1][3] == index then 
                print(i)
               return i;
           end
        else 
            if scrollList[i][2] == name then 
                print(i)
                return i;
            end
        end
     end
end

function getRandomEase()
    local easeList = {
        'backin',
        'backinout', 
        'backout', 
        'bouncein', 
        'bounceinout', 
        'bounceout', 
        'circin',
        'circinout', 
        'circout', 
        'cubein',
        'cubeinout', 
        'cubeout',
        'elasticin',
        'elasticinout', 
        'elasticout', 
        'expoin',
        'expoinout',
        'expoout', 
        'quadin',
        'quadinout', 
        'quadout', 
        'quartin', 
        'quartinout', 
        'quartout', 
        'quintin', 
        'quintinout',
        'quintout',
        'sinein',
        'sineinout',
        'sineout', 
        'smoothstepin', 
        'smoothstepinout', 
        'smoothstepout', 
        'smootherstepin', 
        'smootherstepinout', 
        'smootherstepout', 
    }
    return easeList[getRandomInt(1,#easeList)];
end

function clearScrollList()
    for i = 1,#scrollList do 
        scrollList[i] = nil;
    end
    scrollList = {};
end

function onUpdatePost(elapsed)
    if not inGameOver then
        for i = 0,7 do 
            if (info[4][2] == "LEFT") then
                setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") + (getRandomInt(info[3][1],info[3][2]) * info[4][1])))
            else
                setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") - (getRandomInt(info[3][1],info[3][2]) * info[4][1])))
            end
        end
        screenWrap();
    end
end

local OGDX = 0
function onCreate()
  OGDX = getCharacterX('dad')
  setObjectOrder('dadGroup', getObjectOrder('dadGroup') + 1)
end

function onSongStart()
  doTweenX('DTX', 'dadGroup', getCharacterX('boyfriend') + 50 , 1, 'quadIn')
end

local behind = false -- like danceLeft/danceRight shit
function onTweenCompleted(t)
  if t == 'DTX' then
    if not behind then
      setObjectOrder('dadGroup', getObjectOrder('dadGroup') - 1)
      behind = true
      doTweenX('DTX', 'dadGroup', OGDX, 1, 'quadOut')
    else
      setObjectOrder('dadGroup', getObjectOrder('dadGroup') + 1)
      behind = false
      doTweenX('DTX', 'dadGroup', getCharacterX('boyfriend') + 50 , 1, 'quadIn')
    end
  end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN')
    then startVideo('heknows');
      end
    end