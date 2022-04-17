local MenuButton = require 'src.menu.menuButton'
local SettingsFrame = require 'src.menu.settingsFrame'
local CreditsFrame = require 'src.menu.creditsFrame'

local Menu = Class('Menu', State)

function Menu:enter()
	State.initialize(self)

	self:fadeToBright()

	self.settingsFrame = SettingsFrame()
	self.creditsFrame = CreditsFrame()

	self.buttons = {
		achievements = MenuButton(Sprites.menu.achievements.normal, Sprites.menu.achievements.hovered,
				252, 872, 252, 292, 0, -74, function() print('never gonna give you up') end),
		authorsInformation = MenuButton(Sprites.menu.authorsInformation.normal, Sprites.menu.authorsInformation.hovered,
				224, 57, 114, 114, 0, -20, function() self.creditsFrame:setActive(true); self.creditsFrame.isHovered = false end),
		cardsCollection = MenuButton(Sprites.menu.cardsCollection.normal, Sprites.menu.cardsCollection.hovered,
				1627, 796, 370, 348, 0, -20, function() print('never gonna let you down') end),
		dailyChallenges = MenuButton(Sprites.menu.dailyChallenges.normal, Sprites.menu.dailyChallenges.hovered,
				1333, 813, 206, 366, 0, -64, function() print('never gonna run around and desert you') end),
		inventory = MenuButton(Sprites.menu.inventory.normal, Sprites.menu.inventory.hovered,
				1439, 428, 522, 388, 0, -20, function() print('never gonna make you cry') end),
		settings = MenuButton(Sprites.menu.settings.normal, Sprites.menu.settings.hovered,
				1703, 57, 114, 114, 0, -20, function() self.settingsFrame:setActive(true); self.settingsFrame.isHovered = false end),
		tradings = MenuButton(Sprites.menu.tradings.normal, Sprites.menu.tradings.hovered,
				642, 273, 652, 366, -44, -61, function() self:fadeToDark(function() Gamestate.switch(Trading) end) end),
		worldMap = MenuButton(Sprites.menu.worldMap.normal, Sprites.menu.worldMap.hovered,
				769, 685, 778, 422, -4, -32, function() self:fadeToDark(function() Gamestate.switch(World) end) end),
	}
end

function Menu:isAnyFrameActive()
	if not (self.settingsFrame.isActive or self.creditsFrame.isActive) then
		return false
	else return true
	end
end

function Menu:_update(dt)
	if not self.settingsFrame.isActive and not self.creditsFrame.isActive then
		for _, button in pairs(self.buttons) do
			button:update(dt)
		end
	end

	self.settingsFrame:update(dt)
	self.creditsFrame:update(dt)
end

function Menu:_draw()
	local sw, sh = love.graphics.getDimensions()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu.background)
	
	for _, button in pairs(self.buttons) do
		if not button.isHovered then button:draw() end
	end
	for _, button in pairs(self.buttons) do
		if button.isHovered then button:draw() end
	end
	
	self.settingsFrame:draw()
	self.creditsFrame:draw()
end

function Menu:mousemoved(x, y)
	self.settingsFrame:mousemoved(x, y)
	self.creditsFrame:mousemoved(x, y)

	if self:isAnyFrameActive() then return end

	for _, button in pairs(self.buttons) do
		button:mousemoved(x, y)
	end
end

function Menu:mousepressed(x, y, button)
	self.settingsFrame:mousepressed(x, y, button)
	self.creditsFrame:mousepressed(x, y, button)

	if self:isAnyFrameActive() then return end

	for _, button in pairs(self.buttons) do
		button:mousepressed(x, y, button)
	end
end

function Menu:mousereleased(x, y, button)
	self.settingsFrame:mousereleased(x, y, button)
	self.creditsFrame:mousereleased(x, y, button)

	if self:isAnyFrameActive() then return end

	for _, button in pairs(self.buttons) do
		button:mousereleased(x, y, button)
	end
end

return Menu
