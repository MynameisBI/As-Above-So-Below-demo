local Manager = require 'src.trading.tradingManager'
local Manager_ = require 'src.game.manager'
local MenuButton = require 'src.menu.menuButton'
local Button = require 'src.game.button'
local TopFrame = require 'src.trading.topFrame'
local MidFrame = require 'src.trading.midFrame'
local BotFrame = require 'src.trading.botFrame'

local Trading = Class('Trading', State)

function Trading:enter(from)
	State.initialize(self)
	
	self:fadeToBright()
	
	self.buttons = Manager()
	
	self.frames_ = {
		top = TopFrame(),
		mid = MidFrame(),
		bot = BotFrame()
	}
	self.frames = Manager_(self.frames_.top, self.frames_.mid, self.frames_.bot)
	
	self.buttons:add(MenuButton(Sprites.trading.trading.normal, Sprites.trading.trading.hovered,
			990, 460, 368, 207, -30, -40, function() self:setCurrentFrame('top') end,
			{'otherSounds', 'openTradingDrawer'}))
	self.buttons:add(MenuButton(Sprites.trading.equipmentCards.normal, Sprites.trading.equipmentCards.hovered,
			990, 663, 424, 153, -30, 0, function() self:setCurrentFrame('mid') end,
			{'otherSounds', 'openTradingDrawer'}))
	self.buttons:add(MenuButton(Sprites.trading.metalsIngredients.normal, Sprites.trading.metalsIngredients.hovered,
			990, 840, 428, 192, -30, 22, function() self:setCurrentFrame('bot') end,
			{'otherSounds', 'openTradingDrawer'}))
	self.currentFrame = nil
			
	self.buttons:add(Button(Sprites.result.XButton,
			1815, 94, 120, 120, function() Gamestate.switch(Menu) end))
	
	self.backButton = Button(Sprites.trading.details.back, 1820, 100, nil, nil,
			function() self:setCurrentFrame(nil) end, 0, 0, {'otherSounds', 'exitTradingDrawer'})	
		
	AudioManager:play('bgm', 'tradings')
end

function Trading:leave()
	AudioManager:stop('bgm', 'tradings')
end

function Trading:setCurrentFrame(frame)
	if frame ~= nil then
		self.frames_[frame]:setActive(true)
	elseif frame == nil then
		for k, frame in pairs(self.frames_) do
			frame:setActive(false)
		end
	end
	self.currentFrame = frame
end

function Trading:update(dt)
	self.buttons:update(dt)
	self.frames:update(dt)
	self.backButton:update(dt)
end

function Trading:draw()
	if self.currentFrame == nil then
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(Sprites.trading.background, 0, 0)
		
		for _, button in pairs(self.buttons.entities) do
			if not button.isHovered then button:draw() end
		end
		for _, button in pairs(self.buttons.entities) do
			if button.isHovered then button:draw() end
		end
		
	else
		self.backButton:draw()
	end
	
	self.frames:draw()
end

function Trading:mousemoved(x, y)
	if self.currentFrame == nil then
		self.buttons:mousemoved(x, y)
	elseif self.currentFrame ~= nil then
		self.backButton:mousemoved(x, y)
		self.frames:mousemoved(x, y)
	end
end

function Trading:mousepressed(x, y, button)
	if self.currentFrame == nil then
		self.buttons:mousepressed(x, y, button)
	elseif self.currentFrame ~= nil then
		self.backButton:mousepressed(x, y, button)
		self.frames:mousepressed(x, y, button)
	end
end

function Trading:mousereleased(x, y, button)
	if self.currentFrame == nil then
		self.buttons:mousereleased(x, y, button)
	elseif self.currentFrame ~= nil then
		self.backButton:mousereleased(x, y, button)
		self.frames:mousereleased(x, y, button)
	end
end

return Trading
