local Button = require 'src.game.button'
local MenuButton = require 'src.menu.menuButton'

local Frame = require 'src.game.frame'

local CardsCollectionFrame = Class('CardsCollectionFrame', Frame)

function CardsCollectionFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('alembic',
			MenuButton(Sprites.trading.details.items.alembic.normal, Sprites.trading.details.items.alembic.hovered,
					620, 615, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('mortarAndPestle',
			MenuButton(Sprites.trading.details.items.mortarAndPestle.normal, Sprites.trading.details.items.mortarAndPestle.hovered,
					912, 615, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('pStone',
			MenuButton(Sprites.trading.details.items.pStone.normal, Sprites.trading.details.items.pStone.hovered,
					1206, 615, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	
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
