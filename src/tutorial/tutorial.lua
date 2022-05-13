local Tutorial = Class('Tutorial', State)

function Tutorial:enter(from, dialogueLines)
	State.initialize(self)

	self:fadeToBright()
	
	_dialogue:setNewLines(unpack(dialogueLines))
	
	AudioManager:play('bgm', 'tutorial')
end

function Tutorial:leave()
	AudioManager:stop('bgm', 'tutorial')
end

function Tutorial:onDialogueEnd()
	self:fadeToDark(function() Gamestate.switch(TutorialLevel) end)
end

return Tutorial
