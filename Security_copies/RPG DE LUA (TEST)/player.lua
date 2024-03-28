--checar otro metodo demasiados errores

Player ={}
local dspeed = 5
local timer = require("Libreries/timer")
local npcs = require("npc")

function Player:load()
    -- Other initialization code...
	love.graphics.setDefaultFilter("nearest", "nearest")
    self.x = 100
    self.y = 100
	self.sprite = love.graphics.newImage('Melon/player.png')
    --Player dimention
    self.w = 18 * scale
    self.h = 26 * scale
	self.direction = 0
    --Player stats
    self.speed = dspeed
    self.hp = 100
    self.world = world
    world:add(self, self.x, self.y, self.w, self.h)
end

-- Camera variables
local camera = {
   x = 0,
   y = 0,
   scale = 1,
   speed = 4.5
}


function Player:update(dt)
    timer.update(dt)
    self:move(dt)
end

function Player:move(dt)
    local diagonalSpeed = math.sqrt(self.speed^2 + self.speed^2 ) --diagonal Speed for normalising movement
	local dx, dy = 0, 0 --for player direction
    
	if love.keyboard.isDown("z") then
        self.speed = (dspeed * 2)
        else self.speed= dspeed
    end
	
    if love.keyboard.isDown("up") then
        self.y = self.y - (self.speed  + dt)
		dy = -1
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + (self.speed  + dt)
		dy = 1
    end
    if love.keyboard.isDown("left") then
        self.x = self.x - (self.speed  + dt)
		dx = -1
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + (self.speed  + dt)
		dx = 1
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
        -- Update the player's position based on collision response
    local actualX, actualY, cols, len = self.world:move(self, self.x, self.y)
    self.x, self.y = actualX, actualY

   local targetX = self.x - love.graphics.getWidth() / 2 / camera.scale
   local targetY = self.y - love.graphics.getHeight() / 2 / camera.scale
   
    -- Make sure dx and dy are not both zero before calling atan2
    if dx ~= 0 or dy ~= 0 then
        self.direction = math.atan2(dy, dx)
    end
   
   camera.x = camera.x + (targetX - camera.x) * camera.speed * dt
   camera.y = camera.y + (targetY - camera.y) * camera.speed * dt
end

function Player:atack()
    if love.keyboard.isDown("x") then
        swordAttack(self) -- Pass the player object (self) as an argument
        self.speed = 0
    end
end



function Player:draw()
    -- Set the camera transformation
    love.graphics.push()
    love.graphics.pop()
    love.graphics.translate(-camera.x * camera.scale, -camera.y * camera.scale)
    love.graphics.scale(camera.scale)
    -- Draw the player
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.sprite, self.x, self.y, nil , scale, scale)
	
    love.graphics.print("Posicion X " .. self.x,0,0)
    love.graphics.print("Posicion Y " .. self.y,0,12)
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 0, 24)

end
