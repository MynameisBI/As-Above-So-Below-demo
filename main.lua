require 'globals'
require 'assets'

DATA = require 'data'

AudioManager = require 'src.audioManager'

State = require 'src.state'
Menu = require 'src.menu.menu'
World = require 'src.world.world'
Level = require 'src.level.level'
Trading = require 'src.trading.trading'
Load = require 'src.load.load'
Game = require 'src.game.game'


function love.load()
	math.randomseed(os.time())

	Gamestate.registerEvents()
	Gamestate.switch(Menu)
end

function love.update()
	
end

function love.draw()

end
