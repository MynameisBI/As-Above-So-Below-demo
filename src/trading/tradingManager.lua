local Manager = require 'src.game.manager'

local TradingManager = Class('TradingManager', Manager)

function TradingManager:initialize()
	Manager.initialize(self)
end

function TradingManager:mousepressed(x, y, button)
	local R = nil
	for i, entity in ipairs(self.entities) do
		local r = entity:mousepressed(x, y, button)
		if r ~= nil then R = r end
	end
	return R
end

return TradingManager
