local GameState = require("Classes/gameState")
local StateManager = require("stateManager")

local PlayState = GameState:new({
    name = "PlayState"
})

local current_map = require 'states.PlayState.map.current_map'
local camera = require 'camera'
local user = require 'Classes.player'


function PlayState:onEnter()
    print("Game play entered")
end

function PlayState:onExit()
    print("Game play exited")
end

function PlayState:keyreleased(key, scancode)
    user:keyreleased(key, scancode)
end

function PlayState:update(dt)
    user:update(dt)
end

function PlayState:draw()
    love.graphics.print("Game play. 'esc' => 'menu'. 'p' => 'pause'")
    camera:attach()
        current_map:draw()
        user:draw()
    camera:detach()
end

return PlayState