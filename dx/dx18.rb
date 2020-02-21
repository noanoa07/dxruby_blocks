# DXRubyの基本/ 画像を切り替える

require 'dxruby'

img_ball = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)
img_tohu = Image.new(100, 100, C_WHITE)

ball  = Sprite.new(0, 0, img_ball)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  if ball.x > 300
    ball.image = img_ball
  else
    ball.image = img_tohu
  end

  ball.draw
end
