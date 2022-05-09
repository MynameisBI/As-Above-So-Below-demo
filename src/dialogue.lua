local Button = require 'src.game.button'

local Dialogue = Class('Dialogue')

function Dialogue:initialize()
	self.lines = {}
	self.currentLineIndex = 1
	self.currentOppyIndex = 1
	self.currentLineLength = 1
	self.secondsPerAddChar = 0.035
	self.secondsToAddChar = 0
	
	self.skipButton = Button(Sprites.dialogue.skipButton, 1780, 734, nil, nil, function() self:skipAll() end)
	
	self.isActive = false
end

function Dialogue:setNewLines(...)
	self.lines = {...}
	self.currentLineIndex = 1
	self.currentOppyIndex = 1
	self.currentLineLength = 1
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
			return
		end
		
		if self.lines[self.currentLineIndex].oppyIndex ~= nil then
			self.currentOppyIndex = self.lines[self.currentLineIndex].oppyIndex
		end
	end
end

function Dialogue:skipAll()
	self.isActive = false
	self.currentLineIndex = #self.lines
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
	
	love.graphics.draw(Sprites.dialogue.textBox, 0, 628)
	
	self.skipButton:draw()
	
	love.graphics.draw(Sprites.dialogue.oppy[self.currentOppyIndex], 20, 628)
	
	local t = string.sub(self.lines[self.currentLineIndex].text, 1, self.currentLineLength)
	local f = Fonts.result_small
	if t == nil then return end
	love.graphics.setFont(f)
	local width, lines = f:getWrap(t, 1230)
	for i = 1, #lines do
		love.graphics.print(lines[i], 510, 816 + (f:getHeight(t) + 4) * (-#lines/2 + i))
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

return Dialogue
