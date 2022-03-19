local AudioManager = {}

function AudioManager:play(name, volume)
	love.audio.play(Audios[name])
end

return AudioManager
