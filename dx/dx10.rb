# DXRubyの基本/ 画像の拡大・縮小

require 'dxruby'

image = Image.load('../image/apple.png')
image.set_color_key(C_WHITE)

Window.loop do
  Window.draw_scale(100, 100, image, 0.2, 0.2)
end
