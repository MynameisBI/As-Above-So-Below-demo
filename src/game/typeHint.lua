local TypeHint = Class('TypeHint')

function TypeHint:initialize(x, y, dir, leftDeck, rightDeck)
	self.x, self.y = x, y
	
	self.dir = dir
	
	self.leftDeck, self.rightDeck = leftDeck, rightDeck
	
	self.hint = nil
	self:onCardChanged()
end

function TypeHint:onCardChanged()
	if #self.leftDeck.cards <= 0 or #self.rightDeck.cards <= 0 then
		self.hint = ''
		return 1
	end

	self.hint = self:getHint(self.leftDeck.cards[1], self.rightDeck.cards[1])
end

function TypeHint:getHint(leftCard, rightCard)
	if leftCard.type == rightCard.type then return '='
	elseif leftCard.group == rightCard.group then return '~'
	else return '=/='
	end
end

function TypeHint:update(dt)
end

function TypeHint:draw()
	if self.hint == nil then return end
	
	local sprite = Sprites.hints.typeHints[self.dir][self.hint]
	if sprite ~= nil then
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(sprite, self.x, self.y, 0, 0.75, 0.75, sprite:getWidth() / 2, sprite:getHeight() / 2)
	end
end

return TypeHint
