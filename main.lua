require 'globals'
require 'assets'

DATA = require 'data'

AudioManager = require 'src.audioManager'

State = require 'src.state'
Intro = require 'src.intro.intro'
Menu = require 'src.menu.menu'
World = require 'src.world.world'
Level = require 'src.level.level'
Trading = require 'src.trading.trading'
Load = require 'src.load.load'
Game = require 'src.game.game'


function love.load()
	math.randomseed(os.time())

	Gamestate.registerEvents()
	--Gamestate.switch(Game, 'theBeginning', 2)
	Gamestate.switch(Intro)
end

function love.update()
	
end

function love.draw()

end

-- Lazy code
function love.mousemoved(x, y)
	local state = Gamestate.current()
	if state ~= nil then
		local inDevFrame = state.inDevFrame
		if inDevFrame ~= nil then
			inDevFrame:mousemoved(x, y)
		end
	end
end

function love.mousepressed(x, y, button)
	local state = Gamestate.current()
	if state ~= nil then
		local inDevFrame = state.inDevFrame
		if inDevFrame ~= nil then
			inDevFrame:mousepressed(x, y, button)
		end
	end
end

function love.mousereleased(x, y, button)
	local state = Gamestate.current()
	if state ~= nil then
		local inDevFrame = state.inDevFrame
		if inDevFrame ~= nil then
			inDevFrame:mousereleased(x, y, button)
		end
	end
end
