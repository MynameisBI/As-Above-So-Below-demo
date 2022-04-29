local Card = Class('Card')

function Card:initialize(name, value, score, triValue, group, type, triType, event, sprite, valueTextColor, onElementFlip, onGoldEventFlip)
	self.name = name
	
	self.value = value
	
	self.score = score or value
	
	self.triValue = triValue or 0
	self.triType = triType
	
	self.group = group
	
	self.type = type
	
	self.event = event 
	
	self.sprite = Sprites.cards.front[sprite]
	self.valueTextColor = valueTextColor or {0, 0, 0}
	
	self.onElementFlip = onElementFlip or function() end
	self.onGoldEventFlip = onGoldEventFlip or function() end
end

function Card:isPositive()
	if self.group == 'element' or self.group == 'gold' then
		return true
	elseif self.group == 'black' then
		return false
	end
end

return Card
