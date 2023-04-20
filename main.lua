Player = require 'modules/player'
Ball = require 'modules/ball'

function love.load()
    Width = 1280
    Height = 720
    love.window.setMode(Width, Height)
    love.graphics.setBackgroundColor(.75, .43, .75)
    Player1 = Player:newPlayer(0 + 50, Height/2)
    Player2 = Player:newPlayer(Width - 50, Height/2)
    Ball = Ball:newBall()
end

function love.update()
    Player1:update()
    Player2:update()
    Ball:update()
    Player1:control("up", "down")
    Player2:control("w", "s")

    if Ball.x <= 0 
        then Player2:getPoint()
        Ball.x = Width/2
        Ball.y = Height/2
        Ball.xvel = math.random(-3, 3)
        Ball.yvel = math.random (-3, 3)
    end

    if Ball.x >= Width 
        then Player1:getPoint()
        Ball.x = Width/2
        Ball.y = Height/2
        Ball.xvel = math.random(-3, 3)
        Ball.yvel = math.random (-3, 3)
    end
    
end

function love.draw()
    Player1:draw()
    Player2:draw()
    Ball:draw()
    love.graphics.print(Player1.score, 10, 10)
    love.graphics.print(Player2.score, Width - 20, 10)

end