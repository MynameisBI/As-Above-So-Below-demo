local State = require 'src.state'
local Manager = require 'src.game.manager'
local MenuButton = require 'src.menu.menuButton'
local Button = require 'src.game.button'

local Achievements = Class('Achievements', State)

function Achievements:enter()
	State.initialize(self)
	
	self.buttons = Manager()
	
	self.buttons:add(MenuButton(Sprites.achievements.philosopherStone.normal, Sprites.achievements.philosopherStone.hovered,
			930, 115, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
	self.buttons:add(MenuButton(Sprites.achievements.pancea.normal, Sprites.achievements.pancea.hovered,
			1355, 310, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
	self.buttons:add(MenuButton(Sprites.achievements.ouroboros.normal, Sprites.achievements.ouroboros.hovered,
			1355, 700, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
	self.buttons:add(MenuButton(Sprites.achievements.elixir.normal, Sprites.achievements.elixir.hovered,
			930, 885, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
	self.buttons:add(MenuButton(Sprites.achievements.homunculus.normal, Sprites.achievements.homunculus.hovered,
			505, 700, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
	self.buttons:add(MenuButton(Sprites.achievements.emeraldTablet.normal, Sprites.achievements.emeraldTablet.hovered,
			505, 310, 185, 245, -30, -40, nil, {'otherSounds', 'achievementsCardHit'}))
			
	self.buttons:add(Button(Sprites.result.XButton,
			1815, 94, 120, 120, function() Gamestate.switch(Menu) end))
			
	AudioManager:play('bgm', 'achievements')
	Videos.achievementsBg:play()
end

function Achievements:leave()
	AudioManager:stop('bgm', 'achievements')
	Videos.achievementsBg:pause()
end

function Achievements:update(dt)
	self.buttons:update(dt)
	
	if Videos.achievementsBg:isPlaying() == false then
		Videos.achievementsBg:rewind()
		Videos.achievementsBg:play()
	end
end

function Achievements:draw()
	love.graphics.draw(Videos.achievementsBg, 0, 0)

	self.buttons:draw()
end

function Achievements:mousemoved(x, y)
	self.buttons:mousemoved(x, y)
end

function Achievements:mousepressed(x, y, button)
	self.buttons:mousepressed(x, y, button)
end

function Achievements:mousereleased(x, y, button)
	self.buttons:mousereleased(x, y, button)
end

return Achievements
