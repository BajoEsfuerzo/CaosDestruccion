Wall = {}
local walls = {}  -- Table to store walls

function Wall:new(x, y, w, h)
    local wall = {
        x = x,
        y = y,
        w = w,
        h = h
    }

    -- Register the wall with the collision world
    world:add(wall, wall.x, wall.y, wall.w, wall.h)

    setmetatable(wall, self)
    self.__index = self
    return wall
end

function Wall:load()
    table.insert(walls, Wall:new(-10, -10, 840, 10))
    table.insert(walls, Wall:new(-10, -10, 10, 640))
    table.insert(walls, Wall:new(830, -10, 10, 640))
    table.insert(walls, Wall:new(-10, 630, 850, 10))


end

function Wall:update(dt)
    -- You can add wall-specific update logic here if needed
end

function Wall:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)

    for _, wall in ipairs(walls) do
        love.graphics.rectangle("fill", wall.x, wall.y, wall.w, wall.h)
    end
end

