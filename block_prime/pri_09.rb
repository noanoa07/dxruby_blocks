# 基本機能だけ使う：トウフを動かす

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

x = 300
y = 200

Window.loop do
  rect(x, y, 100, 80, C_DEFAULT)  # 前回の位置のトウフの軌跡を消す

  x = x + Input.x
  y = y + Input.y

  rect(x, y, 100, 80, C_WHITE)

  Window.draw(0, 0, $screen)
end
