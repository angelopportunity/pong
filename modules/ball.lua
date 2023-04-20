local Ball = {}
Ball.__index = Ball

function Ball:newBall()
    local ball = {}
    setmetatable(ball, Ball)

    ball.x = Width/2
    ball.y = Height/2
    ball.xvel = 1
    ball.yvel = 1
    ball.maxvel = 20
    ball.minvel = -20
    ball.radius = 10

    return ball
end

function Ball:update()
    if self.xvel <= self.maxvel and self.xvel >= self.minvel then
        self.x = self.x + self.xvel
    end

    if self.yvel <= self.maxvel and self.yvel >= self.minvel then
        self.y = self.y + self.yvel
    end

    if self.y <= 0 or self.y >= Height 
        then self.yvel = self.yvel * -1
    end




    --ball is moving toward P2
        if self.xvel >= 0 then
            if self.x >= Player2.x and self.x <= Player2.x + Player2.width and self.y >= Player2.y and self.y <= Player2.y + Player2.height then
                self.xvel = self.xvel * -1
                self.yvel = self.yvel + Player2.vel
                self.xvel = self.xvel + Player2.vel / 2
            end
         end

    --ball is moving toward P1
    if self.xvel <= 0 then
        if self.x <= Player1.x + Player1.width and self.y >= Player1.y and self.y <= Player1.y + Player1.height then
            self.xvel = self.xvel * -1
            self.yvel = self.yvel + Player1.vel
            self.xvel = self.xvel + Player1.vel / 2
        end
    end


end

function Ball:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle('fill', self.x, self.y, self.radius)
end

return Ball
