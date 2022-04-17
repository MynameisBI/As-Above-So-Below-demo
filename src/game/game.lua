local Deck = require 'src.game.deck'
local ValueHint = require 'src.game.valueHint'
local TypeHint = require 'src.game.typeHint'
local ScoreManager = require 'src.game.scoreManager'
local Tracker = require 'src.game.tracker'
local ResultFrame = require 'src.game.resultFrame'
local PauseFrame = require 'src.game.pauseFrame'
local InstructionFrame = require 'src.game.instructionFrame'
local Button = require 'src.game.button'

local Manager = require 'src.game.manager'

local Game = {}

function Game:enter(from, background, cardsNum, baseDeck, wildCards)
	self.background = Sprites.backgrounds[background]

	self.decks = Manager()
	self.hints = Manager()
	
	self.scoreManager = ScoreManager(5)
	if cardsNum == 2 then self.scoreManager.y = 286 end
	
	self.tracker = Tracker()
	
	self.resultFrame = ResultFrame()
	
	self.paused = false
	self.pauseFrame = PauseFrame()
	self.pauseButton = Button(Sprites.pauseButton, 1853, 57, 114, 114,
			function()
				if self.paused then self:resume()
				else self:pause()
				end
			end)

	self.instructionFrame = InstructionFrame()
	self.instructionButton = Button(Sprites.instruction.button, 178, 86, 280, 176,
			function()
				self.instructionFrame:setActive(true)
			end)
	
	self:setupGame(cardsNum)
end

function Game:setupGame(cardsNum)
	local decks, typeHints, valueHints = {}, {}, {}

--232, 315   116, 157.5

	-- Initialize all the decks
	if cardsNum == 2 then
		decks[1] = self.decks:add(Deck(628, 396, -104, 158))
		decks[2] = self.decks:add(Deck(1060, 396, 104, 158))
	elseif cardsNum == 3 then
		decks[1] = self.decks:add(Deck(844, 152, -60, 80))
		decks[2] = self.decks:add(Deck(554, 564, -58, 200))
		decks[3] = self.decks:add(Deck(1134, 564, 292, 200))
	elseif cardsNum == 4 then
		decks[1] = self.decks:add(Deck(630, 170, -58, 150))
		decks[2] = self.decks:add(Deck(1060, 170, 284, 150))
		decks[3] = self.decks:add(Deck(630, 635, -58, 164))
		decks[4] = self.decks:add(Deck(1060, 635, 284, 164))
	end
		-- add base cards
	for i, deck in ipairs(self.decks.entities) do
		for j, cardId in ipairs(DATA.deck.base) do
			deck:addCard(cardId)
		end
	end
		-- add mixed cards
	local mixedCardIds = {}
	for i, mixedCardId in ipairs(DATA.deck.mixed) do
		table.insert(mixedCardIds, mixedCardId)
	end
	local i = 0
	while #mixedCardIds >= 1 do
		i = i + 1
		if i > #self.decks.entities then i = 1 end
		
		local mixedCardIdsIndex = math.random(1, #mixedCardIds)
		self.decks.entities[i]:addCard(mixedCardIds[mixedCardIdsIndex])
		table.remove(mixedCardIds, mixedCardIdsIndex)
	end
		-- shuffle deck after adding
	for i, deck in ipairs(self.decks.entities) do
		deck:shuffle()
	end


	-- Follow the deck initialization with the hints
	if cardsNum == 2 then
		typeHints[1] = self.hints:add(TypeHint(956, 487, 'horizontal', decks[1], decks[2]))
		
		valueHints[1] = self.hints:add(ValueHint(956, 623, 'horizontal', decks[1], decks[2]))
		
		decks[1]:registerOnCardChangedEvent(valueHints[1], typeHints[1])
		decks[2]:registerOnCardChangedEvent(valueHints[1], typeHints[1])
		
	elseif cardsNum == 3 then
		typeHints[1] = self.hints:add(TypeHint(680, 455, 'vertical', decks[1], decks[2]))
		typeHints[2] = self.hints:add(TypeHint(1239, 454, 'vertical', decks[1], decks[3]))
		typeHints[3] = self.hints:add(TypeHint(961, 835, 'horizontal', decks[2], decks[3]))
		
		valueHints[1] = self.hints:add(ValueHint(811, 518, 'vertical', decks[1], decks[2]))
		valueHints[2] = self.hints:add(ValueHint(1107, 525, 'vertical', decks[1], decks[3]))
		valueHints[3] = self.hints:add(ValueHint(960, 700, 'horizontal', decks[2], decks[3]))
	
		decks[1]:registerOnCardChangedEvent(valueHints[1], valueHints[2], typeHints[1], typeHints[2])
		decks[2]:registerOnCardChangedEvent(valueHints[1], valueHints[3], typeHints[1], typeHints[3])
		decks[3]:registerOnCardChangedEvent(valueHints[2], valueHints[3], typeHints[2], typeHints[3])
	
	elseif cardsNum == 4 then
		typeHints[1] = self.hints:add(TypeHint(956, 274, 'horizontal', decks[1], decks[2]))
		typeHints[2] = self.hints:add(TypeHint(680, 554, 'vertical', decks[1], decks[3]))
		typeHints[3] = self.hints:add(TypeHint(1240, 556, 'vertical', decks[2], decks[4]))
		typeHints[4] = self.hints:add(TypeHint(960, 834, 'horizontal', decks[3], decks[4]))
		
		valueHints[1] = self.hints:add(ValueHint(956, 410, 'horizontal', decks[1], decks[2]))
		valueHints[2] = self.hints:add(ValueHint(812, 554, 'vertical', decks[1], decks[3]))
		valueHints[3] = self.hints:add(ValueHint(1108, 556, 'vertical', decks[2], decks[4]))
		valueHints[4] = self.hints:add(ValueHint(962, 700, 'horizontal', decks[3], decks[4]))
		
			-- Register OnCardChange event
		decks[1]:registerOnCardChangedEvent(valueHints[1], valueHints[2], typeHints[1], typeHints[2])
		decks[2]:registerOnCardChangedEvent(valueHints[1], valueHints[3], typeHints[1], typeHints[3])
		decks[3]:registerOnCardChangedEvent(valueHints[2], valueHints[4], typeHints[2], typeHints[4])
		decks[4]:registerOnCardChangedEvent(valueHints[3], valueHints[4], typeHints[3], typeHints[4])
	end
end

function Game:endGame(result)
	self.resultFrame:setResultInfo(result, self.scoreManager.score, {})
	self.resultFrame:setActive(true)
end

function Game:pause()
	self.paused = true
	self.pauseFrame:setActive(true)
end

function Game:resume()
	self.paused = false
	self.pauseFrame:setActive(false)
end

function Game:isAnyFrameActive()
	if not (self.resultFrame.isActive or self.pauseFrame.isActive or self.instructionFrame.isActive) then
		return false
	else return true
	end
end

function Game:update(dt)
	self.pauseFrame:update(dt)
	self.instructionFrame:update(dt)
	self.resultFrame:update(dt)
	
	self.pauseButton:update(dt)
	
	self.decks:update(dt)
	self.hints:update(dt)
	
	self.tracker:update(dt)
	
	self.instructionButton:update(dt)
end

function Game:draw()
	-- Background
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.background, 0, 0)

	self.decks:draw()
	self.hints:draw()
	
	self.scoreManager:draw()
	
	self.tracker:draw()
	
	self.pauseButton:draw()
	self.instructionButton:draw()
	
	self.resultFrame:draw()
	self.pauseFrame:draw()
	self.instructionFrame:draw()
