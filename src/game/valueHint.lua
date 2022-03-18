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
	local f = love.graphics.getFont()
	local t = 'vHint:\n'..self.hint
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(t, self.x - f:getWidth(t)/2, self.y - f:getHeight())
end

return ValueHint
