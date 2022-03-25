local Menu = {}

function Menu:enter()
	self.suit = Suit.new()
end

function Menu:update(dt)
	if self.suit:Button('PLAY', 600, 580, 300, 200).hit then
		Gamestate.switch(Game)
	end
end

function Menu:draw()
	local sw, sh = love.graphics.getDimensions()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.menu)
	
	self.suit:draw()
end

return Menu
