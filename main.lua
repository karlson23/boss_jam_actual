local StateManager = require("stateManager")

local MenuState = require("states/MenuState/menuState")
local PlayState = require("states/PlayState/playState")
local PauseState = require("states/PauseState/pauseState")

StateManager:registerState("menu", MenuState)
StateManager:registerState("play", PlayState)
StateManager:registerState("pause", PauseState)

StateManager:switchTo("menu")

function love.keyreleased(key, scancode)
    StateManager:keyreleased(key, scancode)
end

function love.mousepressed(x, y, button, istouch, presses)
    StateManager:mousepressed(x, y, button, istouch, presses)    
end


function love.update(dt)
    StateManager:update(dt)
end

function love.draw()
    StateManager:draw()
end