local player = {}
player.__index = player

local checkCollision = require 'functions.CollisionFile'
local current_map = require 'states.PlayState.map.current_map'

local camera = require 'camera'

player.new = function(self)
	local self = {}
	camera:zoom(1.5)

	self.mouse = {}
	self.mouse.x, self.mouse.y = camera:mousePosition()
	self.mouse.width = 15
	self.mouse.height = 15

	self.mouse.draw = function()
		love.graphics.rectangle("line", self.mouse.x, self.mouse.y, self.mouse.width, self.mouse.height)
	end

	if current_map.map.layers['player_spawn'] then
		for player_spawn_index, player_spawn in ipairs(current_map.map.layers['player_spawn'].objects) do
			self.x = player_spawn.x
			self.y = player_spawn.y - 30
		end
	else
		self.x = 'no player_spawn.x'
		self.y = 'no player_spawn.y'
	end

	self.last_x = self.x
	self.last_y = self.y

	self.width = 32
	self.height = 32
	
	self.touching_cieling = false	
	self.touching_floor = false
	self.touching_wall_right = false
	self.touching_wall_left = false

	self.holding_jump = false

	
	self.can_move = true
	self.can_jump = false
	self.can_hold_jump = false

	

	self.x_velocity_walk_speed = 120
	self.x_velocity_run_speed = 150
	self.x_velocity_in_air_speed = 70
	self.x_set_velocity = 0
	self.x_velocity = self.x_set_velocity

	self.jump_force = 100
	self.gravity_add = 5
	self.gravity_remove = 150
	self.set_gravity = 100
	self.gravity = self.set_gravity
	self.minimum_gravity = 1
	

	self.y_velocity = 0
	self.last_y_velocity = self.y_velocity

	
	--directions
	self.direction_looking_at = nil
	self.looking_left = 'looking_left'
	self.looking_right = 'looking_right'
	self.looking_up = 'looking_up'
	self.looking_down = 'looking_down'

	-- inventory
	self.inventory = {}

	return setmetatable(self, player)
end

player.keyreleased = function(self, key, scancode)
	if scancode == 'space' then
		if self.holding_jump then
			self.can_hold_jump = false
		end
	end
end


player.update = function(self, dt)
	local isScancodeDown = love.keyboard.isScancodeDown

	camera:lookAt(self.x, self.y)
	self.last_x = self.x
	self.last_y = self.y

	self.mouse.x, self.mouse.y = camera:mousePosition()


	if self.can_move then
		if current_map.map.layers['cielings'] then
			for cieling_index, cieling in ipairs(current_map.map.layers['cielings'].objects) do
				if checkCollision(self, cieling) then
					self.y = self.last_y
					self.y_velocity = 5
					self.can_hold_jump = false
				end
			end
		end

		if current_map.map.layers['walls'] then

			
			for wall_index, wall in ipairs(current_map.map.layers['walls'].objects) do
				if checkCollision(self, wall) then
					self.x = self.last_x
				end
			end
		end

		if current_map.map.layers['floors'] then
			self.touching_floor = false

			for floor_index, floor in ipairs(current_map.map.layers['floors'].objects) do
				if checkCollision(self, floor) then
					self.touching_floor = true
					self.y_velocity = 0
					self.gravity = self.set_gravity
					self.can_jump = true
					self.can_hold_jump = true

					self.x = self.last_x
				end
			end
			
			if not self.touching_floor then
				self.can_jump = false

				if self.gravity < self.minimum_gravity then
					self.can_hold_jump = false
					self.gravity = self.set_gravity
				end

				if self.gravity < self.set_gravity and not self.holding_jump then
					self.gravity = self.set_gravity
				end

				self.gravity = self.gravity + self.gravity_add * dt
				self.y_velocity = self.y_velocity + self.gravity * dt
			else
				if love.keyboard.isScancodeDown('space') and self.can_jump then
					self.y_velocity = self.y_velocity - self.jump_force
				end
			end


			if love.keyboard.isScancodeDown('space') and self.can_hold_jump then
				self.gravity = self.gravity - self.gravity_remove * dt
				self.holding_jump = true
			else
				self.holding_jump = false
			end
		


			if love.keyboard.isScancodeDown('d') then
				self.direction_looking_at = self.looking_right

				if self.touching_floor then
					if love.keyboard.isScancodeDown('lshift') then
						self.x_velocity = self.x_velocity_run_speed
					else
						self.x_velocity = self.x_velocity_walk_speed
					end
				else
					self.x_velocity = self.x_velocity_in_air_speed
				end

			elseif love.keyboard.isScancodeDown('a') then
				self.direction_looking_at = self.looking_left

				if self.touching_floor then
					if love.keyboard.isScancodeDown('lshift') then
						self.x_velocity = -self.x_velocity_run_speed
					else
						self.x_velocity = -self.x_velocity_walk_speed
					end
				else
					self.x_velocity = -self.x_velocity_in_air_speed
				end

	
			else
				self.x_velocity = self.x_set_velocity
			end



			self.x = self.x + self.x_velocity * dt
			self.y = self.y + self.y_velocity * dt

			for item_index, item in ipairs(current_map.item_table) do
				if checkCollision(item, self) then
				end
			end

			for item_index, item in ipairs(self.inventory) do
				if item.type == 'weapon' then
					if self.direction_looking_at == self.looking_left then
						
					elseif self.direction_looking_at == self.looking_right then
					end
				end
			end

		end
		
	end
end

player.hud_draw = function(self)
	
	
end

player.draw = function(self)
	self.mouse.draw()
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

local user = player:new()
return user
