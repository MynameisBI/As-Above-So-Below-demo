local Frame = require 'src.game.frame'
local MenuButton = require 'src.menu.menuButton'

local MidFrame = Class('MidFrame', Frame)

function MidFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('alembic',
			MenuButton(Sprites.trading.details.items.alembic.normal, Sprites.trading.details.items.alembic.hovered,
					485, 270, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('mortarAndPestle',
			MenuButton(Sprites.trading.details.items.mortarAndPestle.normal, Sprites.trading.details.items.mortarAndPestle.hovered,
					960, 270, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('pStone',
			MenuButton(Sprites.trading.details.items.pStone.normal, Sprites.trading.details.items.pStone.hovered,
					1435, 270, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
end

function MidFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.trading.details.mid, 0, 0)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return MidFrame
