local Frame = require 'src.game.frame'
local Button = require 'src.game.button'

local LevelUI = Class('LevelUI', Frame)

function LevelUI:initialize(sprite, levelId)
	Frame.initialize(self)
	
	self.UISprite = sprite
	
	self:addButton('X', Button(Sprites.result.XButton, 1815, 94, 120, 120, function() self:setActive(false) end))
	self:addButton('start',Button(Sprites.level.levelsUI.start, 960, 910, 494, 260, function()
				Gamestate.current():fadeToDark(function()
							local levelInfo = DATA.levels[levelId]
							Gamestate.switch(Load, levelInfo.background, levelInfo.cardsNum,
									levelInfo.baseDeck, levelInfo.wildCards, levelInfo.startingPoint)
						end)
			end))
	self:addButton('equipment', Button(Sprites.level.levelsUI.equipmentCards, 1374, 902, 262, 262,
			function() Gamestate.current().inDevFrame:setActive(true) end))
end

function LevelUI:draw()
	if not self.isActive then return end
	
	love.graphics.draw(self.UISprite)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return LevelUI
