# 基本機能だけでブロック崩し：「四角を描く」をまとめる

require 'dxruby'

$screen = Image.new(640, 480)

def rect(x, y, width, height, color)   # 四角を描画する
  w = 0
  while w < width
    h = 0
    while h < height
      $screen[x + w, y + h] = color
      h = h + 1
    end
    w = w + 1
  end
end

Window.loop do
  rect(  0,   0,  20, 480, C_WHITE)
  rect(  0,   0, 640,  20, C_WHITE)
  rect(620,   0,  20, 480, C_WHITE)

  Window.draw(0, 0, $screen)
end
