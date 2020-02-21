# DXRubyの基本/ マウスに合わせて移動

require 'dxruby'

img_ball = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)

ball = Sprite.new(0, 0, img_ball)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  ball.draw
end
