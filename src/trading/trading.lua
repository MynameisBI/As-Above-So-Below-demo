local Trading = Class('Trading', State)
local Manager = require 'src.game.manager'
local MenuButton = require 'src.menu.menuButton'
local Button = require 'src.game.button'

function Trading:enter(from)
	State.initialize(self)
	
	self:fadeToBright()
	
	self.buttons = Manager()
	
	self.buttons:add(MenuButton(Sprites.trading.trading.normal, Sprites.trading.trading.hovered,
			990, 460, 368, 207, -30, -40, function() Gamestate.current().inDevFrame:setActive(true) end))
	self.buttons:add(MenuButton(Sprites.trading.equipmentCards.normal, Sprites.trading.equipmentCards.hovered,
			990, 663, 424, 153, -30, 0, function() Gamestate.current().inDevFrame:setActive(true) end))
	self.buttons:add(MenuButton(Sprites.trading.metalsIngredients.normal, Sprites.trading.metalsIngredients.hovered,
			990, 840, 428, 192, -30, 22, function() Gamestate.current().inDevFrame:setActive(true) end))
	self.buttons:add(Button(Sprites.result.XButton,
			1815, 94, 120, 120, function() Gamestate.switch(Menu) end))
			
	AudioManager:play('bgm', 'tradings')
end

function Trading:leave()
	AudioManager:stop('bgm', 'tradings')
end

function Trading:update(dt)
	self.buttons:update(dt)
end

function Trading:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.trading.background, 0, 0)

	for _, button in pairs(self.buttons.entities) do
		if not button.isHovered then button:draw() end
	end
	for _, button in pairs(self.buttons.entities) do
		if button.isHovered then button:draw() end
	end
end

function Trading:mousemoved(x, y)
	self.buttons:mousemoved(x, y)
end

function Trading:mousepressed(x, y, button)
	self.buttons:mousepressed(x, y, button)
end

function Trading:mousereleased(x, y, button)
	self.buttons:mousereleased(x, y, button)
end

return Trading
