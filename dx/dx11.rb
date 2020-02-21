# DXRubyの基本/ トウフを表示（イメージで表示）

require 'dxruby'

img_tohu = Image.new(100, 100, C_WHITE)

Window.loop do
  Window.draw(200, 200, img_tohu)
end
