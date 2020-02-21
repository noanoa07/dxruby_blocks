# 基本機能だけでブロック崩し：壁とバーで跳ね返る

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

def atari_4?(x, y, width, height)      # 衝突判定（四角）
  atari?(x, y)         || atari?(x + width, y) ||
  atari?(x, y + width) || atari?(x + width, y + width)
end

# バーの初期位置
x = 300

# ボールの初期値
ball_x = 300
ball_y = 400
dx =  4
dy = -4

Window.loop do
  rect(x, 460, 100, 20, C_DEFAULT)         # バーの軌跡を消す
  rect(ball_x, ball_y, 20, 20, C_DEFAULT)  # ボールの軌跡を消す

  rect(  0,   0,  20, 480, C_WHITE)   # 左壁
  rect(  0,   0, 640,  20, C_WHITE)   # 上壁
  rect(620,   0,  20, 480, C_WHITE)   # 右壁

  x = Input.mouse_pos_x
  rect(x, 460, 100, 20, C_WHITE)      # バー

  ball_x = ball_x + dx
  if atari_4?(ball_x, ball_y, 20, 20)
    ball_x = ball_x - dx
    dx = -dx
  end

  ball_y = ball_y + dy
  if atari_4?(ball_x, ball_y, 20, 20)
    ball_y = ball_y - dy
    dy = -dy
  end

  rect(ball_x, ball_y, 20, 20, C_RED) # ボール

  Window.draw(0, 0, $screen)
end
