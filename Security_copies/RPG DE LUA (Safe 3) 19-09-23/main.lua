_G.love = require("love")
bump = require 'bump'
world = bump.newWorld()
require("player")
require("npc")
require("wall")

function love.load()
    Player:load()
    Npc:load()
    Wall:load()

end
function love.update(dt)
    Player:update(dt)
    Npc:update(dt)
    Wall:update(dt)
end
function love.draw()
    Player:draw()
    Npc:draw()
    Wall:draw()
end
