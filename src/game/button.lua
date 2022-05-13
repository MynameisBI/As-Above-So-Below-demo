local Button = Class('Button')

local inGameSpriteSize = 1
local minSize = 0.92
local maxSize = 1.1

function Button:initialize(sprite, x, y, w, h, executeFunc)
	assert(sprite, 'sprite is nil')
	
	self.sprite = sprite
	self.color = {1, 1, 1}
	self.x, self.y = x or 0, y or 0
	self.w, self.h = w or sprite:getWidth() * inGameSpriteSize, h or sprite:getHeight() * inGameSpriteSize
	
	self.size = 1
	self.targetSize = 1
	self.sizeTweenSpeed = 22
	self.isHovered = false
	self.isActive = false
	self.isEnabled = true
	
	self.executeFunc = executeFunc or function(self, mx, my, button) end
	
	self.isEnabled = true
end

function Button:toggleEnabled()
	self.isEnabled = not self.isEnabled
end

function Button:update(dt)
	if self.isHovered and self.isActive then
		self.targetSize = minSize
	elseif self.isHovered and not self.isActive then
		self.targetSize = maxSize
	elseif not self.isHovered and self.isActive then
		self.targetSize = 1
	else
		self.targetSize = 1
	end
	
	-- Cubic method
	self.size = self.size + ((self.targetSize - self.size) * self.sizeTweenSpeed * dt)
	-- Linear method
	-- self.size = self.size + van van va may may toi luoi 
end

function Button:draw()
	love.graphics.setColor(self.color)
	love.graphics.draw(self.sprite, self.x, self.y,
			0, self.size * inGameSpriteSize, self.size * inGameSpriteSize,
			self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

function Button:mousemoved(x, y)
	self.isHovered = false
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self.isHovered = true
	end
end

function Button:mousepressed(x, y, button)
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self.isActive = true
	end
end

function Button:mousereleased(x, y, button)
	if self.isActive and
			self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self:hit(x, y, button)
	end
	self.isActive = false
end

function Button:hit(x, y, button)
	AudioManager:play('otherSounds', 'button')

	self.executeFunc(self, x, y, button)
end

return Button

