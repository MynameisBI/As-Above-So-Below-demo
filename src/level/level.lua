local Icon = require 'src.level.icon'
local Manager = require 'src.level.manager'

local Level = {}

local wheelSpeed = 130

function Level:enter()
	self.icons = Manager(Icon(Sprites.level.castleLevel, 960, 460),
			Icon(Sprites.level.normalLevelChurch, 730, 690), Icon(Sprites.level.normalLevelTavern, 1170, 690),
			Icon(Sprites.level.normalLevelBridge, 960, 810), Icon(Sprites.level.normalLevelGate, 960, 1130),
			Icon(Sprites.level.tutorialLevel, 780, 1400), Icon(Sprites.level.tradingPlace, 1150, 1320))
	
	self.camera = Camera.new()
	self.targetY = self.camera.y
	self.halfScreenHeight = self.targetY
	self.smoother = Camera.smooth.linear(7800)
end

function Level:update(dt)
	self.icons:update(dt)
	
	self.camera:lockY(self.targetY, self.smoother)
end

function Level:draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.level.levelMap)

	self.icons:draw()
	
	self.camera:detach()
end

function Level:mousemoved(x, y)
	self.icons:mousemoved(x, y)
end

function Level:mousepressed(x, y, button)
	self.icons:mousepressed(x, y, button)
end

function Level:mousereleased(x, y, button)
	self.icons:mousereleased(x, y, button)
end

function Level:wheelmoved(x, y)
	if y > 0 then
		self.targetY = self.targetY - wheelSpeed
		self.targetY = math.max(self.targetY, self.halfScreenHeight)
	elseif y < 0 then
		self.targetY = self.targetY + wheelSpeed
		self.targetY = math.min(self.targetY, 1570 - self.halfScreenHeight)
	end
end

return Level
