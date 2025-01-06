local GameState = require("Classes/gameState")
local StateManager = require("stateManager")

local PlayState = GameState:new({
    name = "PlayState"
})

function PlayState:onEnter()
    print("Game play entered")
end

function PlayState:onExit()
    print("Game play exited")
end

function PlayState:update(dt)
    if love.keyboard.isDown("escape") then
        StateManager:switchTo("menu")
    end

    if love.keyboard.isDown("p") then
        StateManager:switchTo("pause")
    end
end

function PlayState:draw()
    love.graphics.print("Game play. 'esc' => 'menu'. 'p' => 'pause'")
end

return PlayState