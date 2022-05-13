local AudioManager = {}

function AudioManager:play(folderName, name)
	if name then
		Audios[folderName][name]:stop()
		Audios[folderName][name]:play()
	else
		Audios[folderName]:stop()
		Audios[folderName]:play()
	end
end

function AudioManager:stop(folderName, name)
	if name then
		Audios[folderName][name]:stop()
	else
		Audios[folderName]:stop()
	end
end


return AudioManager
