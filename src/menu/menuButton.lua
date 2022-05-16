local Button = require 'src.game.button'

local MenuButton = Class('MenuButton', Button)

function MenuButton:initialize(sprite, hoveredSprite, x, y, w, h, spriteOx, spriteOy, executeFunc)
	Button.initialize(self, sprite, x, y, w, h, executeFunc)
	self.hoveredSprite = hoveredSprite
	self.spriteOx = spriteOx or 0
	self.spriteOy = spriteOy or 0
end

function MenuButton:draw()
	--local sprite
	--if self.size <= 1.02 then sprite = self.sprite
	--elseif self.size > 1.02 then sprite = self.hoveredSprite
	--end

	local sprite
	if not self.isHovered then sprite = self.sprite
	else sprite = self.hoveredSprite
	end

	love.graphics.setColor(self.color)
	love.graphics.draw(sprite, self.x, self.y, 0, self.size, self.size,
			sprite:getWidth() / 2 + self.spriteOx, sprite:getHeight() / 2 + self.spriteOy)
end

function MenuButton:hit(x, y, button)
	AudioManager:play('otherSounds', 'button')

	self.executeFunc(self, x, y, button)
end

return MenuButton
