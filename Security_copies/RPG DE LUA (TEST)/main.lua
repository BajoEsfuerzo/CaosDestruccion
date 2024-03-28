_G.love = require("love")

scale = 2

bump = require 'Libreries/bump'
require("player")
require("player2")
require("npc")
require("wall")

function love.load()
    
   song = love.audio.newSource( "Sounds/RedMax.wav" , "stream" )
   song:setLooping(true)
   song:play()
   
   world = bump.newWorld()

--Load external files
    Player:load(world)
    Player2:load(world)
    Npc:load()
    Wall:load()

end
function love.update(dt)
    if dt > 0.030 then return end
    Player:update(dt)
    Player2:update(dt)
    Npc:update(dt)
    Wall:update(dt)
end
function love.draw()
    Player:draw()
    Player2:draw()
    Npc:draw()
    Wall:draw()
end
