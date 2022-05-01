local Icon = require 'src.tutorialLevel.icon'
local Manager = require 'src.tutorialLevel.manager'
local Button = require 'src.game.button'
local LevelUI = require 'src.tutorialLevel.levelUI'

local TutorialLevel = Class('TutorialLevel', State)

local scrollSpeed = 1380

function TutorialLevel:enter()
	State.initialize(self)

	self:fadeToBright()

	local warmUpUI = LevelUI(Sprites.levels.tutorial.warmUpUI, 'theRoyalFortress')

	self.frames = Manager(warmUpUI)

	self.icons = Manager(
			Icon(Sprites.levels.tutorial.t1.normal, Sprites.levels.tutorial.t1.hovered, 823, 1890, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t2.normal, Sprites.levels.tutorial.t2.hovered, 1149, 1684, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t3.normal, Sprites.levels.tutorial.t3.hovered, 840, 1480, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t4.normal, Sprites.levels.tutorial.t4.hovered, 855, 1172, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t5.normal, Sprites.levels.tutorial.t5.hovered, 1135, 978, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t6.normal, Sprites.levels.tutorial.t6.hovered, 1072, 659, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.t7.normal, Sprites.levels.tutorial.t7.hovered, 789, 465, nil, function() self:fadeToDark(function() print('hello') end) end),
			Icon(Sprites.levels.tutorial.warmUp, nil, 954, 213, warmUpUI))
	
	self.camera = Camera.new()
	self.targetY = self.camera.y
	self.halfScreenHeight = self.targetY
	self.screenHeight = self.halfScreenHeight * 2
	self.smoother = Camera.smooth.linear(7360)
	
	self.returnButton = Button(Sprites.levels.tutorial.XButton, 1350, 100, 500, 500,
			function() self:fadeToDark(function() Gamestate.switch(World) end) end)
end

function TutorialLevel:isAnyFrameActive()
	for _, frame in pairs(self.frames.entities) do
		if frame.isActive then return true end
	end
	return false
end

function TutorialLevel:_update(dt)
	self.frames:update(dt)
	
	if self:isAnyFrameActive() then return end

	self.icons:update(dt)
	
	local mouseX, mouseY = love.mouse.getPosition()
	if mouseY < 14 then
		self.targetY = self.targetY - scrollSpeed * dt
		self.targetY = math.max(self.targetY, self.halfScreenHeight)
	elseif mouseY > self.screenHeight - 14 then
		self.targetY = self.targetY + scrollSpeed * dt
		self.targetY = math.min(self.targetY, 2038 - self.halfScreenHeight)
	end
	self.camera:lockY(self.targetY, self.smoother)
	
	self.returnButton:update(dt)
end

function TutorialLevel:_draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.levels.tutorial.levelMap)

	self.icons:draw()
	
	self.camera:detach()
	
	self.returnButton:draw()
	
	self.frames:draw()
end

function TutorialLevel:mousemoved(x, y)
	self.frames:mousemoved(x, y)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousemoved(worldX, worldY)
	
	self.returnButton:mousemoved(x, y)
end

function TutorialLevel:mousepressed(x, y, button)
	self.frames:mousepressed(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousepressed(worldX, worldY, button)
	
	self.returnButton:mousepressed(x, y, button)
end

function TutorialLevel:mousereleased(x, y, button)
	self.frames:mousereleased(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousereleased(worldX, worldY, button)
	
	self.returnButton:mousereleased(x, y, button)
end

function TutorialLevel:wheelmoved(x, y)
	--if y > 0 then
		--self.targetY = self.targetY - wheelSpeed
		--self.targetY = math.max(self.targetY, self.halfScreenHeight)
	--elseif y < 0 then
		--self.targetY = self.targetY + wheelSpeed
		--self.targetY = math.min(self.targetY, 1570 - self.halfScreenHeight)
	--end
end

return TutorialLevel
