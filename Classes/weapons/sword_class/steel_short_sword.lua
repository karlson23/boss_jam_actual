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
	self.stamina_cost = 15

	self.image = 'none yet'
	return setmetatable(self, steel_short_sword)
end



function steel_short_sword:attack_right()
	self.width = self.attack_width
	self.height = self.attack_height
end

function steel_short_sword:attack_left()
	self.width = -self.attack_width
	self.height = -self.attack_height
end

function steel_short_sword:update(dt, user)
	self.width = self.sheathed_width
	self.height = self.sheathed_height
end

function steel_short_sword:draw()
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

return steel_short_sword