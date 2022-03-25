local Wonder = require 'src.world.wonder'
local Manager = require 'src.world.manager'

local World = {}

function World:enter()
	self.wonders = Manager(Wonder(Sprites.world.europe, 494, 320))
end

function World:update(dt)
	self.wonders:update(dt)
end

function World:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.world.worldMap, 0, 0,
			0, 1920 / Sprites.world.worldMap:getWidth(), 1080 / Sprites.world.worldMap:getHeight())

	self.wonders:draw()
end

function World:mousemoved(x, y)
	self.wonders:mousemoved(x, y)
end

function World:mousepressed(x, y, button)
	self.wonders:mousepressed(x, y, button)
end

function World:mousereleased(x, y, button)
	self.wonders:mousereleased(x, y, button)
end

return World
