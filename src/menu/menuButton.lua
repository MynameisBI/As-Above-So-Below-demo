local Button = require 'src.game.button'

local MenuButton = Class('MenuButton', Button)

function MenuButton:initialize(sprite, hoveredSprite, x, y, w, h, spriteOx, spriteOy, executeFunc, sound)
	Button.initialize(self, sprite, x, y, w, h, executeFunc, 0, 0, sound)
	self.hoveredSprite = hoveredSprite
	self.spriteOx = spriteOx or 0
	self.spriteOy = spriteOy or 0
end

function MenuButton:draw()
	local sprite
	if not self.isHovered then sprite = self.sprite
	else sprite = self.hoveredSprite
	end

	love.graphics.setColor(self.color)
	love.graphics.draw(sprite, self.x, self.y, 0, self.size, self.size,
			sprite:getWidth() / 2 + self.spriteOx, sprite:getHeight() / 2 + self.spriteOy)
end

return MenuButton
