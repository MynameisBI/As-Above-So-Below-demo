require 'globals'
require 'assets'

DATA = require 'data'

AudioManager = require 'src.audioManager'

State = require 'src.state'
Intro = require 'src.intro.intro'
Menu = require 'src.menu.menu'
World = require 'src.world.world'
Level = require 'src.level.level'
TutorialLevel = require 'src.tutorialLevel.tutorialLevel'
Trading = require 'src.trading.trading'
Load = require 'src.load.load'
Tutorial = require 'src.tutorial.tutorial'
Game = require 'src.game.game'


Dialogue = require 'src.dialogue'
Line = require 'src.line'

_dialogue = Dialogue()

function love.load()
	math.randomseed(os.time())

	--Gamestate.registerEvents()
	--Gamestate.switch(Intro)
	Gamestate.switch(Menu)
	--Gamestate.switch(Game, 'theBeginning', 2, {'b'}, {'f1', 'f2', 'f3', 'w1', 'w2', 'w3'}, 7)
end

function love.update(dt)
	_dialogue:update(dt)
	if Gamestate.current().update then Gamestate.current():update(dt) end
end

function love.draw()
	if Gamestate.current().draw then Gamestate.current():draw() end
	_dialogue:draw()
end

function love.mousemoved(x, y)
	local state = Gamestate.current()
	if state ~= nil then
		local inDevFrame = state.inDevFrame
		if inDevFrame ~= nil then
			inDevFrame:mousemoved(x, y)
		end
		
		if not _dialogue:mousemoved(x, y) then
			if state.mousemoved then state:mousemoved(x, y) end
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
		
		if not _dialogue:mousepressed(x, y, button) then
			if state.mousepressed then state:mousepressed(x, y, button) end
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
		
		if not _dialogue:mousereleased(x, y, button) then
			if state.mousereleased then state:mousereleased(x, y, button) end
		end
	end
end

function love.wheelmoved(x, y)
	if Gamestate.current().wheelmoved then Gamestate.current():wheelmoved(x, y) end
end	

function love.keypressed(key, scancode, isRepeat)
	if Gamestate.current().keypressed then Gamestate.current():keypressed(key, scancode, isRepeat) end
end
