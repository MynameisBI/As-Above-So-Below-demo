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

	self.icons = Manager(
		Icon(Sprites.level.castleLevel, 960, 460, UIs.fortress,
				function()
					if not Settings.hasOpenedTheRoyalFortressUI then
						Settings.hasOpenedTheRoyalFortressUI = true
						
						_dialogue:setNewLines(
								Line("We were able to approach near to the lord's castle thanks to the information and reputation we had gained.", 4),
								Line("To gain the facilities for alchemical research, you needed trust."),
								
								Line("You're done if you fail. On the contrary, you will be one step closer to alchemy's achievements.", 3))
					end
				end),
		Icon(Sprites.level.normalLevelChurch, 730, 690, UIs.monastery,
				function()
					if not Settings.hasOpenedTheMonasteryUI then
						Settings.hasOpenedTheMonasteryUI = true
						
						_dialogue:setNewLines(
								Line("Perhaps the most difficult thing to deal with is belief.", 5),
								Line("They despise anything that is not Christian in origin."),
								
								Line("Alchemist like you are no exception.", 6),
								Line("You will be burnt alive if you are found out."))
					end
				end),
		Icon(Sprites.level.normalLevelTavern, 1170, 690, UIs.tavern,
				function()
				if not Settings.hasOpenedTheNightTavernUI then
						Settings.hasOpenedTheNightTavernUI = true
						
						_dialogue:setNewLines(
								Line("It is a mess here. ", 2),
								Line("On the other hand, you might have fun and gamble."),
								Line("Watch out or you will lose your hand and have to quit performing the ritual."))
					end
				end),
		Icon(Sprites.level.normalLevelBridge, 960, 810, UIs.bridge,
				function()
					if not Settings.hasOpenedTheBridgeTownUI then
						Settings.hasOpenedTheBridgeTownUI = true
						
						_dialogue:setNewLines(
								Line("I didn't expect the fertile territory to have such a rotten place.", 2),
								Line("The lord abandoned this location."),
								
								Line("We can use this place as a shelter.", 1),
								Line("Be careful with the polluted environment here, and the thieves as well."))
					end
				end),
		Icon(Sprites.level.normalLevelGate, 960, 1130, UIs.mainGate,
				function()
					if not Settings.hasOpenedTheMainGateUI then
						Settings.hasOpenedTheMainGateUI = true
						
						_dialogue:setNewLines(
								Line("This massive city gate must be passed through in order to enter the land.", 5),
								Line("The guards are the problem here."),
								Line("We can buy them off with valuable metals."))
					end
				end),
		Icon(Sprites.level.tutorialLevel, 780, 1400, UIs.beginning,
				function()
					if not Settings.hasOpenedTheBeginningUI then
						Settings.hasOpenedTheBeginningUI = true
						
						_dialogue:setNewLines(
								Line("We intend to infiltrate a European fortress.", 1),
								Line("This is where we'll begin."),
								Line("Make your decision."))
					end
				end),
		Icon(Sprites.level.tradingPlace, 1150, 1320, nil, function() self:fadeToDark(function() Gamestate.switch(Trading) end) end)
	)
	
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
