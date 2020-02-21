# DXRubyの基本/ トウフの中に赤丸を描く

require 'dxruby'

img_tohu = Image.new(100, 100, C_WHITE).circle_fill(50, 50, 50, C_RED)

tohu = Sprite.new(200, 200, img_tohu)

Window.loop do
  tohu.draw
end
