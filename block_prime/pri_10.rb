# 基本機能だけでブロック崩し：壁とバーを出す

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

# バーの初期位置
x = 300

Window.loop do
  rect(x, 460, 100, 20, C_DEFAULT)    # バーの軌跡を消す

  rect(  0,   0,  20, 480, C_WHITE)   # 左壁
  rect(  0,   0, 640,  20, C_WHITE)   # 上壁
  rect(620,   0,  20, 480, C_WHITE)   # 右壁

  x = Input.mouse_pos_x
  rect(x, 460, 100, 20, C_WHITE)      # バー

  Window.draw(0, 0, $screen)
end