end

function Game:mousemoved(x, y)
	self.pauseFrame:mousemoved(x, y)
	self.instructionFrame:mousemoved(x, y)
	self.resultFrame:mousemoved(x, y)
	
	if self:isAnyFrameActive() then return end
	
	self.pauseButton:mousemoved(x, y)

	self.decks:mousemoved(x, y)
	self.hints:mousemoved(x, y)
	
	self.instructionButton:mousemoved(x, y)
end

function Game:mousepressed(x, y, button)
	self.pauseFrame:mousepressed(x, y, button)
	self.resultFrame:mousepressed(x, y, button)
	self.instructionFrame:mousepressed(x, y, button)
	
	if self:isAnyFrameActive() then return end
	
	self.pauseButton:mousepressed(x, y, button)

	self.decks:mousepressed(x, y, button)
	self.hints:mousepressed(x, y, button)
	
	self.instructionButton:mousepressed(x, y, button)
end

function Game:mousereleased(x, y, button)
	self.pauseFrame:mousereleased(x, y, button)
	self.instructionFrame:mousereleased(x, y, button)
	self.resultFrame:mousereleased(x, y, button)

	if self:isAnyFrameActive() then return end
	
	self.pauseButton:mousereleased(x, y, button)
	
	self.instructionButton:mousereleased(x, y, button)
end

function Game:keypressed(key, scancode, isRepeat)
	if scancode == 'escape' and
			((self:isAnyFrameActive() and self.pauseFrame.isActive) or not self:isAnyFrameActive()) then
		if self.paused then self:resume()
		else self:pause()
		end
	end
end

return Game
