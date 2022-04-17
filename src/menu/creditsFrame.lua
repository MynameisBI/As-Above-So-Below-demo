local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local CreditsFrame = Class('CreditsFrame', Frame)

function CreditsFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('XButton', Button(Sprites.menu.XButton, 1815, 96, 122, 122,
			function() self:setActive(false) end))
end

function CreditsFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu.creditsFrame.credits)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return CreditsFrame
