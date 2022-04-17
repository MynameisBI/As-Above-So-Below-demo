local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local InstructionFrame = Class('InstructionFrame', Frame)

function InstructionFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('X', Button(Sprites.instruction.XButton, 1815, 94, 120, 120,
			function() self:setActive(false) end))
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
