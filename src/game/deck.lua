local Card = require 'src.game.card'

local Deck = Class('Deck')

-- Flip animation info
local flipAnimationInfo = {
	flipTime = 0.3,
	delayToFade = 0.7,
	fadeTime = 0.3,
	maxOy = 100
}

local flipTime = 0.15

function Deck:initialize(x, y, scoreOx, scoreOy)
	self.x, self.y = x, y
	self.w, self.h = 232, 315
	self.cards = {}
	
	self.scoreOx, self.scoreOy = scoreOx, scoreOy
	
	-- Registered hints for event
	self.registeredHints = {}
	
	-- Action queue
	self.actionQueue = {}
	self.timer = Timer.new()
	self.isInAction = false
	
	-- Action specific stuff
	self.vertices = {{self.w, 0, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 1, 1, 1},
			{0, self.h, 1, 1, 1, 1, 1}, {self.w, self.h, 0, 1, 1, 1, 1}}
	self.mesh = love.graphics.newMesh(self.vertices, 'fan')
	self.currentFlippedCard = nil
	self.currentFlippedCardOpacity = 1
	self.currentFlippedCardOy = 0
	self.currentFlippedSprite = nil
	self.isFlipping = false
end

function Deck:addCard(name, value, score, group, type, event, sprite)
	table.insert(self.cards, Card(name, value, score, group, type, event, sprite))
end

function Deck:addCard(id)
	local cardInfo = DATA.cardInfos[id]
	table.insert(self.cards,
			Card(cardInfo.name, cardInfo.value, cardInfo.score,
					cardInfo.group, cardInfo.type,
					cardInfo.event,
					cardInfo.sprite)
			)
end

function Deck:shuffle()
	for i = #self.cards, 2, -1 do
    local j = math.random(i)
    self.cards[i], self.cards[j] = self.cards[j], self.cards[i]
  end
end

function Deck:addActionToBottom(action)
	table.insert(self.actionQueue, action)
	
	if not self.isInAction then
		self.isInAction = true
		self:executeNextAction()
	end
end

function Deck:onActionEnded()
	table.remove(self.actionQueue, 1)

	if self.actionQueue[1] == nil then
		self.isInAction = false
	else 
		self:executeNextAction()
	end
end

function Deck:executeNextAction()
	local action = self.actionQueue[1]
	
	if action == 'flip' or action == 'stab' then
		self.currentFlippedCard = table.remove(self.cards, 1)
		
		self.isFlipping = true
		
		self.currentFlippedSprite = nil
		
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[1], {self.w/2, 12}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[2], {self.w/2, -24}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[3], {self.w/2, self.h + 24}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[4], {self.w/2, self.h - 12}, 'linear')
		
		self.timer:after(flipAnimationInfo.flipTime/2 + 0.01,
				function()
					self.currentFlippedSprite = self.currentFlippedCard.sprite
				
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[1], {0, 0}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[2], {self.w, 0}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[3], {self.w, self.h}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[4], {0, self.h}, 'linear')
					
					self:onActionEnded()
				end)
				
	elseif action == 'fade flipped card' then
		self.timer:after(flipAnimationInfo.delayToFade, 
				function()
					self.timer:tween(flipAnimationInfo.fadeTime, self,
							{currentFlippedCardOpacity = 0, currentFlippedCardOy = flipAnimationInfo.maxOy}, 'linear',
							function()
								self.timer:after(0.1,
										function()
											self.currentFlippedSprite = nil
										
											self.currentFlippedCardOpacity = 1
											self.currentFlippedCardOy = 0
											self.vertices[1][1], self.vertices[1][2] = self.w, 0
											self.vertices[2][1], self.vertices[2][2] = 0, 0
											self.vertices[3][1], self.vertices[3][2] = 0, self.h
											self.vertices[4][1], self.vertices[4][2] = self.w, self.h
											
											self.isFlipping = false
											self:onActionEnded()
											self:emitOnCardChangedEvent()
										end)
							end)
				end)
	end
end

function Deck:registerOnCardChangedEvent(...)
	for _, hint in ipairs({...}) do
		table.insert(self.registeredHints, hint)
	end
end

function Deck:emitOnCardChangedEvent()
	for i = 1, #self.registeredHints do
		self.registeredHints[i]:onCardChanged()
	end
end

function Deck:update(dt)
	self.timer:update(dt)
end

function Deck:draw()
	love.graphics.setColor(0.4, 0.4, 0.4)
	love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
	
	if #self.cards >= 1 then
		local sprite = Sprites.cards.back
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(sprite, self.x, self.y,
				0, - self.w / sprite:getWidth(), self.h / sprite:getHeight(),
				sprite:getWidth(), 0)
	end
	
	if self.currentFlippedCard ~= nil then
		self.mesh:setVertices(self.vertices)
		if self.currentFlippedSprite == nil then
			self.mesh:setTexture(Sprites.cards.back)
		else
			self.mesh:setTexture(self.currentFlippedSprite)
		end
		love.graphics.setColor(1, 1, 1, self.currentFlippedCardOpacity)
		love.graphics.draw(self.mesh, self.x, self.y - self.currentFlippedCardOy)
	end
	
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(string.format('x%d', #self.cards), self.x + self.scoreOx, self.y + self.scoreOy)
end

function Deck:mousemoved(x, y)

end

function Deck:mousepressed(x, y, button)
	if self.x >= x or x >= self.x + self.w or
			self.y >= y or y >= self.y + self.h then	
		return
	end
	
	if not self.isFlipping then
		if button == 1 then
			self:addActionToBottom('flip')
			self:addActionToBottom('fade flipped card')
		elseif button == 2 then
			self:addActionToBottom('stab')
			self:addActionToBottom('fade flipped card')
		end
	end
end

return Deck
