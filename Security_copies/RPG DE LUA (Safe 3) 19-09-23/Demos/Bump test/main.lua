local bump = require "bump"

-- Create a new world
local world = bump.newWorld()

-- Create some objects with bounding boxes
local player = { x = 100, y = 100, width = 32, height = 32 }
local enemy = { x = 150, y = 150, width = 32, height = 32 }

-- Add objects to the world
world:add(player, player.x, player.y, player.width, player.height)
world:add(enemy, enemy.x, enemy.y, enemy.width, enemy.height)

-- Update function (check for collisions)
function love.update(dt)
    player.x = player.x + 100 * dt -- Move the player
    -- Check for collisions with the player
    local actualX, actualY, cols, len = world:move(player, player.x, player.y)
    player.x, player.y = actualX, actualY
end

-- Draw function
function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
end
