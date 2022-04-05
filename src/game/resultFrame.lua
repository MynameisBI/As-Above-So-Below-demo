local ResultFrame = Class('ResultFrame')

function ResultFrame:initialize()
	self.isActive = false
end

function ResultFrame:setActive(isActive)
	self.isActive = isActive 
end

function ResultFrame:setResultInfo(result, score, reward)
	self.result = result
	self.score = score
	self.reward = reward
end

function ResultFrame:update(dt)

end

function ResultFrame:draw()
	if not self.isActive then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.result.background)

	if self.result == 'win' then
	
	elseif self.result == 'lose' then
	
	end
end

return ResultFrame
