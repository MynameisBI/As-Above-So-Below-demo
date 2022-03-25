require 'globals'
require 'assets'

DATA = require 'data'

AudioManager = require 'src.audioManager'

Game = require 'src.game.game'
Menu = require 'src.menu.menu'
World = require 'src.world.world'

function love.load()
	math.randomseed(os.time())

	Gamestate.registerEvents()
	Gamestate.switch(World)
end

function love.update()
	
end

function love.draw()

end
