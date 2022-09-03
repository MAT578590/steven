--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 25 --size of the text for the Song Name.
IntroTagColor = 'FF73F4'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', 15-IntroTagWidth, 800)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 130, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', 15-IntroTagWidth, 800)
	makeGraphic('JukeBox', 300, 130, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing: no day to save by corn chart and some code by latter (D)', 300, 15-IntroTagWidth, 800)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', '', 300, -305-IntroTagWidth, 96)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenY('MoveInOne', 'JukeBoxTag', 280, 1, 'CircInOut')
	doTweenY('MoveInTwo', 'JukeBox', 280, 1, 'CircInOut')
	doTweenY('MoveInThree', 'JukeBoxText', 280, 1, 'CircInOut')
	doTweenY('MoveInFour', 'JukeBoxSubText', 280, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 2)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenY('MoveOutOne', 'JukeBoxTag', 800, 2, 'CircInOut')
		doTweenY('MoveOutTwo', 'JukeBox', 800, 2, 'CircInOut')
		doTweenY('MoveOutThree', 'JukeBoxText', 800, 2, 'CircInOut')
		doTweenY('MoveOutFour', 'JukeBoxSubText', 800, 2, 'CircInOut')
	end
end