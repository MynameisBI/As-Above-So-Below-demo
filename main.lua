require 'globals'
require 'assets'

DATA = require 'data'

AudioManager = require 'src.audioManager'

Menu = require 'src.menu.menu'
World = require 'src.world.world'
Level = require 'src.level.level'
Game = require 'src.game.game'

function love.load()
	math.randomseed(os.time())

	Gamestate.registerEvents()
	Gamestate.switch(Game)
end

function love.update()
	
end

function love.draw()

end
