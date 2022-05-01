local Equipment = Class('Equipment')

function Equipment:initialize(sprite, x, y, onHit, drawCardOnNextDeckHit)
	self.sprite = sprite
	self.color = {1, 1, 1}
	self.x, self.y = x, y
	self.w, self.h = 232, 315

	self.size = 1
	self.targetSize = 1
	self.sizeTweenSpeed = 22
	
	self.targetOy = 0
	self.oy = 0
	
	self.isHovered = false
	self.isActive = false
	
	local decks = Gamestate.current().decks.entities
	self.onHit = onHit or function(self, decks) end
	self.drawCardOnNextDeckHit = drawCardOnNextDeckHit
end

function Equipment:update(dt)
	if self.isHovered and self.isActive then
		self.targetSize = 1
		self.targetOy = 0
	elseif self.isHovered and not self.isActive then
		self.targetSize = 1.1
		self.targetOy = -80
	elseif not self.isHovered and self.isActive then
		self.targetSize = 1
		self.targetOy = 0
	else
		self.targetSize = 1
		self.targetOy = 0
	end
	
	self.size = self.size + ((self.targetSize - self.size) * self.sizeTweenSpeed * dt)
	self.oy = self.oy + ((self.targetOy - self.oy) * self.sizeTweenSpeed * dt)
end

function Equipment:draw()
	love.graphics.setColor(self.color)
	love.graphics.draw(self.sprite, self.x, self.y + self.oy,
			0, self.size * 232 / self.sprite:getWidth() * 0.6, self.size * 315 / self.sprite:getHeight() * 0.6,
			self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end

function Equipment:mousemoved(x, y)
	self.isHovered = false
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self.isHovered = true
	end
end

function Equipment:mousepressed(x, y, button)
	if self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self.isActive = true
	end
end

function Equipment:mousereleased(x, y, button)
	if self.isActive and
			self.x - self.w / 2 <= x and x <= self.x + self.w / 2 and
			self.y - self.h / 2 <= y and y <= self.y + self.h / 2 then
		self:hit(x, y, button)
	end
	self.isActive = false
end

function Equipment:hit(x, y, button)
	Gamestate.current().equipmentManager:setActiveEquipment(self)

	decks = Gamestate.current().decks.entities
	
	for _, deck in ipairs(decks) do
		deck:moveAllActionsToQueue()
	end
end

return Equipment
