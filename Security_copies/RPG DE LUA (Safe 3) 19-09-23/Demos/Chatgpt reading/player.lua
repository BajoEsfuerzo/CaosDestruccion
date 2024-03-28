local Player = {}

function Player:new(x, y)
    local player = {
        x = x,
        y = y,
        w = 30,
        h = 30,
        speed = 5,
        hp = 100
    }
    setmetatable(player, self)
    self.__index = self
    return player
end


function Player:update(dt)
    local diagonalSpeed = self.speed * math.sqrt(2)  -- Calculate diagonal speed

    -- Player movement
    if love.keyboard.isDown("up") and love.keyboard.isDown("left") then
        self.speed = diagonalSpeed
    elseif love.keyboard.isDown("up") and love.keyboard.isDown("right") then
        self.speed = diagonalSpeed
    elseif love.keyboard.isDown("down") and love.keyboard.isDown("left") then
        self.speed = diagonalSpeed
    elseif love.keyboard.isDown("down") and love.keyboard.isDown("right") then
        self.speed = diagonalSpeed
    else
        self.speed = 5  -- Reset speed to normal
    end

    if love.keyboard.isDown("up") then
        self.y = self.y - (self.speed * dt)
    end    
    if love.keyboard.isDown("down") then
        self.y = self.y + (self.speed * dt)
    end    
    if love.keyboard.isDown("left") then
        self.x = self.x - (self.speed * dt)
    end    
    if love.keyboard.isDown("right") then
        self.x = self.x + (self.speed * dt)
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)

    love.graphics.print("Vida del jugador: " .. self.hp, 10, 10)
    love.graphics.print("Posicion X: " .. self.x, 700, 560)
    love.graphics.print("Posicion Y: " .. self.y, 700, 572)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 700, 584)
end

return Player
