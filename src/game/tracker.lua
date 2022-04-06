local Tracker = Class('Tracker')

local pos = {
	goldEvents = {
		{x = 881, y = 60}, {x = 960, y = 51}, {x = 1037, y = 56},
	},
	elements = {
		fire = {x = 846, y = 123},
		air = {x = 921, y = 115},
		water = {x = 998, y = 113},
		earth = {x = 1071, y = 126},
	}
}

function Tracker:initialize()
	self.goldEventFlipped = 0
	self.goldEventExplosionX, self.goldEventExplosionY = -1000, -1000
	
	self.elementFlipped = {
		fire = 0, air = 0, water = 0, earth = 0
	}
	self.elementExplosionX, self.elementExplosionY = -1000, -1000
	
	Animators.explosions.done.animation:pause()
	
	self.mouseX, self.mouseY = -1000, -1000
	Animators.explosions.cardClick.animation:pause()
	
	self.timer = Timer.new()
end

function Tracker:onDeckClicked(mouseX, mouseY)
	self.mouseX, self.mouseY = mouseX, mouseY
	Animators.explosions.cardClick.animation:resume()
end

function Tracker:onGoldEventFlip()
	self.goldEventFlipped = self.goldEventFlipped + 1
	
	self.goldEventExplosionX = pos.goldEvents[self.goldEventFlipped].x
	self.goldEventExplosionY = pos.goldEvents[self.goldEventFlipped].y
	Animators.explosions.goldEvent.animation:resume()
end

function Tracker:onElementFlip(element)
	self.elementFlipped[element] = self.elementFlipped[element] + 1
	
	self.elementExplosionX = pos.elements[element].x
	self.elementExplosionY = pos.elements[element].y
	Animators.explosions.element.animation:resume()
	
	if self:hasAllElements() then
		self.timer:after(0.4, function()
					Animators.explosions.done.animation:resume()
					for element, count in pairs(self.elementFlipped) do
						self.elementFlipped[element] = self.elementFlipped[element] - 1
					end
				end)
	end
end

function Tracker:hasAllElements()
	local elementFlipped = self.elementFlipped

	if elementFlipped.fire >= 1 and elementFlipped.air >= 1 and
			elementFlipped.water >= 1 and elementFlipped.earth >= 1 then
		return true
	else
		return false
	end
end

function Tracker:update(dt)
	self.timer:update(dt)

	Animators.flames.goldEvent:update(dt)
	Animators.explosions.goldEvent:update(dt)

	for element, pos in pairs(pos.elements) do
		if Animators.flames[element] ~= nil then
			Animators.flames[element]:update(dt)
		end
	end
	Animators.explosions.element:update(dt)
	
	Animators.explosions.done:update(dt)
	
	Animators.explosions.cardClick:update(dt)
end

function Tracker:draw()
	love.graphics.setColor(1, 1, 1)
	
	for i = 1, self.goldEventFlipped do
		Animators.flames.goldEvent:draw(pos.goldEvents[i].x, pos.goldEvents[i].y - 42, 0, 1.6, 1.6)
	end
	if Animators.explosions.goldEvent.animation.status ~= 'paused' then
		Animators.explosions.goldEvent:draw(self.goldEventExplosionX, self.goldEventExplosionY, 0, 1, 1)
	end
	
	if self.elementFlipped.fire >= 1 then
		Animators.flames.fire:draw(pos.elements.fire.x, pos.elements.fire.y - 56, -math.pi/2, 2, 2.2)
	end
	if self.elementFlipped.air >= 1 then
		Animators.flames.air:draw(pos.elements.air.x, pos.elements.air.y - 72, -math.pi/2, 2, 2.2)
	end
	if self.elementFlipped.water >= 1 then
		Animators.flames.water:draw(pos.elements.water.x, pos.elements.water.y - 72, -math.pi/2, 2, 2.2)
	end
	if self.elementFlipped.earth >= 1 then
		Animators.flames.earth:draw(pos.elements.earth.x, pos.elements.earth.y - 56, -math.pi/2, 2, 2.2)
	end
	if Animators.explosions.element.animation.status ~= 'paused' then
		Animators.explosions.element:draw(self.elementExplosionX, self.elementExplosionY - 4, 0, 1.2, 1.2)
	end
	
	if Animators.explosions.done.animation.status ~= 'paused' then
		for element, pos in pairs(pos.elements) do
			Animators.explosions.done:draw(pos.x, pos.y - 28, 0, 1, 1)
		end
	end
	
	if Animators.explosions.cardClick.animation.status ~= 'paused' then
		Animators.explosions.cardClick:draw(self.mouseX, self.mouseY, 0, 1.2, 1.2)
	end
end

return Tracker
