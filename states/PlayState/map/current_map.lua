local sti = require 'libs.sti'
local current_map = {}
current_map.map = 'none loaded'
current_map.enemy_table = {}
current_map.item_table = {}

current_map.load = function(path, old_current_map)

	if path then
		current_map.map = sti(path)

		if current_map.map.layers['steel_short_sword_spawn'] then
			local steel_short_sword_class = require 'Classes/weapons/sword_class/steel_short_sword'
			for index, spawn_point in ipairs(current_map.map.layers['steel_short_sword_spawn'].objects) do
				local steel_short_sword = steel_short_sword_class:new({
					x = spawn_point.x,
					y = spawn_point.y
				})

				table.insert(current_map.item_table, steel_short_sword)
			end
		end
	end

	if old_game_map then
	end
end

current_map.load('states/PlayState/map/maps/main_area.lua')

current_map.update = function(dt)
end

current_map.draw = function()

	if current_map.map.layers['background'] then
		current_map.map:drawLayer(current_map.map.layers['background'])
	end

	for item_index, item in ipairs(current_map.item_table) do
		item:draw()
	end
end

return current_map