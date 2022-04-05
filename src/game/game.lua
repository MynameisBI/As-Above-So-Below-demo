local Deck = require 'src.game.deck'
local ValueHint = require 'src.game.valueHint'
local TypeHint = require 'src.game.typeHint'
local ScoreManager = require 'src.game.scoreManager'
local Tracker = require 'src.game.tracker'
local ResultFrame = require 'src.game.resultFrame'

local Manager = require 'src.game.manager'

local Game = {}

function Game:enter()
	self.decks = Manager()
	self.hints = Manager()
	
	self.scoreManager = ScoreManager()
	
	self.tracker = Tracker()
	
	self.resultFrame = ResultFrame()
	
	self:setupGame()
end

function Game:setupGame()
	-- Initialize all the decks
	local deck1 = self.decks:add(Deck(630, 170, -58, 150))
	local deck2 = self.decks:add(Deck(1060, 170, 284, 150))
	local deck3 = self.decks:add(Deck(630, 635, -58, 164))
	local deck4 = self.decks:add(Deck(1060, 635, 284, 164))

		-- add base cards
	for i, deck in ipairs(self.decks.entities) do
		for j, cardId in ipairs(DATA.deck.base) do
			deck:addCard(cardId)
		end
	end
	
		-- add mixed cards
	local mixedCardIds = {}
	for i, mixedCardId in ipairs(DATA.deck.mixed) do
		table.insert(mixedCardIds, mixedCardId)
	end
	
	local i = 0
	while #mixedCardIds >= 1 do
		i = i + 1
		if i > #self.decks.entities then i = 1 end
		
		local mixedCardIdsIndex = math.random(1, #mixedCardIds)
		self.decks.entities[i]:addCard(mixedCardIds[mixedCardIdsIndex])
		table.remove(mixedCardIds, mixedCardIdsIndex)
	end
	
		-- shuffle deck after adding
	for i, deck in ipairs(self.decks.entities) do
		deck:shuffle()
	end


	-- Follow the deck initialization with the hints
	local typeHint1 = self.hints:add(TypeHint(956, 274, 'horizontal', deck1, deck2))
	local typeHint2 = self.hints:add(TypeHint(680, 554, 'vertical', deck1, deck3))
	local typeHint3 = self.hints:add(TypeHint(1240, 556, 'vertical', deck2, deck4))
	local typeHint4 = self.hints:add(TypeHint(960, 834, 'horizontal', deck3, deck4))
	
	local valueHint1 = self.hints:add(ValueHint(956, 410, 'horizontal', deck1, deck2))
	local valueHint2 = self.hints:add(ValueHint(812, 554, 'vertical', deck1, deck3))
	local valueHint3 = self.hints:add(ValueHint(1108, 556, 'vertical', deck2, deck4))
	local valueHint4 = self.hints:add(ValueHint(962, 700, 'horizontal', deck3, deck4))
	
		-- Register OnCardChange event
	deck1:registerOnCardChangedEvent(valueHint1, valueHint2, typeHint1, typeHint2, scoreManager)
	deck2:registerOnCardChangedEvent(valueHint1, valueHint3, typeHint1, typeHint3, scoreManager)
	deck3:registerOnCardChangedEvent(valueHint2, valueHint4, typeHint2, typeHint4, scoreManager)
	deck4:registerOnCardChangedEvent(valueHint3, valueHint4, typeHint3, typeHint4, scoreManager)
end

function Game:endGame(result)
	if result == 'win' then
		
	elseif result == 'lose' then
	
	end
	self.resultFrame:setActive(true)
end

function Game:update(dt)
	self.decks:update(dt)
	self.hints:update(dt)
	
	self.tracker:update(dt)
	
	if Suit.Button('toggle debug', 250, 400, 200, 80).hit then
		Settings.isDebug = not Settings.isDebug
	elseif Suit.Button('toggle card automatically fade', 250, 520, 200, 80).hit then
		Settings.cardAutomaticallyFadeAway = not Settings.cardAutomaticallyFadeAway
	end
	
	self.resultFrame:update(dt)
end

function Game:draw()
	-- Background
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.background, 0, 0)

	self.decks:draw()
	self.hints:draw()
	
	self.scoreManager:draw()
	
	self.tracker:draw()
	
	love.graphics.setColor(1, 1, 1)
	Suit.draw()
	
	self.resultFrame:draw()
end

function Game:mousemoved(x, y)
	self.decks:mousemoved(x, y)
	self.hints:mousemoved(x, y)
end

function Game:mousepressed(x, y, button)
	self.decks:mousepressed(x, y, button)
	self.hints:mousepressed(x, y, button)
end

return Game
