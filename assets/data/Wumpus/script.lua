local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
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

	--easy script configs
--    IntroTextSize = 25	--Size of the text for the Now Playing thing.
  --  IntroSubTextSize = 30 --size of the text for the Song Name.
--   IntroSubText2Size = 20
--    IntroTagColor = '7289da'	--Color of the tag at the end of the box.
--    IntroTagWidth = 15	--Width of the box's tag thingy.
--    --easy script configs
--    
--    --actual script
--    function onCreate()
 --       --the tag at the end of the box
 --       makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
 --       makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
   --     setObjectCamera('JukeBoxTag', 'other')
 --       addLuaSprite('JukeBoxTag', true)
    
 --       --the box
  --      makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
 --       makeGraphic('JukeBox', 300, 100, '000000')
  --      setObjectCamera('JukeBox', 'other')
  --      addLuaSprite('JukeBox', true)
   --     
        --the text for the "Now Playing" bit
  --      makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 30)
   --     setTextAlignment('JukeBoxText', 'left')
   --     setObjectCamera('JukeBoxText', 'other')
    --    setTextSize('JukeBoxText', IntroTextSize)
   --     addLuaText('JukeBoxText')
        
        --text for the song name
  --      makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 60)
  --      setTextAlignment('JukeBoxSubText', 'left')
   --     setObjectCamera('JukeBoxSubText', 'other')
  --      setTextSize('JukeBoxSubText', IntroSubTextSize)
 --       addLuaText('JukeBoxSubText')
    
 --       --text for the artist name
  --      makeLuaText('JukeBoxSubText2', 'by Roborg8', 300, -305-IntroTagWidth, 90)
      --  setTextAlignment('JukeBoxSubText2', 'left')
    --    setObjectCamera('JukeBoxSubText2', 'other')
 --       setTextSize('JukeBoxSubText2', IntroSubText2Size)
     --   addLuaText('JukeBoxSubText2')
  --  end
    
    --motion functions
 --   function onSongStart()
        -- Inst and Vocals start playing, songPosition = 0
 --       doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
  --      doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
    --    doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
  --      doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
 --       doTweenX('MoveInFive', 'JukeBoxSubText2', 0, 1, 'CircInOut')
   --     
  --      runTimer('JukeBoxWait', 3, 1)
   -- end
    
 --   function onTimerCompleted(tag, loops, loopsLeft)
        -- A loop from a timer you called has been completed, value "tag" is it's tag
        -- loops = how many loops it will have done when it ends completely
        -- loopsLeft = how many are remaining
  --      if tag == 'JukeBoxWait' then
  --          doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
  --          doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
 --           doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
 -- --          doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
 --           doTweenX('MoveOutFive', 'JukeBoxSubText2', -450, 1.5, 'CircInOut')
 --       end
 --   end