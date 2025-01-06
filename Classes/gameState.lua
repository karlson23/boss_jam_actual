local GameState = {}
GameState.__index = GameState

function GameState.new(self, stat)
    local self = {}
    self.name = stat.name
    return setmetatable(self, GameState)
end

function GameState.onEnter(self)
end

function GameState.onExit(self)
end

function GameState.update(dt, self)
end

function GameState.draw(self)
end

return GameState