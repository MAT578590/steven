local angleshit = 1.2;
local anglevar = 1.2;
function onBeatHit()
    if curBeat > 80 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*20, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*20, crochet*0.001, 'linear')
    end
end

function opponentNoteHit()

        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.01);
        end
    end

function goodNoteHit(id, direction, noteType, isSustainNote)
	setProperty('S2.alpha', getProperty('S2.alpha', 0.8)-0.05)

end
function noteMiss(id, direction, noteType, isSustainNote)
	setProperty('S2.alpha', getProperty('S2.alpha')+0.07)

end
