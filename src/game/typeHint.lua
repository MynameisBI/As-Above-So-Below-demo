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
	local f = love.graphics.getFont()
	local t = 'tHint:\n'..self.hint
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(t, self.x - f:getWidth(t)/2, self.y - f:getHeight())
end

return TypeHint
