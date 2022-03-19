require 'globals'
require 'assets'

DATA = require 'data'

Game = require 'src.game.game'
Menu = require 'src.menu.menu'


function love.load()
	math.randomseed(os.time())

	Gamestate.registerEvents()
	Gamestate.switch(Menu)
end

function love.update()
	
end

function love.draw()

end
