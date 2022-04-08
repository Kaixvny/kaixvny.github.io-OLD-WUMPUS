local image = '88funkin' -- must be 1280 x 720!!
local duration = 1

function onCreate()
	precacheImage(image)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		makeLuaSprite('88funkin',image,0,0)
		setObjectCamera('88funkin','other')
		addLuaSprite('88funkin',true)
		doTweenAlpha('go off','88funkin',0,duration,'circInOut')
	end
end