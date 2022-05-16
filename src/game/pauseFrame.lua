local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local PauseFrame = Class('PauseFrame', Frame)

function PauseFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('toggleDebug',
			Button(Sprites.pause.toggleDebug, 860, 375, 120, 120,
					function(thisButton) 
						Settings.isDebug = not Settings.isDebug
						
						thisButton:toggleEnabled()
						if not thisButton.isEnabled then thisButton.color = {0.6, 0.6, 0.6}
						elseif thisButton.isEnabled then thisButton.color = {1, 1, 1}
						end
					end))
	self:addButton('toggleAutoFade',
			Button(Sprites.pause.toggleAutoFade , 1060, 375, 120, 120,
					function(thisButton)
						Settings.cardAutomaticallyFadeAway = not Settings.cardAutomaticallyFadeAway
						
						thisButton:toggleEnabled()
						if not thisButton.isEnabled then thisButton.color = {0.6, 0.6, 0.6}
						elseif thisButton.isEnabled then thisButton.color = {1, 1, 1}
						end
					end))
					
	self:addButton('exitLevel', Button(Sprites.pause.exitLevel, 770, 535, 120, 120,
			function() Gamestate.current():fadeToDark(function() Gamestate.switch(Menu) end) end))
	self:addButton('resume', Button(Sprites.pause.continue, 960, 535, 120, 120,
			function() Gamestate.current():resume() end))
	self:addButton('replay', Button(Sprites.pause.replay, 1150, 535, 120, 120,
			function()
				AudioManager:play('otherSounds', 'replay')
				Gamestate.current():fadeToDark(function()
							local args = Gamestate.current().args
							Gamestate.switch(Load, args.background, args.cardsNum, args.baseDeck, args.wildCards, args.startingPoints)
						end)
			end))
	
	self:addButton('sound', Button(Sprites.pause.sound, 860, 700, 120, 120, function() end))
	self:addButton('bgm', Button(Sprites.pause.bgm, 1060, 700, 120, 120, function() end))
	
	
	self.buttons.toggleDebug.isEnabled = false
	self.buttons.toggleDebug.color = {0.6, 0.6, 0.6}
	self.buttons.toggleAutoFade.isEnabled = false
	self.buttons.toggleAutoFade.color = {0.6, 0.6, 0.6}
end

function PauseFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.pause.background)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return PauseFrame
