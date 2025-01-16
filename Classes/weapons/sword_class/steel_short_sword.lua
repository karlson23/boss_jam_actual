local weapon_blueprint = require 'Classes/weapons/weapon_blueprint'
local steel_short_sword = weapon_blueprint:new()
steel_short_sword.__index = steel_short_sword

function steel_short_sword:new(stat)
	local self = {}
	self.weapon_type = 'steel_short_sword'
	self.x = stat.x
	self.y = stat.y

	self.sheathed_width = 16
	self.sheathed_height = 16

	self.width = self.sheathed_width
	self.height = self.sheathed_height

	self.attack_width = 32
	self.attack_height = 32

	self.damage = 15	
	self.cooldown_set = 2
	self.cooldown_current = self.cooldown_set
	self.haste = 1

	self.image = 'none yet'
	return setmetatable(self, steel_short_sword)
end



function steel_short_sword:attack_right()
	if self.cooldown_current < 1 then
		self.width = self.attack_width
		self.height = self.attack_height

		self.cooldown_current = self.cooldown_set
	end
end

function steel_short_sword:attack_left()
	if self.cooldown_current < 1 then
		self.width = -self.attack_width
		self.height = -self.attack_height

		self.cooldown_current = self.cooldown_set
	end
end

function steel_short_sword:update(dt, user)
	self.width = self.sheathed_width
	self.height = self.sheathed_height

	if self.cooldown_current > 0 then
		self.cooldown_current = self.cooldown_current - 1
	end

	print('hey')

end

function steel_short_sword:draw()
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

return steel_short_sword