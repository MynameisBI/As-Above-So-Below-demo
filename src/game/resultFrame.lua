local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local ResultFrame = Class('ResultFrame', Frame)

function ResultFrame:initialize(args)
	Frame.initialize(self)

	self:addButton('replayButton', Button(Sprites.result.replay, 960, 1025, 540, 130,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Load, args.background, args.cardsNum, args.baseDeck, args.wildCards, Game); AudioManager:play('otherSounds', 'replay') end) end))
	self:addButton('openLevelMap', Button(Sprites.result.openLevelMap, 183, 864, 274, 442,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Level); AudioManager:play('otherSounds', 'map') end) end))
	self:addButton('openTrading', Button(Sprites.result.openTradingPlace, 1725, 895, 470, 370,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Trading); AudioManager:play('otherSounds', 'tradings') end) end))
end

function ResultFrame:setResultInfo(result, score, reward)
	self.result = result
	self.score = score
	self.reward = reward
	
	if result == 'win' then
		if Settings.hasWon == false then
			Settings.hasWon = true
			_dialogue:setNewLines(
					Line('First time and you nailed it! You are clearly gifted in alchemy! Keep it up.', 6))
		end
		AudioManager:play('otherSounds', 'win')
	
	elseif result == 'lose' then
		if Settings.hasLost == false then
			Settings.hasLost = true
			_dialogue:setNewLines(
					Line("It's a bit disappointing. You can try again, but remember that everything has its price.", 2))
		end
		AudioManager:play('otherSounds', 'lost')
	end
	
	if Settings.hasSeenResult == false then
		Settings.hasSeenResult = true
		_dialogue:addLines(
				Line("You will receive rewards after completing each level. You can play again to keep getting them.", 1),
				
				Line("They are metal ingots formed by The Great Work.", 4),
				Line("Based on the components aka flames (elements and principles) you earn, the rarity of those metal ingots will be determined."),
				Line("The cheapest is lead, to the rarest is gold."),
				
				Line("You can sell them for money. Use money to buy equipment and ingredients for more difficult levels. That's how it works.", 3),
				
				Line("But remember this, choose the right time to sell to get a better price.", 5)
				)
	end
end

function ResultFrame:setActive(isActive)
	self.isActive = isActive 
	
end

function ResultFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.result.background)

	if self.result == 'win' then
		self:print('You succeeded The Great Work.', Fonts.result_small, {1, 1, 1}, 960, 44)
		self:print('New highscore', Fonts.result_small, {0.576, 0.447, 0.467}, 960, 190)
		for i = -5, 5 do
			self:print(tostring(self.score), Fonts.result_number, {1, 1, 1}, 960 + (i-3), 270)
		end
		
	elseif self.result == 'lose' then
		self:print('You failed The Great Work.', Fonts.result_small, {0.506, 0.176, 0.263}, 954, 50)
		self:print('Lost', Fonts.result_big, {0.765, 0.204, 0.275}, 960, 270)
		
	end
	
	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

function ResultFrame:print(text, font, color, x, y)
	love.graphics.setColor(color or {1, 1, 1})
	love.graphics.setFont(font)
	love.graphics.print(text, x, y, 0, 1, 1, font:getWidth(text) / 2)
end

return ResultFrame
