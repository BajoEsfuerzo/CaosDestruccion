Npc ={}
local npcs = {}
function Npc:new(x, y)
        npc = {
        x = x,
        y = y,
        sprite = love.graphics.newImage('Melon/melon.png'),
        w = 45 * scale,
        h = 41 * scale,
        speed = 3,
        hp = 100,
    }
    -- Register the NPC with the collision world
    world:add(npc, npc.x, npc.y, npc.w, npc.h)

    setmetatable(npc, self)
    self.__index = self
    return npc
end

function Npc.load()
    for i = 1, 10 do
        local npc = Npc:new(love.math.random(0, 800), love.math.random(0, 600))
        table.insert(npcs, npc)
    end
end



function Npc:update(dt)

    for _, npc in ipairs(npcs) do
    -- Calculate a random direction vector
    local directionX = love.math.random(-1, 1)
    local directionY = love.math.random(-1, 1)

    -- Normalize the direction vector to maintain speed consistency
    local length = math.sqrt(directionX^2 + directionY^2)

    if length ~= 0 then
        directionX = directionX / length
        directionY = directionY / length
    end


    local newX = npc.x + (directionX * (npc.speed  + dt ))

    local newY = npc.y + (directionY * (npc.speed  + dt ))

    local actualX, actualY, cols, len = world:move(npc, newX ,newY )

    -- Update the position based on collision response
    npc.x, npc.y = actualX, actualY
    end
end

function Npc:draw()
    love.graphics.setColor(1, 1, 1)

    for _, npc in ipairs(npcs) do
    love.graphics.draw(npc.sprite, npc.x, npc.y, nil , scale)
    end
end

-- npc.lua

return npcs

