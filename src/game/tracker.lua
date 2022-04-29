local Tracker = Class('Tracker')

local pos = {
	goldEvents = {
		soul = {x = 881, y = 60},
		spirit = {x = 960, y = 51},
		body = {x = 1037, y = 56},
	},
	elements = {
		fire = {x = 846, y = 123},
		air = {x = 921, y = 115},
		water = {x = 998, y = 113},
		earth = {x = 1071, y = 126},
	}
}

function Tracker:initialize()
	self.goldEventFlipped = {
		body = 0, soul = 0, spirit = 0,
	}
	self.goldEventExplosionX, self.goldEventExplosionY = -1000, -1000
	
	self.elementFlipped = {
		fire = 0, air = 0, water = 0, earth = 0
	}
	self.elementExplosionX, self.elementExplosionY = -1000, -1000
	
	Animators.explosions.done.animation:pause()
	
	self.mouseX, self.mouseY = -1000, -1000
	self.deckX, self.deckY = -1000, -1000
	Animators.explosions.cardClick.animation:pause()
	Animators.cardClick.draw.animation:pause()
	Animators.cardClick.stab.animation:pause()
	
	self.timer = Timer.new()
end

function Tracker:onDeckClicked(mouseX, mouseY, button)
	self.mouseX, self.mouseY = mouseX, mouseY
	Animators.explosions.cardClick.animation:resume()
end

function Tracker:onDeckDrawCard(deckX, deckY)
	self.deckX, self.deckY = deckX, deckY
	Animators.cardClick.draw.animation:resume()
end

function Tracker:onDeckStabCard(deckX, deckY)
	self.deckX, self.deckY = deckX, deckY
	Animators.cardClick.stab.animation:resume()
end

function Tracker:onGoldEventFlip(eventType)
	print(eventType)
	self.goldEventFlipped[eventType] = self.goldEventFlipped[eventType] + 1
	
	self.goldEventExplosionX = pos.goldEvents[eventType].x
	self.goldEventExplosionY = pos.goldEvents[eventType].y
	Animators.explosions.goldEvent.animation:resume()
end

function Tracker:getGoldEventNum()
	local num = 0
	for _, point in pairs(self.goldEventFlipped) do
		num = num + point
	end
	return num
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

function Tracker:getElementNum()
	local num = 0
	for _, point in pairs(self.elementFlipped) do
		num = num + point
	end
	return num
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
	
	Animators.cardClick.draw:update(dt)
	Animators.cardClick.stab:update(dt)
end

function Tracker:draw()
	love.graphics.setColor(1, 1, 1)
	
	--for i = 1, self.goldEventFlipped do
		--Animators.flames.goldEvent:draw(pos.goldEvents[i].x, pos.goldEvents[i].y - 42, 0, 1.6, 1.6)
	--end
	for eventType, flamePos in pairs(pos.goldEvents) do
		if self.goldEventFlipped[eventType] >= 1 then
			Animators.flames.goldEvent:draw(flamePos.x, flamePos.y - 42, 0, 1.6, 1.6)
		end
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
	if Animators.cardClick.draw.animation.status ~= 'paused' then
		Animators.cardClick.draw:draw(self.deckX, self.deckY, 0, 1, 1)
	end
	if Animators.cardClick.stab.animation.status ~= 'paused' then
		Animators.cardClick.stab:draw(self.deckX, self.deckY - 24, 0, 1, 1)
	end
end

return Tracker
