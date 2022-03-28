local Wonder = require 'src.world.wonder'
local Manager = require 'src.world.manager'

local World = {}

local scrollSpeed = 1120

function World:enter()
	self.wonders = Manager(Wonder(Sprites.world.europe, 1340, 700), Wonder(Sprites.world.greece, 1750, 900),
			Wonder(Sprites.world.egypt, 1806, 1346), Wonder(Sprites.world.arab, 2338, 1204),
			Wonder(Sprites.world.india, 3258, 1508), Wonder(Sprites.world.eastAsia, 4274, 1100))
	
	self.camera = Camera.new()
	self.targetX, self.targetY = self.camera.x, self.camera.y
	self.halfScreenWidth, self.halfScreenHeight = self.targetX, self.targetY
	self.screenWidth, self.screenHeight = self.halfScreenWidth * 2, self.halfScreenHeight * 2
	self.smoother = Camera.smooth.linear(9600)
end

function World:update(dt)
	self.wonders:update(dt)
	
	local mouseX, mouseY = love.mouse.getPosition()
	if mouseX < 14 then
		self.targetX = math.max(self.targetX - scrollSpeed * dt, self.halfScreenWidth)
	elseif mouseX > self.screenWidth - 14 then
		self.targetX = math.min(self.targetX + scrollSpeed * dt, 5272 - self.halfScreenWidth)
	end
	if mouseY < 14 then
		self.targetY = math.max(self.targetY - scrollSpeed * dt, self.halfScreenHeight)
	elseif mouseY > self.screenHeight - 14 then
		self.targetY = math.min(self.targetY + scrollSpeed * dt, 2360 - self.halfScreenHeight)
	end
	self.camera:lockPosition(self.targetX, self.targetY, self.smoother)
end

function World:draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.world.worldMap)

	self.wonders:draw()
	
	self.camera:detach()
end

function World:mousemoved(x, y)
	local worldX, worldY = self.camera:mousePosition()
	
	self.wonders:mousemoved(worldX, worldY)
end

function World:mousepressed(x, y, button)
	local worldX, worldY = self.camera:mousePosition()

	self.wonders:mousepressed(worldX, worldY, button)
end

function World:mousereleased(x, y, button)
	local worldX, worldY = self.camera:mousePosition()

	self.wonders:mousereleased(worldX, worldY, button)
end

return World
