# DXRubyの基本/ 2つの画像を表示する

require 'dxruby'

img_ball  = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)
img_tohu = Image.new(100, 100, C_WHITE)

ball  = Sprite.new(0, 0, img_ball)
tohu  = Sprite.new(100, 100, img_tohu)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  ball.draw
  tohu.draw
end
