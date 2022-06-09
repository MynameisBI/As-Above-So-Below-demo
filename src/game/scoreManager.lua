local ScoreManager = Class('ScoreManager')

function ScoreManager:initialize(startingScore, x, y)
	self.x, self.y = x or 960, y or 562

	self.score = startingScore or 0
	self.triPrimaObtained = 0
	
	self.scoreAmplifier = 1
end

function ScoreManager:setScoreAmplifier(amplifier)
	self.scoreAmplifier = amplifier or 1
end

function ScoreManager:modifyScore(modifier)
	self.score = self.score + modifier * self.scoreAmplifier
	self.scoreAmplifier = 1
	return self.score
end

function ScoreManager:modifyTriPrimaObtained(modifier)
	self.triPrimaObtained = self.triPrimaObtained + modifier
end

function ScoreManager:onCardChange()
	local isEmpty = true
	for i = 1, 4 do
		if #Gamestate.current().decks.entities[i].cards ~= 0 then
			isEmpty = false
		end
	end
	if isEmpty then
		if self.triPrimaObtained == 3 then
			print('You did it')
		end
	end
end

function ScoreManager:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(Fonts.score)
	local t, f = tostring(self.score), love.graphics.getFont()
	for i = -3, 3 do
		love.graphics.print(t, self.x - f:getWidth(t)/2 + i / 3, self.y - f:getHeight()/2)
	end
end

return ScoreManager
