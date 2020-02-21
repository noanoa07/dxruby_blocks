# DXRubyの基本/ トウフを表示（スプライトで表示）

require 'dxruby'

img_tohu = Image.new(100, 100, C_WHITE)

tohu = Sprite.new(200, 200, img_tohu)

Window.loop do
  tohu.draw
end
