local Wonder = require 'src.world.wonder'
local Manager = require 'src.world.manager'
local Button = require 'src.game.button'

local World = Class('World', State)

local scrollSpeed = 2240
local zoom = 0.5
local minZoom, maxZoom = 0.5, 1.125
local zoomSpeed = 0.125

function World:enter()
	State.initialize(self)

	self:fadeToBright()

	self.wonders = Manager(Wonder(Sprites.world.startingPoint, 968, 992),
			Wonder(Sprites.world.europe, 1340, 700), Wonder(Sprites.world.greece, 1750, 900),
			Wonder(Sprites.world.egypt, 1806, 1346), Wonder(Sprites.world.arab, 2338, 1204),
			Wonder(Sprites.world.india, 3258, 1508), Wonder(Sprites.world.eastAsia, 4274, 1100))
	
	
	self.screenWidth, self.screenHeight = love.graphics.getDimensions()
	self.camera = Camera.new(5272 / (2 * 2 * zoom), 2360 / (2 * 2 * zoom))
	self.camera:zoomTo(zoom)
	self.targetX, self.targetY = self.camera.x, self.camera.y
	self.smoother = Camera.smooth.linear(9600)
	
	self.returnButton = Button(Sprites.world.returnButton, 1820, 100, 500, 500,
			function() self:fadeToDark(function() Gamestate.switch(Menu) end) end)
end

function World:getMinX()
	return self.screenWidth / (2 * self.camera.scale)
end

function World:getMaxX()
	return 5272 - self.screenWidth / (2 * self.camera.scale)
end

function World:getMinY()
	return self.screenHeight / (2 * self.camera.scale)
end

function World:getMaxY()
	return 2360 - self.screenHeight / (2 * self.camera.scale)
end


function World:_update(dt)
	self.wonders:update(dt)
	
	local mouseX, mouseY = love.mouse.getPosition()
	if mouseX < 14 then
		self.targetX = math.max(self.targetX - scrollSpeed * dt / (self.camera.scale + 1), self:getMinX())
	elseif mouseX > self.screenWidth - 14 then
		self.targetX = math.min(self.targetX + scrollSpeed * dt / (self.camera.scale + 1), self:getMaxX())
	end
	if mouseY < 14 then
		self.targetY = math.max(self.targetY - scrollSpeed * dt / (self.camera.scale + 1), self:getMinY())
	elseif mouseY > self.screenHeight - 14 then
		self.targetY = math.min(self.targetY + scrollSpeed * dt / (self.camera.scale + 1), self:getMaxY())
	end
	self.camera:lockPosition(self.targetX, self.targetY, self.smoother)
	
	self.returnButton:update(dt)
end

function World:_draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.world.worldMap)

	self.wonders:draw()
	
	self.camera:detach()
	
	self.returnButton:draw()
end

function World:mousemoved(x, y)
	local worldX, worldY = self.camera:mousePosition()
	
	self.wonders:mousemoved(worldX, worldY)
	
	self.returnButton:mousemoved(x, y)
end

function World:mousepressed(x, y, button)
	local worldX, worldY = self.camera:mousePosition()

	self.wonders:mousepressed(worldX, worldY, button)
	
	self.returnButton:mousepressed(x, y, button)
end

function World:mousereleased(x, y, button)
	local worldX, worldY = self.camera:mousePosition()

	self.wonders:mousereleased(worldX, worldY, button)
	
	self.returnButton:mousereleased(x, y, button)
end

function World:wheelmoved(x, y)
	if y < 0 then
		self.camera.scale = self.camera.scale - zoomSpeed
		self.camera.scale = math.max(self.camera.scale, minZoom)
		
	elseif y > 0 then
		self.camera.scale = self.camera.scale + zoomSpeed
		self.camera.scale = math.min(self.camera.scale, maxZoom)
	
	end
	
	local cx, cy = self.camera:position()
	self.targetX, self.targetY = self:clamp(cx, self:getMinX(), self:getMaxX()), self:clamp(cy, self:getMinY(), self:getMaxY())
	self.camera:lockPosition(self.targetX, self.targetY)
end

function World:clamp(value, min, max)
	if value < min then return min
	elseif value > max then return max
	else return value
	end
end

return World
