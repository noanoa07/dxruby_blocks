# 基本機能だけでブロック崩し：壁を描く

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  x0 = 0
  y0 = 0
  width = 0
  while width < 20
    height = 0
    while height < 480
      $screen[x0 + width, y0 + height] = C_WHITE
      height = height + 1
    end
    width = width + 1
  end

  Window.draw(0, 0, $screen)
end
