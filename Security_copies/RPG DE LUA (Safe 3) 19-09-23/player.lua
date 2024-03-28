Player ={}
local dspeed = 5

function Player:load()
    self.x = 100
    self.y = 100

    --Player dimention
    self.w = 30
    self.h = 30
    --Player stats
    self.speed = dspeed
    self.hp = 100
    -- Register the player with the collision world
    world:add(self, self.x, self.y, self.w, self.h)
end

function Player:update(dt)
    self:move(dt)
end

function Player:move(dt)

    local diagonalSpeed = math.sqrt(self.speed^2 + self.speed^2 )

    local newX, newY = self.x, self.y

    if love.keyboard.isDown("z") then
        self.speed = (dspeed * 2)

        else self.speed= dspeed
    end
    if love.keyboard.isDown("up") then
        newY = self.y - (self.speed  + dt)
    end
    if love.keyboard.isDown("down") then
        newY = self.y + (self.speed  + dt)
    end
    if love.keyboard.isDown("left") then
        newX = self.x - (self.speed  + dt)
    end
    if love.keyboard.isDown("right") then
        newX = self.x + (self.speed  + dt)
    end
    if love.keyboard.isDown("up") and love.keyboard.isDown("left") then
        self.speed = diagonalSpeed
    else self.speed = dspeed
    end
    if love.keyboard.isDown("up") and love.keyboard.isDown("right") then
        self.speed = diagonalSpeed
    else self.speed = dspeed
    end
    if love.keyboard.isDown("down") and love.keyboard.isDown("left") then
        self.speed = diagonalSpeed
    else self.speed = dspeed
    end
    if love.keyboard.isDown("down") and love.keyboard.isDown("right") then
        self.speed = diagonalSpeed
    else self.speed = dspeed
    end
    if love.keyboard.isDown("up") and love.keyboard.isDown("down")  or   love.keyboard.isDown("left")
    and love.keyboard.isDown("right")then
        self.speed = (0)
    else self.speed = dspeed
    end
        -- Check for collisions with the collision world
    local actualX, actualY, cols, len = world:move(self, newX, newY)

    -- Update the player's position based on collision response
    self.x, self.y = actualX, actualY

end

function Player:atack()
 --atack logic
end


function Player:draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w , self.h )

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Posicion X " .. self.x,0,0)
    love.graphics.print("Posicion Y " .. self.y,0,12)
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 0, 24)
end
