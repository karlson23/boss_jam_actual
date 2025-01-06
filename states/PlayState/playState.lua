local GameState = require("Classes/gameState")
local StateManager = require("stateManager")

local PlayState = GameState:new({
    name = "PlayState"
})

local player = require 'Classes.player'
function PlayState:onEnter()
    print("Game play entered")
end

function PlayState:onExit()
    print("Game play exited")
end

function PlayState:keyreleased(key, scancode)
    player:keyreleased(key, scancode)
end

function PlayState:update(dt)
    player:update(dt)
end

function PlayState:draw()
    love.graphics.print("Game play. 'esc' => 'menu'. 'p' => 'pause'")
    player:draw()
end

return PlayState