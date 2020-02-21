# 基本機能だけを使う：ドットを表示

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  $screen[300, 200] = C_WHITE

  Window.draw(0, 0, $screen)
end
