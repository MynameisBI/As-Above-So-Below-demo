local Frame = require 'src.game.frame'
local Button = require 'src.game.button'

local InDevFrame = Class('InDevFrame', Frame)

function InDevFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('X', Button(Sprites.result.XButton, 1398, 278, 120, 120,
			function() self:setActive(false) end))
end

function InDevFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.inDevelopment, 0, 0)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return InDevFrame
