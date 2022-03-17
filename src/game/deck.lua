local Card = require 'src.game.card'

local Deck = Class('Deck')

function Deck:initialize(x, y)
	self.x, self.y = x, y
	self.w, self.h = 232, 315
	self.cards = {}
	
	-- Action queue
	self.actionQueue = {}
	self.timer = Timer.new()
	self.isInAction = false
	
	-- Action specific stuff
	self.vertices = {{self.w, 0, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 1, 1, 1},
			{0, self.h, 1, 1, 1, 1, 1}, {self.w, self.h, 0, 1, 1, 1, 1}}
	self.mesh = love.graphics.newMesh(self.vertices, 'fan')
	self.currentTopSprite = nil
	self.isFlipping = false
end

function Deck:addCardToBottom(name, value, score, group, type, event, sprite)
	table.insert(self.cards, Card(name, value, score, group, type, event, sprite))
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
	
	if action == 'flip' or 'stab' then
		table.remove(self.cards, 1)
	
		--self.isFlipping = true
		
		--self.currentTopSprite = nil
		--self.timer:tween(flipTime, self.vertices[1], {self.cWidth/2, 12}, 'linear')
		--self.timer:tween(flipTime, self.vertices[2], {self.cWidth/2, -24}, 'linear')
		--self.timer:tween(flipTime, self.vertices[3], {self.cWidth/2, self.cHeight + 24}, 'linear')
		--self.timer:tween(flipTime, self.vertices[4], {self.cWidth/2, self.cHeight - 12}, 'linear')
		
		--self.timer:after(flipTime + 0.05,
				--function()
					--if self.currentCard ~= nil then self.currentTopSprite = self.currentCard.sprite
					--else self.currentTopSprite = nil
					--end
					--self.timer:tween(flipTime, self.vertices[1], {0, 0}, 'linear')
					--self.timer:tween(flipTime, self.vertices[2], {self.cWidth, 0}, 'linear')
					--self.timer:tween(flipTime, self.vertices[3], {self.cWidth, self.cHeight}, 'linear')
					--self.timer:tween(flipTime, self.vertices[4], {0, self.cHeight}, 'linear')
					
					--self.timer:after(0.7, function()
							--self.timer:tween(0.3, self, {currentCardOpacity = 0, oy = -60}, 'linear',
								--function()
									--self.isFlipping = false
									--self.currentCard = self.deck.cards[1]
									--self.timer:after(0.3, function()
											--self.oy = 0
											--self.currentCardOpacity = 1
											--self.vertices[1][1], self.vertices[1][2] = self.cWidth, 0
											--self.vertices[2][1], self.vertices[2][2] = 0, 0
											--self.vertices[3][1], self.vertices[3][2] = 0, self.cHeight
											--self.vertices[4][1], self.vertices[4][2] = self.cWidth, self.cHeight
											
											--table.remove(self.deck.cards, 1)
											--self:onActionEnded()
										--end)
								--end)
						--end)
				--end)
	end
end

function Deck:update(dt)
	self.timer:update(dt)
end

function Deck:draw()
	love.graphics.setColor(0.4, 0.4, 0.4)
	love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
	love.graphics.setColor(1, 1, 1)
	--love.graphics.print(self.cards[1].name, self.x, self.y)
	love.graphics.print('guten morgen', self.x, self.y)
end

function Deck:mousemoved(x, y)

end

function Deck:mousepressed(x, y, button)
	if self.x > x or x > self.x + cWidth or
			self.y > y or y > self.y + cHeight then	
		return
	end
	
	if button == 1 then
		self:addActionToBottom('flip')
	elseif button == 2 then
		self:addActionToBottom('stab')
	end
end

return Deck
