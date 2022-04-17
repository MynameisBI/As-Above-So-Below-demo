local Icon = Class('Icon')

local inGameSpriteSize = 1

function Icon:initialize(sprite, x, y, levelUI, func)
	assert(sprite, 'sprite is nil')
	
	self.sprite = sprite
	self.x, self.y = x or 0, y or 0
	self.w, self.h = sprite:getWidth() * inGameSpriteSize, sprite:getHeight() * inGameSpriteSize
	
	self.size = 1
	self.targetSize = 1
	self.sizeTweenSpeed = 12
	self.isHovered = false
	self.isActive = false
	
	self.levelUI = levelUI
	self.func = func
end

function Icon:update(dt)
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

function Icon:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.sprite, self.x, self.y,
			0, self.size * inGameSpriteSize, self.size * inGameSpriteSize,
			self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

function Icon:mousemoved(x, y)
	self.isHovered = false
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self.isHovered = true
	end
end

function Icon:mousepressed(x, y, button)
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self.isActive = true
	end
end

function Icon:mousereleased(x, y, button)
	if self.isActive and
			self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.w / 2 <= y and y <= self.y + self.h / 2 then
		self:hit(x, y, button)
	else
		self.isActive  = false
	end
end

function Icon:hit(x, y, button)
	if self.levelUI ~= nil then
		self.levelUI:setActive(true)
	elseif self.func ~= nil then
		self.func()
	end
end

return Icon

