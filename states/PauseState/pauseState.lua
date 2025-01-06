local GameState = require("Classes/gameState")
local StateManager = require("stateManager")

local PauseState = GameState:new({
    name = "PauseState"
})

function PauseState:onEnter()
    print("Pause State entered")
end

function PauseState:onExit()
    print("Pause State exited")
end

function PauseState:update(dt)
    if love.keyboard.isDown("u") then
        StateManager:switchTo("play")
    end
end

function PauseState:draw()
    love.graphics.print("Pause State. 'u' => 'play'")
end

return PauseState