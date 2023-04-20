local Player = {}
Player.__index = Player

--local global variables--

--Player functions--

function Player:newPlayer(x, y)
    local player = {}
    setmetatable(player, Player)

    player.x = x
    player.y = y
    player.vel = 0
    player.maxvel = 10
    player.minvel = -10
    player.score = 0
    player.width = 15
    player.height = 100

    return player
end

function Player:control(up, down)
    if love.keyboard.isDown(up) then
            self.vel = self.vel - 2
    elseif love.keyboard.isDown(down) then
            self.vel = self.vel + 2
    else 
        self.vel = 0
    end

    if self.vel >= 10 then
        self.vel = self.maxvel
    end

    if self.vel <= -10 then
        self.vel = self.minvel
    end
end

function Player:update()

    if self.vel <= self.maxvel and self.vel >= self.minvel then
    self.y = self.y + self.vel
    end

    if self.y <= 0 then 
        self.y = 0
    end

    if self.y >= Height - self.height then
        self.y = Height - self.height
    end

end

function Player:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Player:getPoint()
    self.score = self.score + 1
end


return Player


