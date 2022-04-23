local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local ResultFrame = Class('ResultFrame', Frame)

function ResultFrame:initialize(args)
	Frame.initialize(self)

	self:addButton('replayButton', Button(Sprites.result.replay, 960, 1025, 540, 130,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Load, args.background, args.cardsNum, args.baseDeck, args.wildCards, Game) end) end))
	self:addButton('openLevelMap', Button(Sprites.result.openLevelMap, 183, 864, 274, 442,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Level) end) end))
	self:addButton('X', Button(Sprites.result.XButton, 1815, 94, 120, 120,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Load, nil, nil, nil, nil, Menu) end) end))
	self:addButton('openTrading', Button(Sprites.result.openTradingPlace, 1725, 895, 470, 370,
			function() self:fadeToDark(function() Gamestate.switch(Trading) end) end))
end

function ResultFrame:setResultInfo(result, score, reward)
	self.result = result
	self.score = score
	self.reward = reward
end

function ResultFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.result.background)

	if self.result == 'win' then
		self:print('You succeeded the work.', Fonts.result_small, {1, 1, 1}, 960, 44)
		self:print('New highscore', Fonts.result_small, {0.576, 0.447, 0.467}, 960, 190)
		self:print(tostring(self.score), Fonts.result_number, {1, 1, 1}, 960, 270)
		
	elseif self.result == 'lose' then
		self:print('You failed the work.', Fonts.result_small, {0.506, 0.176, 0.263}, 954, 50)
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
