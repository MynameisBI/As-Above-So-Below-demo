local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local PregameFrame = Class('PregameFrame', Frame)

function PregameFrame:initialize(background)
	Frame.initialize(self)
	
	self:setActive(true)
	self.isIntroDone = false
	
	self:addButton('Skip', Button(Sprites.dialogue.skipButton, 1815, 94, 120, 120,
			function()
				if self.imageIndex <= 5 then
					self.imageIndex = 6
					self.secondsToIncreaseOpactity = 0.5
					self.opacity = 1
				elseif self.imageIndex >= 8 then
					self:setActive(false)
				end
			end))
			
	self.background = background
	self.imageIndex = 1
	self.secondsToIncreaseOpactity = 1
	self.opacity = 1
end

function PregameFrame:onIntroDone()
	Gamestate.current()._timer:after(0.6, function()
				self.isIntroDone = true
				self:nextImage()
			end)
end

function PregameFrame:nextImage()
	self.imageIndex = self.imageIndex + 1
	
	if self.imageIndex >= 8 then
		self:setActive(false)
		return
	end
	
	if self.imageIndex <= 5 then self.secondsToIncreaseOpactity = 1
	else self.secondsToIncreaseOpactity = 0.5
	end
	
	self.opacity = 1
end

function PregameFrame:update(dt)
	if not (self.isActive and self.isIntroDone) then return end
	
	if self.imageIndex >= 6 then
		if self.secondsToIncreaseOpactity > 0 then
			self.secondsToIncreaseOpactity = self.secondsToIncreaseOpactity - dt
		elseif self.opacity > 0 then
			self.opacity = self.opacity - dt / 0.6
		else
			self:nextImage()
		end
	end
		
	for _, button in pairs(self.buttons) do
		button:update(dt)
	end
end

function PregameFrame:draw()
	if not self.isActive then return end

	if self.imageIndex < 7 then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle('fill', 0, 0, 1920, 1080)
	end
	if self.imageIndex ~= 1 then
		love.graphics.setColor(1, 1, 1, self.opacity)
		love.graphics.draw(Sprites.gameIntros[self.background][self.imageIndex], 0, 0)
	end

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

function PregameFrame:mousepressed(x, y, button)
	if not self.isActive then return end
	
	for _, button in pairs(self.buttons) do
		button:mousepressed(x, y, button)
	end
	
	self:nextImage()
end

return PregameFrame
