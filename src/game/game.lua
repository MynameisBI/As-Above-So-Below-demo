local Deck = require 'src.game.deck'
local ValueHint = require 'src.game.valueHint'
local TypeHint = require 'src.game.typeHint'

local Manager = require 'src.game.manager'

local Game = {}

function Game:enter()
	self.decks = Manager()
	self.hints = Manager()
	
	self:setupGame()
end

function Game:setupGame()
	-- Initialize all the decks
	local deck1 = self.decks:add(Deck(630, 170, -60, 150))
	local deck2 = self.decks:add(Deck(1060, 170, 280, 150))
	local deck3 = self.decks:add(Deck(630, 635, -60, 150))
	local deck4 = self.decks:add(Deck(1060, 635, 280, 150))

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
	local valueHint1 = self.hints:add(ValueHint(960, 410, 'horizontal', deck1, deck2))
	local valueHint2 = self.hints:add(ValueHint(814, 558, 'vertical', deck1, deck3))
	local valueHint3 = self.hints:add(ValueHint(1105, 558, 'vertical', deck2, deck4))
	local valueHint4 = self.hints:add(ValueHint(960, 700, 'horizontal', deck3, deck4))
	
	local typeHint1 = self.hints:add(TypeHint(960, 275, 'horizontal', deck1, deck2))
	local typeHint2 = self.hints:add(TypeHint(680, 558, 'vertical', deck1, deck3))
	local typeHint3 = self.hints:add(TypeHint(1242, 558, 'vertical', deck2, deck4))
	local typeHint4 = self.hints:add(TypeHint(960, 835, 'horizontal', deck3, deck4))
	
		-- Register OnCardChange event
	deck1:registerOnCardChangedEvent(valueHint1, valueHint2, typeHint1, typeHint2)
	deck2:registerOnCardChangedEvent(valueHint1, valueHint3, typeHint1, typeHint3)
	deck3:registerOnCardChangedEvent(valueHint2, valueHint4, typeHint2, typeHint4)
	deck4:registerOnCardChangedEvent(valueHint3, valueHint4, typeHint3, typeHint4)
end

function Game:update(dt)
	self.decks:update(dt)
	self.hints:update(dt)
	
	if Suit.Button('toggle debug', 400, 400, 100, 30).hit then
		IS_DEBUG = not IS_DEBUG
	end
end

function Game:draw()
	-- Background
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.background, 0, 0)

	self.decks:draw()
	self.hints:draw()
	
	love.graphics.setColor(1, 1, 1)
	Suit.draw()
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
