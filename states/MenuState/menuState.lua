local GameState = require("Classes/gameState")
local StateManager = require("stateManager")

local MenuState = GameState:new({
    name = "MenuState"
})

local UI_class = require ("Classes/Uiclass")

local checkCollision = require ("functions/CollisionFile")

local PlayButton = UI_class:new({
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2,
    width = 50,
    height = 50,

    image = image,

    mode = "line",

    string = "Play"
    })

function MenuState:onEnter()
    print("Menu State entered")

    if not self.mouse then
        self.mouse = {}
        self.mouse.x, self.mouse.y = love.mouse.getPosition()
        self.mouse.mode = "line" -- Collision outline
        self.mouse.width = 15 --Collision width and height
        self.mouse.height = 15
    end

    

end

function MenuState:onExit()
    print("Menu State exited")
end

function MenuState:update(dt)
    self.mouse.x, self.mouse.y = love.mouse.getPosition()

    if checkCollision(PlayButton, self.mouse) and love.mouse.isDown(1) then
        StateManager:switchTo("play")
    end
end

function MenuState:draw()
    love.graphics.rectangle(self.mouse.mode, self.mouse.x, self.mouse.y, self.mouse.width, self.mouse.height)
    love.graphics.rectangle(PlayButton.mode, PlayButton.x, PlayButton.y, PlayButton.width, PlayButton.height)
    love.graphics.print(PlayButton.string, PlayButton.x , PlayButton.y, 0, 1.5,1.5)
end

return MenuState