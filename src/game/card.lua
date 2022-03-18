local Card = Class('Card')

function Card:initialize(name, value, score, triValue, group, type, event, sprite)
	self.name = name
	
	self.value = value
	
	self.score = score or value
	
	self.triValue = triValue or 0
	
	self.group = group
	
	self.type = type
	
	self.event = event 
	
	self.sprite = Sprites.cards.front[sprite]
end

return Card
