local Load = Class('Load', State)

function Load:enter(from, background, cardsNum, baseDeck, wildCards)
	State.initialize(self)

	self.loadingScreen = Videos.loadingScreen
	self.loadingScreen:play()
	
	self.background, self.cardsNum, self.baseDeck, self.wildCards = background, cardsNum, baseDeck, wildCards
end

function Load:_update(dt)
	if self.loadingScreen:isPlaying() == false then
		Gamestate.switch(Game, self.background, self.cardsNum, self.baseDeck, self.wildCards)
	end
end

function Load:_draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.loadingScreen, 0, 0,
			0, 1920 / self.loadingScreen:getWidth(), 1080 / self.loadingScreen:getHeight())
end

return Load
