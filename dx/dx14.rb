# DXRubyの基本/ 赤丸だけにする

require 'dxruby'

img_ball = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)

ball = Sprite.new(200, 200, img_ball)

Window.loop do
  ball.draw
end
