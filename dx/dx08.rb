# DXRubyの基本/ 画像の読み込み

require 'dxruby'

image = Image.load('../image/apple.png')

Window.loop do
  Window.draw(100, 100, image)
end
