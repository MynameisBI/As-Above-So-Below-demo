local Manager = Class('Manager')

function Manager:initialize(...)
	self.entities = {...}
end

function Manager:add(entity)
	self.entities[#self.entities+1] = entity
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

return Manager
