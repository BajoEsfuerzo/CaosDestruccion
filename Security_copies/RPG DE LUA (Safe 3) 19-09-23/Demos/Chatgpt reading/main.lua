
local Player = require "player"

function love.load()
    
        player = Player:new(100, 100)
    
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end
