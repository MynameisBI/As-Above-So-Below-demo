local Line = Class('Line')

function Line:initialize(text, oppyIndex, overlayIndex)
	self.text = text or ''
	self.oppyIndex = oppyIndex
	
	if overlayIndex ~= nil then
		self.oppyIndex = nil
		self.tutorialIndex = oppyIndex
		self.overlayIndex = overlayIndex
	end
end

return Line
