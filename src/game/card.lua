local Card = Class('Card')

function Card:initialize(name, value, score, group, type, event, sprite)
	self.name = name
	
	self.value = value
	
	self.score = score or value
	
	self.group = group
	
	self.type = type
	
	self.event = event 
	
	self.frontSprite = Sprites.cards.front[sprite]
end

return Card
