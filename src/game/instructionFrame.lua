local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local InstructionFrame = Class('InstructionFrame', Frame)

function InstructionFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('X', Button(Sprites.instruction.XButton, 1815, 94, 120, 120,
			function() self:setActive(false) end))
			
	self:addButton('Instruction ingame',
			Button(Sprites.instruction.frameButtons.instructionInGame.off, 960, 418, 440, 348,
					function(thisButton) 
						thisButton:toggleEnabled()
						if not thisButton.isEnabled then
							thisButton.sprite = Sprites.instruction.frameButtons.instructionInGame.on
						elseif thisButton.isEnabled then
							thisButton.sprite = Sprites.instruction.frameButtons.instructionInGame.off
						end
						Gamestate.current().instruction.isEnabled = not thisButton.isEnabled
					end, 0, -140))
			
	self:addButton('Level goal', Button(Sprites.instruction.frameButtons.levelGoal, 664, 680, 128, 128,
			function() end))
	self:addButton('Cardtypes/deck', Button(Sprites.instruction.frameButtons.cardTypesEachDeck, 962, 680, 128, 128,
			function() end))
	self:addButton('Daily quests', Button(Sprites.instruction.frameButtons.dailyQuests, 1260, 680, 128, 128,
			function() end))
	self:addButton('How to play', Button(Sprites.instruction.frameButtons.howToPlay, 664, 924, 128, 128,
			function() end))
	self:addButton('Cardtypes', Button(Sprites.instruction.frameButtons.cardTypes, 962, 924, 128, 128,
			function() end))
	self:addButton('Others', Button(Sprites.instruction.frameButtons.others, 1260, 924, 128, 128,
			function() end))
end

function InstructionFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.instruction.background)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return InstructionFrame
