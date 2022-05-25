local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local SettingsFrame = Class('SettingsFrame', Frame)

function SettingsFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('XButton', Button(Sprites.menu.XButton, 1815, 96, 122, 122,
			function() self:setActive(false) end))
	self:addButton('exitLevel', Button(Sprites.menu.settingsFrame.exitLevel, 770, 535, 120, 120, function() love.event.quit() end))
	self:addButton('sound', Button(Sprites.menu.settingsFrame.sound, 960, 535, 120, 120, function() print('toggle sound') end))
	self:addButton('bgm', Button(Sprites.menu.settingsFrame.bgm, 1150, 535, 120, 120, function() print('toggle bgm') end))
end

function SettingsFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu.settingsFrame.background)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return SettingsFrame
