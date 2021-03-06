local Load = Class('Load', State)

function Load:enter(from, background, cardsNum, baseDeck, wildCards, startingPoint, minimumPoint, to)
	State.initialize(self)

	self.to = to or Game
	if self.to == Game then
		local index = math.random(1, 3)
		if index == 3 then index = 4 end
		self.loadingScreen = Sprites.loadingScreens[index]
		
	elseif self.to == Menu then
		if from == Intro then
			self.loadingScreen = Sprites.intro.loadingScreen
		else
			self.loadingScreen = Sprites.loadingScreens[math.random(3, 4)]
		end
		
	elseif self.to == Trading then
		self.loadingScreen = Sprites.loadingScreens[math.random(2, 3)]
	end
	
	self.background, self.cardsNum, self.baseDeck, self.wildCards = background, cardsNum, baseDeck, wildCards
	self.startingPoint = startingPoint
	self.minimumPoint = minimumPoint
	
	self.progress = 0
	self.timer = Timer.new()
	self.timer:tween(4.9, self, {progress = 99}, 'linear')
	
	Videos.loadingSymbol:rewind()
	Videos.loadingSymbol:play()
	
	self.from = from
	
	self.isAnimationEnded = false
end

function Load:_update(dt)
	self.timer:update(dt)

	if not Videos.loadingSymbol:isPlaying() and not self.isAnimationEnded then
		self.isAnimationEnded = true
	
		self:fadeToDark(function()
					Gamestate.switch(self.to, self.background,
							self.cardsNum, self.baseDeck, self.wildCards, self.startingPoint)
				end, 0.2)
	end
end

function Load:_draw()
	love.graphics.setColor(1, 1, 1)
	
	love.graphics.draw(Videos.loadingSymbol, 34, 12)
	
	love.graphics.draw(self.loadingScreen, 0, 796)
	
	local t = string.format('%d%%', self.progress)
	love.graphics.setFont(Fonts.cardValue)
	love.graphics.print(t, 960, 684, 0, 1, 1, Fonts.cardValue:getWidth(t) / 2)
end

return Load
