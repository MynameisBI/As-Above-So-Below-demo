local Frame = require 'src.game.frame'
local MenuButton = require 'src.menu.menuButton'

local BotFrame = Class('BotFrame', Frame)

function BotFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('silver',
			MenuButton(Sprites.trading.details.items.silver.normal, Sprites.trading.details.items.silver.hovered,
					485, 280, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('gold',
			MenuButton(Sprites.trading.details.items.gold.normal, Sprites.trading.details.items.gold.hovered,
					960, 280, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
	self:addButton('iron',
			MenuButton(Sprites.trading.details.items.iron.normal, Sprites.trading.details.items.iron.hovered,
					1435, 280, nil, nil, nil, nil, nil, nil, nil, {'otherSounds', 'inTradingDrawer'}))
end

function BotFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.trading.details.bot, 0, 0)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return BotFrame
