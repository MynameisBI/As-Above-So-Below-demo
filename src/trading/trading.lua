local Trading = Class('Trading', State)
local Manager = require 'src.game.manager'
local MenuButton = require 'src.menu.menuButton'
local Button = require 'src.game.button'

function Trading:enter(from)
	State.initialize(self)
	
	self:fadeToBright()
	
	self.buttons = Manager()
	
	self.buttons:add(MenuButton(Sprites.trading.trading.normal, Sprites.trading.trading.hovered,
			990, 460, 368, 207, -30, -40, function() self.currentFrame = 'top' end))
	self.buttons:add(MenuButton(Sprites.trading.equipmentCards.normal, Sprites.trading.equipmentCards.hovered,
			990, 663, 424, 153, -30, 0, function() self.currentFrame = 'mid' end))
	self.buttons:add(MenuButton(Sprites.trading.metalsIngredients.normal, Sprites.trading.metalsIngredients.hovered,
			990, 840, 428, 192, -30, 22, function() self.currentFrame = 'bot' end))
	self.buttons:add(Button(Sprites.result.XButton,
			1815, 94, 120, 120, function() Gamestate.switch(Menu) end))
			
	self.currentFrame = nil
	self.backButton = Button(Sprites.trading.details.back, 1350, 100, nil, nil,
			function() self.currentFrame = nil end)	
		
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
	
	if self.currentFrame == 'top' then
		love.graphics.draw(Sprites.trading.details.top, 0, 0)
	elseif self.currentFrame == 'mid' then
		love.graphics.draw(Sprites.trading.details.mid, 0, 0)
	elseif self.currentFrame == 'bot' then
		love.graphics.draw(Sprites.trading.details.bot, 0, 0)
	end
	if self.currentFrame ~= nil then
		self.backButton:draw()
	end
end

function Trading:mousemoved(x, y)
	if self.currentFrame == nil then
		self.buttons:mousemoved(x, y)
	elseif self.currentFrame ~= nil then
		self.backButton:mousemoved(x, y)
	end
end

function Trading:mousepressed(x, y, button)
	if self.currentFrame == nil then
		self.buttons:mousepressed(x, y, button)
	elseif self.currentFrame ~= nil then
		self.backButton:draw()
	end
end

function Trading:mousereleased(x, y, button)
	if self.currentFrame == nil then
		self.buttons:mousereleased(x, y, button)
	elseif self.currentFrame ~= nil then
		self.backButton:draw()
	end
end

return Trading
