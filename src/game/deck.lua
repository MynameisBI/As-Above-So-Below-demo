local Card = require 'src.game.card'

local Deck = Class('Deck')

-- Flip animation info
local flipAnimationInfo = {
	flipTime = 0.3,
	delayToFade = 1.1,
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
	self.toBeAddedActions = {}
	self.timer = Timer.new()
	self.isInAction = false
	
	-- Action specific stuff
	self.vertices = {{self.w, 0, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 1, 1, 1},
			{0, self.h, 1, 1, 1, 1, 1}, {self.w, self.h, 0, 1, 1, 1, 1}}
	self.mesh = love.graphics.newMesh(self.vertices, 'fan')
	self.canvas = love.graphics.newCanvas(self.w, self.h)
	self.halfs = {
		deck = self,
		isTearing = false,
		left = {ox = 0, stencilFunction = function() love.graphics.polygon('fill', self.x + self.halfs.left.ox, self.y, self.x + self.halfs.left.ox + 80, self.y, self.x + self.halfs.left.ox + 152, self.y + 315, self.x + self.halfs.left.ox, self.y + 315) end},
		right = {ox = 0, stencilFunction = function() love.graphics.polygon('fill', self.x + self.halfs.right.ox + 80, self.y, self.x + self.halfs.right.ox + 232, self.y, self.x + self.halfs.right.ox + 232, self.y + 315, self.x + self.halfs.right.ox + 152, self.y + 315) end},
		opacity = 1,
		maxOx = 45,
		draw = function(self, cardMesh)
			if self.isTearing then
				love.graphics.stencil(self.left.stencilFunction, 'replace', 1)
				love.graphics.setStencilTest('greater', 0)
					love.graphics.setColor(1, 1, 1, self.opacity)
					love.graphics.draw(cardMesh, self.deck.x + self.left.ox, self.deck.y)
				love.graphics.setStencilTest()
				love.graphics.stencil(self.left.stencilFunction, 'replace', 0)
				
				love.graphics.stencil(self.right.stencilFunction, 'replace', 1)
				love.graphics.setStencilTest('greater', 0)
					love.graphics.setColor(1, 1, 1, self.opacity)
					love.graphics.draw(cardMesh, self.deck.x + self.right.ox, self.deck.y)
				love.graphics.setStencilTest()
				love.graphics.stencil(self.right.stencilFunction, 'replace', 0)
			end
		end
	}
	self.currentFlippedCard = nil
	self.currentFlippedCardOpacity = 1
	self.currentFlippedCardOy = 0
	self.currentFlippedSprite = nil
	self.isFlipping = false
	
	self.autoAddRemoveLeft = 0
	
	self.isVisible = false
end

function Deck:addCard(id)
	local cardInfo = DATA.cardInfos[id]
	table.insert(self.cards,
			Card(cardInfo.name, cardInfo.value, cardInfo.score, cardInfo.triValue,
					cardInfo.group, cardInfo.type, cardInfo.triType,
					cardInfo.event,
					cardInfo.sprite, cardInfo.valueTextColor,
					cardInfo.onElementFlip, cardInfo.onGoldEventFlip )
			)
end

function Deck:shuffle()
	for i = #self.cards, 2, -1 do
    local j = math.random(i)
    self.cards[i], self.cards[j] = self.cards[j], self.cards[i]
  end
end

function Deck:addActionToTop(action)
	table.insert(self.actionQueue, 2, action)
	
	if not self.isInAction then
		self.isInAction = true
		self:executeNextAction()
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
	
	if action == 'select' or action == 'stab' or action == 'remove' then
		self.isVisible = false
	
		if action == 'select' then
			AudioManager:play('cardSounds', 'select')
		elseif action == 'stab' or action == 'remove' then
			AudioManager:play('cardSounds', 'remove')
		end
		
		self.isFlipping = true
		
		self.timer:after(0.05,
				function()
					self:onActionEnded()
				end)	
				
		local center = {x = self.x + self.w/2, y = self.y + self.h/2}
		if action == 'select' then
			Gamestate.current().signal:emit('draw card')
			Gamestate.current().tracker:onDeckDrawCard(center.x, center.y)
		elseif action == 'stab' then
			Gamestate.current().signal:emit('stab card')
			Gamestate.current().tracker:onDeckStabCard(center.x, center.y)
		end
		
	
	elseif action == 'flip and count' or action == 'flip and ignore' then
		self.currentFlippedCard = table.remove(self.cards, 1)
		if self.currentFlippedCard == nil then return end
		
		if action == 'flip and count' then
			Gamestate.current().signal:emit('flip and count', self.currentFlippedCard)
		elseif action == 'flip and ignore' then
			Gamestate.current().signal:emit('flip and ignore', self.currentFlippedCard)
		end
		
		self.currentFlippedSprite = nil
		
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[1], {self.w/2, 12}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[2], {self.w/2, -24}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[3], {self.w/2, self.h + 24}, 'linear')
		self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[4], {self.w/2, self.h - 12}, 'linear')
		
		self.timer:after(flipAnimationInfo.flipTime/2 + 0.01,
				function()
					AudioManager:play('cardSounds', 'flip')
				
					self.currentFlippedSprite = self.currentFlippedCard.sprite
				
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[1], {0, 0}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[2], {self.w, 0}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[3], {self.w, self.h}, 'linear')
					self.timer:tween(flipAnimationInfo.flipTime/2, self.vertices[4], {0, self.h}, 'linear')
					
					if action == 'flip and count' then
						local score = Gamestate.current().scoreManager:modifyScore(self.currentFlippedCard.score)
						Gamestate.current().scoreManager:modifyTriPrimaObtained(self.currentFlippedCard.triValue)
						
						if self.currentFlippedCard.triValue ~= 0 then
							Gamestate.current().tracker:onGoldEventFlip(self.currentFlippedCard.triType)
							
							local decks = Gamestate.current().decks.entities
							for i = 1, #decks do
								local cards = decks[i].cards
								for j = 1, #cards do
									cards[j]:onGoldEventFlip()
								end
							end
							
						elseif self.currentFlippedCard.group == 'element' then
							Gamestate.current().tracker:onElementFlip(self.currentFlippedCard.type)
							
							local decks = Gamestate.current().decks.entities
							for i = 1, #decks do
								local cards = decks[i].cards
								for j = 1, #cards do
									cards[j]:onGoldEventFlip()
								end
							end
						end
						
						if self.currentFlippedCard.event ~= nil then
							self.currentFlippedCard:event(self)
						end
					end
					
					self:onActionEnded()
				end)
				
	elseif action == 'fade flipped card' then
		local delay
		if Settings.cardAutomaticallyFadeAway then delay = flipAnimationInfo.delayToFade
		else delay = 0.05
		end
		
		if self.currentFlippedCard ~= nil then
			if self.currentFlippedCard.name == 'Black 4' then
				AudioManager:play('cardSounds', 'black')
			elseif self.currentFlippedCard.name == 'Charlatan' then
				AudioManager:play('cardSounds', 'charlatan')
			elseif self.currentFlippedCard.name == 'Hard Labor' then
				AudioManager:play('cardSounds', 'hardLabor')
			elseif self.currentFlippedCard.name == 'Heresy' then
				AudioManager:play('cardSounds', 'heresy')
			elseif self.currentFlippedCard.name == 'Gold 4' then
				AudioManager:play('cardSounds', 'gold')
			elseif self.currentFlippedCard.type == 'gold event' then
				AudioManager:play('cardSounds', 'goldEvent')
			elseif self.currentFlippedCard.group == 'element' then
				AudioManager:play('cardSounds', 'element')
			end
		end
		
		self.timer:after(delay, 
				function()
					self.timer:tween(flipAnimationInfo.fadeTime, self,
							{currentFlippedCardOpacity = 0, currentFlippedCardOy = flipAnimationInfo.maxOy}, 'quad',
							function()
								self.timer:after(0.05,
										function()
											self.vertices[1][1], self.vertices[1][2] = self.w, 0
											self.vertices[2][1], self.vertices[2][2] = 0, 0
											self.vertices[3][1], self.vertices[3][2] = 0, self.h
											self.vertices[4][1], self.vertices[4][2] = self.w, self.h
										
											self.currentFlippedCard = nil
											self.currentFlippedCardOpacity = 1
											self.currentFlippedCardOy = 0
											self.currentFlippedSprite = nil
											
											local score = Gamestate.current().scoreManager.score
											local minimumPoint = Gamestate.current().args.minimumPoint
											if score < 0 then
												self:addActionToTop('end and lose')
											elseif self:isAllDeckEmpty() then
												if score >= minimumPoint then	self:addActionToTop('end and win')
												else self:addActionToTop('end and lose')
												end
											end
											self.isFlipping = false
											
											self:onActionEnded()
											self:emitOnCardChangedEvent()
										end)
							end)
				end)
				
	elseif action == 'tear flipped card' then
		local delay
		if Settings.cardAutomaticallyFadeAway then delay = flipAnimationInfo.delayToFade
		else delay = 0.05
		end
		self.timer:after(delay, 
				function()
					AudioManager:play('cardSounds', 'tearInHalf')
				
					self.currentFlippedCardOpacity = 0
					
					self.halfs.isTearing = true
					self.timer:tween(flipAnimationInfo.fadeTime, self.halfs, {opacity = 0}, 'quad')
					self.timer:tween(flipAnimationInfo.fadeTime, self.halfs.left, {ox = -self.halfs.maxOx}, 'quad')
					self.timer:tween(flipAnimationInfo.fadeTime, self.halfs.right, {ox = self.halfs.maxOx}, 'quad',
							function()
								self.timer:after(0.05,
										function()
											self.halfs.isTearing = false
											self.halfs.opacity = 1
											self.halfs.left.ox = 0
											self.halfs.right.ox = 0
											
											self.currentFlippedCard = nil
											self.currentFlippedCardOpacity = 1
											self.currentFlippedCardOy = 0
											self.currentFlippedSprite = nil
											
											local score = Gamestate.current().scoreManager.score
											local minimumPoint = Gamestate.current().args.minimumPoint
											if self:isAllDeckEmpty() then
												if score >= minimumPoint then	self:addActionToTop('end and win')
												else self:addActionToTop('end and lose')
												end
											end
											self.isFlipping = false
											
											self:onActionEnded()
											self:emitOnCardChangedEvent()
										end)		
							end)
				end)
				
	elseif action == 'end and win' or action == 'end and lose' then
		self.timer:after(0.7, function()
					self.isFlipping = false
					if action == 'end and win' then
						Gamestate.current():endGame('win')
					elseif action == 'end and lose' then
						Gamestate.current():endGame('lose')
					end
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

function Deck:isAllDeckEmpty()
	local isAllDeckEmpty = true
	local decks = Gamestate.current().decks.entities
	for i = 1, #decks do
		if #decks[i].cards > 0 then
			isAllDeckEmpty = false
		end
	end
	return isAllDeckEmpty
end

function Deck:moveAllActionsToQueue()
	for i = 1, #self.toBeAddedActions do
		self:addActionToBottom(self.toBeAddedActions[i])
	end
	self.toBeAddedActions = {}
end

function Deck:update(dt)
	self.timer:update(dt)
end

function Deck:draw()
	if #self.cards >= 1 then
		local cardBackOpacity
				
		if Settings.isDebug or self.isVisible then
			local sprite = self.cards[1].sprite
			love.graphics.setColor(1, 1, 1, 0.6)
			love.graphics.draw(sprite, self.x, self.y,
					0, - self.w / sprite:getWidth(), self.h / sprite:getHeight(),
					sprite:getWidth(), 0)
			local defaultFont = love.graphics.getFont()
			love.graphics.setColor(self.cards[1].valueTextColor)
			love.graphics.setFont(Fonts.cardValue)
			love.graphics.print(tostring(self.cards[1].value), self.x + 187, self.y + 273,
					0, -1, 1, Fonts.cardValue:getWidth(tostring(self.cards[1].value))/2, 0)
			cardBackOpacity = 0.2
		else
			cardBackOpacity = 1
		end
		
		local sprite = Sprites.cards.back
		love.graphics.setColor(1, 1, 1, cardBackOpacity)
		love.graphics.draw(sprite, self.x, self.y,
				0, - self.w / sprite:getWidth(), self.h / sprite:getHeight(),
				sprite:getWidth(), 0)
	end
	
	-- Card
	if self.currentFlippedCard ~= nil then
		self.mesh:setVertices(self.vertices)
		if self.currentFlippedSprite == nil then
			self.mesh:setTexture(Sprites.cards.back)
		else
			love.graphics.setCanvas(self.canvas)
				-- Card sprite
				love.graphics.setColor(1, 1, 1)
				love.graphics.draw(self.currentFlippedSprite, 0, 0,
						0, self.w / self.currentFlippedCard.sprite:getWidth(), self.h / self.currentFlippedCard.sprite:getHeight())						
					
				-- Card value	
				local defaultFont = love.graphics.getFont()
				love.graphics.setColor(self.currentFlippedCard.valueTextColor)
				love.graphics.setFont(Fonts.cardValue)
				for i = -3, 3 do
					love.graphics.print(tostring(self.currentFlippedCard.value), 48 + i / 4, 266, -- 206, 15 dep hon
							0, 1, 1,
							Fonts.cardValue:getWidth(tostring(self.currentFlippedCard.value))/2, 0)  -- Optimizable
				end
				love.graphics.setFont(defaultFont)
			love.graphics.setCanvas()
			self.mesh:setTexture(self.canvas)
		end
		love.graphics.setColor(1, 1, 1, self.currentFlippedCardOpacity)
		love.graphics.draw(self.mesh, self.x, self.y - self.currentFlippedCardOy)
		
		self.halfs:draw(self.mesh)
	end
	
	-- Cards left
	local t = string.format('%d', #self.cards)
	love.graphics.setFont(Fonts.cardsLeft)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(t, self.x + self.scoreOx, self.y + self.scoreOy,
			0, 1, 1, Fonts.cardsLeft:getWidth(t) / 2, Fonts.cardsLeft:getHeight() / 2)
end

function Deck:mousemoved(x, y)

end

function Deck:mousepressed(x, y, button)
	if Gamestate.current().resultFrame.isActive then return end

	if self.x >= x or x >= self.x + self.w or
			self.y >= y or y >= self.y + self.h then	
		return
	end
	
	if #self.cards == 0 and self.currentFlippedCard == nil then return end
	
	local equipmentManager = Gamestate.current().equipmentManager
	local activeEquipment = equipmentManager.activeEquipment
	if activeEquipment ~= nil then
		equipmentManager:onDeckHit(self)
		if activeEquipment.drawCardOnNextDeckHit == false then
			return
		end
	end
	
	Gamestate.current().tracker:onDeckClicked(x, y, button)
	
	if self.isInAction then return end
	
	local isAnyDeckFlipping = false
	for _, deck in ipairs(Gamestate.current().decks.entities) do
		if deck.isFlipping then
			isAnyDeckFlipping = true
			break
		end
	end
	
	local actions = {}
	if button == 1 then
		actions[1] = 'select'
		actions[2] = 'flip and count'
		actions[3] = 'fade flipped card'
	elseif button == 2 then
		actions[1] = 'stab'
		actions[2] = 'flip and ignore'
		actions[3] = 'tear flipped card'
	end
	
	if not isAnyDeckFlipping and Settings.cardAutomaticallyFadeAway then
		self:addActionToBottom(actions[1])
		self:addActionToBottom(actions[2])
		self:addActionToBottom(actions[3])
		
	elseif not isAnyDeckFlipping and not Settings.cardAutomaticallyFadeAway then
		self:addActionToBottom(actions[1])
		table.insert(self.toBeAddedActions, actions[2])
		table.insert(self.toBeAddedActions, actions[3])
		
	elseif self.isFlipping ~= nil and button == 1 then
		if #self.toBeAddedActions > 0 then
			self:addActionToBottom(self.toBeAddedActions[1])
			table.remove(self.toBeAddedActions, 1)
			
			if #self.toBeAddedActions == 0 then
				if self.autoAddRemoveLeft >= 1 and #self.cards >= 1 then
					self.autoAddRemoveLeft = self.autoAddRemoveLeft - 1
					
					self:addActionToBottom('remove')
					self:addActionToBottom('flip and ignore')
					table.insert(self.toBeAddedActions, 'tear flipped card')
				end
			end
		end
	end
end

return Deck
