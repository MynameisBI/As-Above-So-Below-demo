require 'globals'
require 'assets'

Game = require 'src.game.game'
Menu = require 'src.menu.menu'

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(Game)
end

function love.update()
	
end

function love.draw()

end
