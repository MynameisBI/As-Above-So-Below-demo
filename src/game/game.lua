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
	--self.decks:add(Deck({630, 170}, {-60, 150}))
	--self.decks:add(Deck({1060, 170}, {280, 150}))
	--self.decks:add(Deck({630, 635}, {-60, 150}))
	--self.decks:add(Deck({1060, 635}, {280, 150}))
	
	local deck1 = self.decks:add(Deck(630, 170))
	local deck2 = self.decks:add(Deck(1060, 170))
	local deck3 = self.decks:add(Deck(630, 635))
	local deck4 = self.decks:add(Deck(1060, 635))

	self.hints:add(ValueHint(960, 410, 'horizontal', deck1, deck2))
	self.hints:add(ValueHint(814, 558, 'vertical', deck1, deck3))
	self.hints:add(ValueHint(1105, 558, 'vertical', deck2, deck4))
	self.hints:add(ValueHint(960, 700, 'horizontal', deck3, deck4))
	
	self.hints:add(TypeHint(960, 275, 'horizontal', deck1, deck2))
	self.hints:add(TypeHint(680, 558, 'vertical', deck1, deck3))
	self.hints:add(TypeHint(1242, 558, 'vertical', deck2, deck4))
	self.hints:add(TypeHint(960, 835, 'horizontal', deck3, deck4))
end

function Game:update(dt)
	self.decks:update(dt)
	self.hints:update(dt)
end

function Game:draw()
	self.decks:draw()
	self.hints:draw()
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
