local Frame = Class('Frame')

function Frame:initialize()
	self.isActive = false
	self.buttons = {}
end

function Frame:addButton(key, button)
	self.buttons[key] = button
end

function Frame:setActive(isActive)
	self.isActive = isActive 
end

function Frame:update(dt)
	--if not self.isActive then return end

	for _, button in pairs(self.buttons) do
		button:update(dt)
	end
end

function Frame:draw()
	if not self.isActive then return end

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

function Frame:mousemoved(x, y)
	if not self.isActive then return end

	for _, button in pairs(self.buttons) do
		button:mousemoved(x, y)
	end
end

function Frame:mousepressed(x, y, button)
	if not self.isActive then return end
	
	for _, button in pairs(self.buttons) do
		button:mousepressed(x, y, button)
	end
end

function Frame:mousereleased(x, y, button)
	if not self.isActive then return end

	for _, button in pairs(self.buttons) do
		button:mousereleased(x, y, button)
	end
end

return Frame
