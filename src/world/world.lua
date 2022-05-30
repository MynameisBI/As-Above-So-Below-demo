local Wonder = require 'src.world.wonder'
local Manager = require 'src.world.manager'
local Button = require 'src.game.button'

local World = Class('World', State)

local scrollSpeed = 2240
local zoom = 0.5
local minZoom, maxZoom = 0.5, 1.125
local zoomSpeed = 0.125

function World:enter(from)
	State.initialize(self)

	self:fadeToBright()

	self.wonders = Manager(Wonder(Sprites.world.startingPoint, 968, 992, TutorialLevel),
			Wonder(Sprites.world.europe, 1340, 700, Level), Wonder(Sprites.world.greece, 1750, 900),
			Wonder(Sprites.world.egypt, 1806, 1346), Wonder(Sprites.world.arab, 2338, 1204),
			Wonder(Sprites.world.india, 3258, 1508), Wonder(Sprites.world.eastAsia, 4274, 1100))
	
	
	self.screenWidth, self.screenHeight = love.graphics.getDimensions()
	self.camera = Camera.new(5272 / (2 * 2 * zoom), 2360 / (2 * 2 * zoom))
	self.camera:zoomTo(zoom)
	self.targetX, self.targetY = self.camera.x, self.camera.y
	self.smoother = Camera.smooth.linear(9600)
	
	self.returnButton = Button(Sprites.world.returnButton, 1820, 100, 500, 500,
			function() self:fadeToDark(function() Gamestate.switch(Menu) end) end)
			
	if not Settings.hasEnteredWorld then
		Settings.hasEnteredWorld = true
		_dialogue:setNewLines(
				Line('This is a part of alchemy world map. You can zoom in and out.', 1),
				Line("The location we are in right now is Europe. It doesn't really matter."),
				Line("Click 'The starting point' to get a basic look at how to do alchemy."),
				Line("Again, you can do whatever you like. Make sure you understand the basics for doing it."))
				
	elseif from == TutorialLevel and not Settings.hasReturnedFromTutorialLevel then
		Settings.hasReturnedFromTutorialLevel = true
		_dialogue:setNewLines(
				Line("Congratulations on completing the beginner's tutorial. Haha.", 1),
				Line("You see, our boat docked in Europe a few days ago."),
				
				Line("Europe has the current great development of alchemy, but there are also many negative stereotypes about it.", 5),
				Line("On the path you chose, it was necessary to explore the world with different views on alchemy."),
				
				Line("You can afford to explore on your own. We will meet again later. Good luck on your journey.", 1),
				
				Line("Ah, I forgot to tell you.", 0),
				Line("Your partners have being on their journeys all around the world. "),
				
				Line("So, pick up the pace !", 5))
	end
	
	AudioManager:play('bgm', 'worldMap')
end

function World:leave()
	AudioManager:stop('bgm', 'worldMap')
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
