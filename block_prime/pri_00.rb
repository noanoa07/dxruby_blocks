# 基本機能だけを使う：ウィンドウを表示

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  Window.draw(0, 0, $screen)
end
