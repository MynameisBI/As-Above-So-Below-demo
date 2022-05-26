local Button = require 'src.game.button'

local Frame = require 'src.game.frame'

local InventoryFrame = Class('InventoryFrame', Frame)

function InventoryFrame:initialize()
	Frame.initialize(self)
	
	self:addButton('XButton', Button(Sprites.menu.XButtonCopy, 1468, 324, 122, 122,
			function() self:setActive(false) end))
end

function InventoryFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu.inventoryBg)

	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

return InventoryFrame
