local player = {}
player.__index = player

function player.new(self, stat)
	local self = {}
	self.x = stat.x
	self.y = stat.y
	self.last_x = self.x
	self.last_y = self.y

	self.width = 32
	self.height = 32

	-- player stats
	-- walking stats
	self.x_velocity = 0
	self.walk_velocity = 100
	self.run_velocity = 150 
	self.x_velocity_in_air = 50

	-- jump stats
	self.jump_force = 150
	self.y_velocity = 0

	--gravity stats
	self.set_gravity = 100
	self.gravity = 100
	self.add_gravity = 15 -- when in air and not holding jump
	self.subtract_gravity = 15 -- for holding jumps

	--things player can do
	self.can_move = true
	self.can_jump = false
	self.can_hold_jump = false

	--things player are doing
	self.onFloor = false
	self.jumping = false
	self.holding_jump = false

	return setmetatable(self, player)
end

function player.keyreleased(self, key, scancode)

end

function player.update(self, dt)
	local isScancodeDown = love.keyboard.isScancodeDown

	self.last_x = self.x
	self.last_y = self.y

	if self.can_move then
		if isScancodeDown('d') then

			if isScancodeDown('lshift') then
				self.x_velocity = self.run_velocity
			else
				self.x_velocity = self.walk_velocity
			end

		elseif isScancodeDown('a') then

			if isScancodeDown('lshift') then
				self.x_velocity = -self.run_velocity
			else
				self.x_velocity = -self.walk_velocity
			end

		end
	end
end

function player.draw(self)
end

local main_user = player:new({})
return main_user