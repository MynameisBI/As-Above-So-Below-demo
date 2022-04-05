local Button = Class('Button')

local inGameSpriteSize = 1

function Button:initialize(sprite, x, y, w, h, executeFunc)
	assert(sprite, 'sprite is nil')
	
	self.sprite = sprite
	self.x, self.y = x or 0, y or 0
	self.w, self.h = w or sprite:getWidth() * inGameSpriteSize, h or sprite:getHeight() * inGameSpriteSize
	
	self.size = 1
	self.targetSize = 1
	self.sizeTweenSpeed = 12
	self.isHovered = false
	self.isActive = false
	
	self.executeFunc = executeFunc or function(self, mx, my, button) end
end

function Button:update(dt)
	if self.isHovered and self.isActive then
		self.targetSize = 0.9
	elseif self.isHovered and not self.isActive then
		self.targetSize = 1.1
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
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.sprite, self.x, self.y,
			0, self.size * inGameSpriteSize, self.size * inGameSpriteSize,
			self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

function Button:mousemoved(x, y)
	self.isHovered = false
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self.isHovered = true
	end
end

function Button:mousepressed(x, y, button)
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self.isActive = true
	end
end

function Button:mousereleased(x, y, button)
	if self.isActive and
			self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self:hit(x, y, button)
	else
		self.isActive  = false
	end
end

function Button:hit(x, y, button)
	self.executeFunc(self, x, y, button)
end

return Button

