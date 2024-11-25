AIController = Class{}

function AIController:init(paddle, ball, difficulty)
  self.paddle = paddle
  self.ball = ball
  self.difficulty = difficulty
end

function AIController:update(dt)
  local targetY = self.ball.y + self.ball.height / 2
  local targetX = self.ball.x + self.ball.width / 2
  local centerY = self.paddle.y + self.paddle.height / 2
  local centerX = self.paddle.x + self.paddle.width / 2

  if self.difficulty == 'easy' then
      -- Movimiento más lento y menos preciso
      if centerY < targetY then
          self.paddle.dy = PADDLE_SPEED * 0.35
          self.paddle.dx = PADDLE_SPEED * 0.15
      else
          self.paddle.dy = -PADDLE_SPEED * 0.35
          self.paddle.dx = -PADDLE_SPEED *0.15
      end
  elseif self.difficulty == 'medium' then
      -- Movimiento moderado y más preciso
      if centerY < targetY then
          self.paddle.dy = PADDLE_SPEED * 0.75
      else
          self.paddle.dy = -PADDLE_SPEED * 0.75
      end
  elseif self.difficulty == 'hard' then
      -- Movimiento rápido y muy preciso
      if centerY < targetY then
          self.paddle.dy = PADDLE_SPEED
      else
          self.paddle.dy = -PADDLE_SPEED
      end
  end

  -- Limitar la pala dentro de los límites de la pantalla
  self.paddle.y = math.max(0, math.min(VIRTUAL_HEIGHT - self.paddle.height, self.paddle.y + self.paddle.dy * dt))
end