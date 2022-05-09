local Manager = require 'src.game.manager'
local Equipment = require 'src.game.equipment'

local EquipmentManager = Class('EquipmentManager', Manager)

function EquipmentManager:initialize()
	Manager.initialize(self)
	
	local x = 1482
	for id, info in pairs(DATA.equipments) do
		self:add(Equipment(Sprites.equipments[info.sprite],
				x, 1036, info.onHit, info.drawCardOnNextDeckHit))
		x = x + 172
	end
	
	self.activeEquipment = nil
	
	self.equipmentX, self.equipmentY = -1000, -1000
		Animators.explosions.equipmentUse.animation:pause()
end

function EquipmentManager:setActiveEquipment(equipment)
	self.activeEquipment = equipment
	self:removeEntity(equipment)
	
	Animators.explosions.equipmentUse.animation:resume()
	self.equipmentX, self.equipmentY = equipment.x, equipment.y
end

function EquipmentManager:onDeckHit(deck)
	self.activeEquipment.onHit(self.activeEquipment, Gamestate.current().decks.entities, deck)
	self.activeEquipment = nil
end

function EquipmentManager:update(dt)
	for i, entity in ipairs(self.entities) do
		entity:update(dt)
	end
	
	Animators.explosions.equipmentUse:update(dt)
end

function EquipmentManager:draw()
	for i, entity in ipairs(self.entities) do
		entity:draw()
	end
	
	love.graphics.setColor(1, 1, 1)
	if Animators.explosions.equipmentUse.animation.status ~= 'paused' then
		Animators.explosions.equipmentUse:draw(self.equipmentX, self.equipmentY, 0, 1.5, 1.5)
	end
end

return EquipmentManager
