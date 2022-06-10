local Frame = require 'src.game.frame'

local TopFrame = Class('TopFrame', Frame)

function TopFrame:initialize()
	Frame.initialize(self)
end

function TopFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.trading.details.top, 0, 0)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return TopFrame
