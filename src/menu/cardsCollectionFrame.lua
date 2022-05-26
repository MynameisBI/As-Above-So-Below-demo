local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local CardsCollectionFrame = Class('CardsCollectionFrame', Frame)

function CardsCollectionFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('XButton', Button(Sprites.menu.XButtonCopy, 1468, 324, 122, 122,
			function() self:setActive(false) end))
end

function CardsCollectionFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu.cardsCollectionBg)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return CardsCollectionFrame
