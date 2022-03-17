local Deck = require 'src.game.deck'

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
	
	self.decks:add(Deck(630, 170))
	self.decks:add(Deck(1060, 170))
	self.decks:add(Deck(630, 635))
	self.decks:add(Deck(1060, 635))
	
end

function Game:update(dt)
	self.decks:update(dt)
	self.hints:update(dt)
end

function Game:draw()
	self.decks:draw()
	self.hints:draw()
end

return Game
