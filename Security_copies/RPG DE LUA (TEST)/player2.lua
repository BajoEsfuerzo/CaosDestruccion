Player2 = {}
local dspeed = 5

function Player2:load(world)
    self.x = 300
    self.y = 300

    -- Player dimension
    self.w = 30
    self.h = 30
    -- Player stats
    self.speed = dspeed
    self.hp = 100

    -- Assign the collision world for Player 2
    self.world = world
    world:add(self, self.x, self.y, self.w, self.h)
end

function Player2:update(dt)
    self:move(dt)
end

function Player2:move(dt)
    local diagonalSpeed = math.sqrt(self.speed^2 + self.speed^2)

    if love.keyboard.isDown("i") then
        self.speed = (dspeed * 2)
    else
        self.speed = dspeed
    end
    if love.keyboard.isDown("w") then
        self.y = self.y - (self.speed + dt)
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + (self.speed + dt)
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - (self.speed + dt)
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + (self.speed + dt)
    end
    if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
        self.speed = diagonalSpeed
    else
        self.speed = dspeed
    end
    if love.keyboard.isDown("w") and love.keyboard.isDown("d") then
        self.speed = diagonalSpeed
    else
        self.speed = dspeed
    end
    if love.keyboard.isDown("s") and love.keyboard.isDown("a") then
        self.speed = diagonalSpeed
    else
        self.speed = dspeed
    end
    if love.keyboard.isDown("s") and love.keyboard.isDown("d") then
        self.speed = diagonalSpeed
    else
        self.speed = dspeed
    end
    if love.keyboard.isDown("w") and love.keyboard.isDown("s")  or   love.keyboard.isDown("a")
    and love.keyboard.isDown("d")then
        self.speed = (0)
    else
        self.speed = dspeed
    end

    -- Update the player's position based on collision response
    local actualX, actualY, cols, len = self.world:move(self, self.x, self.y)
    self.x, self.y = actualX, actualY
end

function Player2:attack()
    -- Attack logic
end

function Player2:draw()
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.w , self.h )

    love.graphics.setColor(1, 1, 0)
    love.graphics.print("Player 2 " ,self.x -5, self.y - 15)
 
end
