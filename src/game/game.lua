local Manager = require 'src.game.manager'

local Game = {}

function Game:enter()
	self.decks = Manager()
	self.hints = Manager()
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
