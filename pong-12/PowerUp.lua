PowerUp = Class{}

function PowerUp:init(screen_width, screen_height)
  self.x = screen_width / 2 - 5 -- Aparece en el centro
  self.y = screen_height / 2 - 5
  self.width = 10
  self.height = 10
  self.type = "size" -- Tipo de power-up (e.g., "size", "speed")
  self.show = false -- Estado del power-up
end

-- Dibuja el power-up en pantalla
function PowerUp:render()
  --love.graphics.setColor(0, 1, 0, 1)
  --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  if self.show then
      if self.type == "size" then
          love.graphics.setColor(0, 1, 0, 1) -- Verde para el power-up de tamaño
      elseif self.type == "speed" then
          love.graphics.setColor(0, 0, 1, 1) -- Azul para el power-up de velocidad
      end
      love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
      love.graphics.setColor(1, 1, 1, 1) -- Resetear color
  end
end

-- Detecta si un paddle colisiona con el power-up
function PowerUp:collides(paddle)
  return not (self.x > paddle.x + paddle.width or
              self.x + self.width < paddle.x or
              self.y > paddle.y + paddle.height or
              self.y + self.height < paddle.y)
end

-- Activa el power-up
function PowerUp:activate()
  self.show = true
end

-- Desactiva el power-up
function PowerUp:deactivate()
  self.show = false
end