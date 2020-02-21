# 基本機能だけを使う：トウフを表示

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  width = 0
  while width < 100
    height = 0
    while height < 80
      $screen[300 + width, 200 + height] = C_WHITE
      height = height + 1
    end
    width = width + 1
  end

  Window.draw(0, 0, $screen)
end
