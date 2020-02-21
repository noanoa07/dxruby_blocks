# 基本機能だけでブロック崩し：もう一つ壁を描く

require 'dxruby'

$screen = Image.new(640, 480)

Window.loop do
  x0 = 0
  y0 = 0
  width0 = 0
  while width0 < 20
    height0 = 0
    while height0 < 480
      $screen[x0 + width0, y0 + height0] = C_WHITE
      height0 = height0 + 1
    end
    width0 = width0 + 1
  end

  x1 = 0
  y1 = 0
  width1 = 0
  while width1 < 640
    height1 = 0
    while height1 < 20
      $screen[x1 + width1, y1 + height1] = C_WHITE
      height1 = height1 + 1
    end
    width1 = width1 + 1
  end

  Window.draw(0, 0, $screen)
end
