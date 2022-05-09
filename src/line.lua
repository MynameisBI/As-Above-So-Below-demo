local Line = Class('Line')

function Line:initialize(text, oppyIndex)
	self.text = text or ''
	self.oppyIndex = oppyIndex
end

return Line
