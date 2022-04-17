local Frame = require 'src.game.frame'
local Button = require 'src.game.button'

local LevelUI = Class('LevelUI', Frame)

function LevelUI:initialize(sprite, background, cardsNum, baseDeck, wildCards)
	Frame.initialize(self)
	
	self.UISprite = sprite
	
	self:addButton('X', Button(Sprites.result.XButton, 1815, 94, 120, 120, function() self:setActive(false) end))
	self:addButton('start',Button(Sprites.level.levelsUI.start, 960, 910, 494, 260, function()
				Gamestate.current():fadeToDark(function()
							Gamestate.switch(Load, background, cardsNum, baseDeck, wildCards)
						end)
			end))
	self:addButton('equipment', Button(Sprites.level.levelsUI.equipmentCards, 1374, 902, 262, 262, function() print('get stick bugged lol') end))
end

function LevelUI:draw()
	if not self.isActive then return end
	
	love.graphics.draw(self.UISprite)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return LevelUI
