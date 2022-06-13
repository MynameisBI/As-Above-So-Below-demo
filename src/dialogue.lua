local Button = require 'src.game.button'

local Dialogue = Class('Dialogue')

function Dialogue:initialize()
	self.lines = {}
	self.currentLineIndex = 1
	self.currentLineLength = 1
	self.secondsPerAddChar = 0.035
	self.secondsToAddChar = 0
	
	self.isTutorial = false
	self.currentOppyIndex = 1
	self.currentTutorialIndex = 1
	self.currentOverlayIndex = 1
	
	self.skipButton = Button(Sprites.dialogue.skipButton, 1542, 660, nil, nil, function() self:skipAll() end)
	
	self.isActive = false
end

function Dialogue:setNewLines(...)
	self.lines = {...}
	
	self.currentLineIndex = 1
	self.currentLineLength = 1
	
	local firstLine = self.lines[1]
	if firstLine.oppyIndex ~= nil then
		self.isTutorial = false
		self.currentOppyIndex = firstLine.oppyIndex
	else
		self.isTutorial = true
		self.currentTutorialIndex = firstLine.tutorialIndex
		self.currentOverlayIndex = firstLine.overlayIndex
	end
	
	self.isActive = true
end

function Dialogue:addLines(...)
	local lines = {...}
	for i = 1, #lines do
		table.insert(self.lines, lines[i])
	end
	self.isActive = true
end

function Dialogue:nextLine()
	if self.currentLineLength < string.len(self.lines[self.currentLineIndex].text) then
		self.currentLineLength = string.len(self.lines[self.currentLineIndex].text)
		
	else
		self.currentLineIndex = self.currentLineIndex + 1
		self.currentLineLength = 1
		
		if self.currentLineIndex > #self.lines then
			self.isActive = false
			self.currentLineIndex = self.currentLineIndex - 1
			
			if Gamestate.current().onDialogueEnd then
				Gamestate.current():onDialogueEnd()
			end
			
			return
		end
		
		local currentLine = self.lines[self.currentLineIndex]
		if currentLine.oppyIndex ~= nil then
			self.isTutorial = false
			self.currentOppyIndex = currentLine.oppyIndex
		elseif currentLine.overlayIndex ~= nil then
			self.isTutorial = true
			self.currentOverlayIndex = currentLine.overlayIndex
			self.currentTutorialIndex = currentLine.tutorialIndex
		end
	end
end

function Dialogue:skipAll()
	self.isActive = false
	self.currentLineIndex = #self.lines
	
	if Gamestate.current().onDialogueEnd then
		Gamestate.current():onDialogueEnd()
	end
end

function Dialogue:update(dt)
	if not self.isActive then return false end

	self.skipButton:update(dt)
	
	self.secondsToAddChar = self.secondsToAddChar - dt
	if self.secondsToAddChar <= 0 then
		self.secondsToAddChar = self.secondsToAddChar + self.secondsPerAddChar
		self.currentLineLength = self.currentLineLength + 1
	end
	
	return true
end

function Dialogue:draw()
	if not self.isActive then return false end

	love.graphics.setColor(1, 1, 1)
	if self.isTutorial == false then
		love.graphics.draw(Sprites.dialogue.textBox, 0, 0)
		
		self.skipButton.y = 734
		self.skipButton:draw()
		
		if self.currentOppyIndex ~= 0 then
			local oppy = Sprites.dialogue.oppy[self.currentOppyIndex]
			love.graphics.draw(oppy, 960, 456,
					0, 1, 1, oppy:getWidth()/2, oppy:getHeight()/2)
		end
		
		print(self.currentLineLength)
		local t = string.sub(self.lines[self.currentLineIndex].text, 1, self.currentLineLength)
		local f = Fonts.dialogue
		if t == nil then return end
		love.graphics.setFont(f)
		local width, lines = f:getWrap(t, 1230)
		for i = 1, #lines do
			love.graphics.printf(lines[i], 0, 852 + (f:getHeight(t) + 4) * (-#lines/2 + i), 1920, 'center')
		end
		
	elseif self.isTutorial == true then
		love.graphics.draw(Sprites.dialogue.tutorials[self.currentTutorialIndex][self.currentOverlayIndex])
	
		love.graphics.draw(Sprites.dialogue.tutorials.textBox, 0, 854, 0, 1, 0.5)
		
		self.skipButton.y = 960
		self.skipButton:draw()
		
		local t = string.sub(self.lines[self.currentLineIndex].text, 1, self.currentLineLength)
		local f = Fonts.dialogue_small
		if t == nil then return end
		love.graphics.setFont(f)
		local width, lines = f:getWrap(t, 1560)
		for i = 1, #lines do
			love.graphics.print(lines[i], 180, 930 + (f:getHeight(t) + 4) * (-#lines/2 + i))
		end
	end
	
	return true
end

function Dialogue:mousepressed(x, y, button)
	if not self.isActive then return false end

	self.skipButton:mousepressed(x, y, button)
	self:nextLine()
	
	return true
end

function Dialogue:mousereleased(x, y, button)
	if not self.isActive then return false end
	
	self.skipButton:mousereleased(x, y, button)
	
	return true
end

function Dialogue:mousemoved(x, y)
	if not self.isActive then return false end

	self.skipButton:mousemoved(x, y)
	
	return true
end

function Dialogue:keypressed(key, scancode, isRepeat)
	if not self.isActive then return false end

	if scancode == 'space' then
		self:nextLine()
	end
	
	return true
end

return Dialogue
