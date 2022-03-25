local ValueHint = Class('ValueHint')

function ValueHint:initialize(x, y, dir, leftDeck, rightDeck)
	self.x, self.y = x, y
	
	self.dir = dir
	
	self.leftDeck, self.rightDeck = leftDeck, rightDeck
	
	self.hint = nil
	self:onCardChanged()
end

function ValueHint:onCardChanged()
	if #self.leftDeck.cards <= 0 or #self.rightDeck.cards <= 0 then
		self.hint = ''
		return 1
	end

	self.hint = self:getHint(self.leftDeck.cards[1], self.rightDeck.cards[1])
end

function ValueHint:getHint(leftCard, rightCard)
	if leftCard.value < rightCard.value then return '<'
	elseif leftCard.value > rightCard.value then return '>'
	else return '='
	end
end

function ValueHint:update(dt)
end

function ValueHint:draw()
	local sprite = Sprites.hints.valueHints[self.dir][self.hint]
	if sprite ~= nil then
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(sprite, self.x, self.y, 0, 0.75, 0.75, sprite:getWidth() / 2, sprite:getHeight() / 2)
	end
end

return ValueHint
