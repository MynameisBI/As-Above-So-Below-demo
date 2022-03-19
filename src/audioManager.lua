local AudioManager = {}

function AudioManager:play(name, volume)
	Audios[name]:stop()
	Audios[name]:play()
end

return AudioManager
