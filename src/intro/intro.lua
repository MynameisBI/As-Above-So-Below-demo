local State = require 'src.state'

local Intro = Class('Intro', State)

function Intro:enter()
	State.initialize(self)
	
	self.currentDrawable = nil
	self:next()
end

function Intro:next()
	if self.currentDrawable == nil then
		self.currentDrawable = Videos.intro
		self.currentDrawable:rewind()
		self.currentDrawable:play()
		
	elseif self.currentDrawable == Videos.intro then
		self.currentDrawable:pause()
	
		self.currentDrawable = Sprites.intro.title
		
		Audios.intro:seek(2)
		Audios.intro:setLooping(true)
		Audios.intro:play()
		
	elseif self.currentDrawable == Sprites.intro.title then
		Audios.intro:stop()
		
		self.currentDrawable = Videos.pIntro
		self.currentDrawable:rewind()
		self.currentDrawable:play()
		
	elseif self.currentDrawable == Videos.pIntro then
		self.currentDrawable:pause()
		
		Gamestate.switch(Load, nil, nil, nil, nil, Menu)
		
	end
end

function Intro:_update(dt)
end

function Intro:_draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(self.currentDrawable, 0, 0)
end

function Intro:mousepressed()
	self:next()
end

function Intro:keypressed()
	self:next()
end

return Intro
