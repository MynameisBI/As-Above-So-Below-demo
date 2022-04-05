local ScoreManager = Class('ScoreManager')

function ScoreManager:initialize()
	self.score = 0
	self.triPrimaObtained = 0
end

function ScoreManager:modifyScore(modifier)
	self.score = self.score + modifier
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
		love.graphics.setColor(1, 1, 1)
		print('Your score: '..tostring(self.score))
		print('You win')
		if self.triPrimaObtained == 3 then
			print('You did it')
		end
	end
end

function ScoreManager:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(Fonts.score)
	local t, f = tostring(self.score), love.graphics.getFont()
	love.graphics.print(t, 960 - f:getWidth(t)/2, 562 - f:getHeight()/2)
end

return ScoreManager
