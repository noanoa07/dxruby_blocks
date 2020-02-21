# 基本機能だけを使う：衝突判定の試作（色で判定）大きさ1ドット

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

def atari?(x, y)                       # 衝突判定（1ドット）
  if $screen[x,y] == C_DEFAULT
    return false
  end
  true
end

Window.loop do
  rect(  0,   0,  20, 480, C_WHITE)   # 左壁
  rect(  0,   0, 640,  20, C_WHITE)   # 上壁
  rect(620,   0,  20, 480, C_WHITE)   # 右壁

  x = Input.mouse_pos_x
  y = Input.mouse_pos_y

  p result =  atari?(x, y)            # マウスの位置と壁の衝突判定

  Window.draw(0, 0, $screen)
end
