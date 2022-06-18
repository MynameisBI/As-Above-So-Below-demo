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
			990, 460, 368, 207, -30, -40,
			function()
				self:setCurrentFrame('top')
				if not Settings.hasOpenedTopDrawer then
					Settings.hasOpenedTopDrawer = true
					_dialogue:setNewLines(
							Line('Metal ingots are bought and sold here.', 'merchant'),
							Line('Place the metal ingots on the left balance if you want to sell.'),
							Line('The amount of money that has been evaluated from them will display in the balance to the right.'),
							Line('Place one on the right balance if you want to exchange metal ingots.'),
							Line('Metal ingots with the same total value will display on the right.'),
							Line('Feel free to trade. I will offer you a reasonable price. Hahaha.'),
							Line("You can't interact yet because this mechanic is currently incomplete.")
						)
				end
			end, {'otherSounds', 'openTradingDrawer'}))
			
	self.buttons:add(MenuButton(Sprites.trading.equipmentCards.normal, Sprites.trading.equipmentCards.hovered,
			990, 663, 424, 153, -30, 0,
			function()
				self:setCurrentFrame('mid')
				if not Settings.hasOpenedTopDrawer then
					Settings.hasOpenedTopDrawer = true
					_dialogue:setNewLines(
							Line('You can purchase equipment cards here.', 'merchant'),
							Line('They are alchemic tools that help you in The Great Work.'),
							Line('They will appear at random once you play a level.'),
							Line("You can't interact yet because this mechanic is currently incomplete.")
						)
				end
			end, {'otherSounds', 'openTradingDrawer'}))
			
	self.buttons:add(MenuButton(Sprites.trading.metalsIngredients.normal, Sprites.trading.metalsIngredients.hovered,
			990, 840, 428, 192, -30, 22,
			function()
				self:setCurrentFrame('bot')
				if not Settings.hasOpenedTopDrawer then
					Settings.hasOpenedTopDrawer = true
					_dialogue:setNewLines(
							Line('You can purchase equipment cards here.', 'merchant'),
							Line('They are metal ingots and materials that enable you to play a level or unlock many things.'),
							Line('They will appear at random once you play a level.'),
							Line("You can't interact yet because this mechanic is currently incomplete.")
						)
				end
			end, {'otherSounds', 'openTradingDrawer'}))
			
	self.currentFrame = nil
			
	self.buttons:add(Button(Sprites.result.XButton,
			1815, 94, 120, 120, function() Gamestate.switch(Menu) end))
	
	self.backButton = Button(Sprites.trading.details.back, 1820, 100, nil, nil,
			function() self:setCurrentFrame(nil) end, 0, 0, {'otherSounds', 'exitTradingDrawer'})	

	if not Settings.hasOpenedTrading then
		Settings.hasOpenedTrading = true
		_dialogue:setNewLines(
				Line("Welcome to the merchant's hut.", 'merchant'),
				Line('I am BM.'),
				Line('This is where you make transactions, such as earning money and collecting materials, cards.'),
				Line('So, what do you need?')
			)
	end
		
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
