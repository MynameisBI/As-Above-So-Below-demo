local State = Class('State')

local fadeTime = 0.6

function State:initialize()
	self._opacity = 0
	self._timer = Timer.new()
end

function State:update(dt)
	self._timer:update(dt)
	self:_update(dt)
end

function State:_update(dt)
end

function State:draw()
	self:_draw()

	love.graphics.setColor(0, 0, 0, self._opacity)
	love.graphics.rectangle('fill', 0, 0, 1920, 1080)
end

function State:_draw()
end

function State:fadeToDark(after)
	self._opacity = 0
	self._timer:tween(fadeTime, self, {_opacity = 1}, 'quad', after)
end

function State:fadeToBright()
	self._opacity = 1
	self._timer:tween(fadeTime, self, {_opacity = 0}, 'out-quad', after)
end

return State
