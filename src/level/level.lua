local Icon = require 'src.level.icon'
local Manager = require 'src.level.manager'
local Button = require 'src.game.button'
local LevelUI = require 'src.level.levelUI'

local Level = Class('Level', State)

local scrollSpeed = 1200

function Level:enter()
	State.initialize(self)

	self:fadeToBright()

	local UIs = {
		fortress = LevelUI(Sprites.level.levelsUI.fortress, 'theRoyalFortress'),
		monastery = LevelUI(Sprites.level.levelsUI.monastery, 'monastery'),
		tavern = LevelUI(Sprites.level.levelsUI.tavern, 'nightTavern'),
		bridge = LevelUI(Sprites.level.levelsUI.bridge, 'bridgeTown'),
		mainGate = LevelUI(Sprites.level.levelsUI.mainGate, 'mainGate'),
		beginning = LevelUI(Sprites.level.levelsUI.beginning, 'theBeginning'),
	}

	self.frames = Manager(UIs.fortress, UIs.monastery, UIs.tavern,
			UIs.bridge,	UIs.mainGate, UIs.beginning)

	self.icons = Manager(Icon(Sprites.level.castleLevel, 960, 460, UIs.fortress),
			Icon(Sprites.level.normalLevelChurch, 730, 690, UIs.monastery),
			Icon(Sprites.level.normalLevelTavern, 1170, 690, UIs.tavern),
			Icon(Sprites.level.normalLevelBridge, 960, 810, UIs.bridge),
			Icon(Sprites.level.normalLevelGate, 960, 1130, UIs.mainGate),
			Icon(Sprites.level.tutorialLevel, 780, 1400, UIs.beginning),
			Icon(Sprites.level.tradingPlace, 1150, 1320, nil, function() self:fadeToDark(function() Gamestate.switch(Trading) end) end))
	
	self.camera = Camera.new()
	self.backgroundHeight = Sprites.level.levelMap:getHeight()
	self.halfScreenHeight = self.camera.y
	self.targetY = self.backgroundHeight - self.halfScreenHeight
	self.screenHeight = self.halfScreenHeight * 2
	self.smoother = Camera.smooth.linear(7360)
	
	self.returnButton = Button(Sprites.world.returnButton, 1350, 100, 500, 500,
			function() self:fadeToDark(function() Gamestate.switch(World) end) end)
			
	AudioManager:play('bgm', 'levelMap')
end

function Level:leave()
	AudioManager:stop('bgm', 'levelMap')
end

function Level:isAnyFrameActive()
	for _, frame in pairs(self.frames.entities) do
		if frame.isActive then return true end
	end
	return false
end

function Level:_update(dt)
	self.frames:update(dt)
	
	if self:isAnyFrameActive() then return end

	self.icons:update(dt)
	
	local mouseX, mouseY = love.mouse.getPosition()
	if mouseY < 14 then
		self.targetY = self.targetY - scrollSpeed * dt
		self.targetY = math.max(self.targetY, self.halfScreenHeight)
	elseif mouseY > self.screenHeight - 14 then
		self.targetY = self.targetY + scrollSpeed * dt
		self.targetY = math.min(self.targetY, self.backgroundHeight - self.halfScreenHeight)
	end
	self.camera:lockY(self.targetY, self.smoother)
	
	self.returnButton:update(dt)
end

function Level:_draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.level.levelMap)

	self.icons:draw()
	
	self.camera:detach()
	
	self.returnButton:draw()
	
	self.frames:draw()
end

function Level:mousemoved(x, y)
	self.frames:mousemoved(x, y)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousemoved(worldX, worldY)
	
	self.returnButton:mousemoved(x, y)
end

function Level:mousepressed(x, y, button)
	self.frames:mousepressed(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousepressed(worldX, worldY, button)
	
	self.returnButton:mousepressed(x, y, button)
end

function Level:mousereleased(x, y, button)
	self.frames:mousereleased(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousereleased(worldX, worldY, button)
	
	self.returnButton:mousereleased(x, y, button)
end

function Level:wheelmoved(x, y)
	--if y > 0 then
		--self.targetY = self.targetY - wheelSpeed
		--self.targetY = math.max(self.targetY, self.halfScreenHeight)
	--elseif y < 0 then
		--self.targetY = self.targetY + wheelSpeed
		--self.targetY = math.min(self.targetY, 1570 - self.halfScreenHeight)
	--end
end

return Level
