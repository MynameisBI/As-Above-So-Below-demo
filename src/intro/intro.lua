local State = require 'src.state'

local Intro = Class('Intro', State)

function Intro:enter()
	State.initialize(self)
	
	self.currentDrawable = nil
	self:next()
	
	self.isFading = false
end

function Intro:next()
	if self.currentDrawable == nil then
		self.currentDrawable = Videos.intro
		self.currentDrawable:rewind()
		self.currentDrawable:play()
		
	elseif self.currentDrawable == Videos.intro then
		if not self.isFading then
			self.isFading = true
			self:fadeToDark(function()
						self:fadeToBright(function() self.isFading = false end, 0.6)
						
						self.currentDrawable:pause()
		
						self.currentDrawable = Sprites.intro.title
						
						Audios.intro:seek(2)
						Audios.intro:setLooping(true)
						Audios.intro:play()
						
						self.isFadingToDark = false
					end, 0.3, nil, 'out-cubic')
		end
		
	elseif self.currentDrawable == Sprites.intro.title then
		if not self.isFading then
			self.isFading = true
			self:fadeToDark(function()
						self:fadeToBright(function() self.isFading = false end, 0.6)
						
						Audios.intro:stop()
			
						self.currentDrawable = Videos.pIntro
						self.currentDrawable:rewind()
						self.currentDrawable:play()
					end, 0.3, nil, 'out-cubic')
		end
		
	elseif self.currentDrawable == Videos.pIntro then
		if not self.isFading then
			self.isFading = true
			self:fadeToDark(function()
						self:fadeToBright(function() self.isFading = false end, 0.6)
						
						self.currentDrawable:pause()
						
						Gamestate.switch(Load, nil, nil, nil, nil, Menu)
					end, 0.3, nil, 'out-cubic')
		end
		
	end
end

function Intro:_update(dt)
	if self.currentDrawable == Videos.intro or self.currentDrawable == Videos.pIntro then
		if self.currentDrawable:isPlaying() == false then
			self:next()
		end
	end
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
