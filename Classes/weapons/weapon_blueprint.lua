local weapon_blueprint = {}
weapon_blueprint.__index = weapon_blueprint

function weapon_blueprint:new()
	local self = {}
	self.type = 'weapon'
	self.weapon_type = 'weapon_blueprint'
	
	return setmetatable(self, weapon_blueprint)
end

function weapon_blueprint:update(dt)
	print('this is a weapon blueprint')
end

function weapon_blueprint:draw()

end

return weapon_blueprint