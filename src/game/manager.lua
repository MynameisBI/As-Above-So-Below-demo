local Manager = Class('Manager')

function Manager:initialize(...)
	self.entities = {...}
end

function Manager:add(entity)
	self.entities[#self.entities+1] = entity
	return entity
end

function Manager:update(dt)
	for i, entity in ipairs(self.entities) do
		entity:update(dt)
	end
end

function Manager:draw()
	for i, entity in ipairs(self.entities) do
		entity:draw()
	end
end

function Manager:mousemoved(x, y)
	for i, entity in ipairs(self.entities) do
		-- slowness eww
		if entity.mousemoved then entity:mousemoved(x, y) end
	end
end

function Manager:mousepressed(x, y, button)
	for i, entity in ipairs(self.entities) do
		-- slowness eww
		if entity.mousepressed then entity:mousepressed(x, y, button) end
	end
end

function Manager:mousereleased(x, y, button)
	for i, entity in ipairs(self.entities) do
		-- slowness eww
		if entity.mousereleased then entity:mousereleased(x, y, button) end
	end
end

return Manager
