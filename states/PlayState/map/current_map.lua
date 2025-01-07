local sti = require 'libs.sti'
local current_map = {}
current_map.map = 'none loaded'
current_map.enemy_table = {}

current_map.load = function(path, old_current_map)

	if path then

		current_map.map = sti(path)
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
end

return current_map