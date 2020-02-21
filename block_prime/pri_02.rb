# 基本機能だけを使う：線を表示

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  width = 0
  while width < 100
    $screen[300 + width, 200] = C_WHITE
    width = width + 1
  end

  Window.draw(0, 0, $screen)
end
