local InDevFrame = require 'src.inDevFrame'

local State = Class('State')

local fadeTime = 0.6

function State:initialize()
	self._opacity = 0
	self._timer = Timer.new()
	self._image = nil
	
	self.inDevFrame = InDevFrame()
end

function State:update(dt)
	self._timer:update(dt)
	self:_update(dt)
	self.inDevFrame:update(dt)
end

function State:_update(dt)
end

function State:draw()
	self:_draw()
	
	if self._image == nil then
		love.graphics.setColor(0, 0, 0, self._opacity)
		love.graphics.rectangle('fill', 0, 0, 1920, 1080)
	else
		love.graphics.setColor(1, 1, 1, self._opacity)
		love.graphics.draw(self._image, 0, 0)
	end
	
	self.inDevFrame:draw()
end

function State:_draw()
end

function State:fadeToDark(after, delay, image, method)
	self._image = image
	self._opacity = 0
	self._timer:after(delay or 0, function()
				self._timer:tween(fadeTime, self, {_opacity = 1}, method or 'quad', after)
			end)
end

function State:fadeToBright(after, delay, image)
	self._image = image
	self._opacity = 1
	self._timer:after(delay or 0, function()
				self._timer:tween(fadeTime, self, {_opacity = 0}, method or 'out-quad', after)
			end)
end

return State
