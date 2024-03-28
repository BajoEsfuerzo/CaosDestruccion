Wall ={}
local walls = {}

function Wall:new(x, y)
        wall = {
        x = x,
        y = y,
        w = 10,
        h = 10
        }
    -- Register the NPC with the collision world
    world:add(wall, wall.x, wall.y, wall.w, wall.h)

    setmetatable(wall, self)
    self.__index = self
    return wall
end

function Wall.load()
    table.insert(walls, Wall:new(200,200))
    table.insert(walls, Wall:new(100,100))



    end


function Wall:update(dt)

end


function Wall:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)

    for _, wall in ipairs(walls) do
    love.graphics.rectangle("fill", wall.x, wall.y, wall.w , wall.h )
    end
end

