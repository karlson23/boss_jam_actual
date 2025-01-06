local Ui = {}
Ui.__index = Ui

function Ui.new(self, stat)
	local self = {}
	self.x = stat.x
	self.y = stat.y
	self.width = stat.width
	self.height = stat.height

	self.image = stat.image

	self.mode = stat.mode --"LINE" or "Fill" \\ used for the love.graphics.rectangle

	self.string = stat.string -- string used for displaying stuff.
	return setmetatable(self, Ui)
end

function Ui.update(self)
	-- body
end

function Ui.draw(self)
end

return Ui