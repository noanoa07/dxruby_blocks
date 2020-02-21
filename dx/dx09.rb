# DXRubyの基本/ 画像の背景色の透明化

require 'dxruby'

image = Image.load('../image/apple.png')
image.set_color_key(C_WHITE)

Window.loop do
  Window.draw(100, 100, image)
end
