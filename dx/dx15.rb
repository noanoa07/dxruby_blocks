# DXRubyの基本/ カーソルキーで移動

require 'dxruby'

img_ball = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)

ball = Sprite.new(0, 0, img_ball)
ball.x = 200
ball.y = 200

Window.loop do
  ball.x = ball.x + Input.x
  ball.y = ball.y + Input.y

  ball.draw
end
