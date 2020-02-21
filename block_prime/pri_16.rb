# 基本機能だけでブロック崩し：衝突ブロックを消す（完成）

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

def block(x, y, color)                 # ブロック1つ
  rect(x, y, 58, 18, color)
end

def blocks                             # ブロック群を描画する
  count_x = 0
  while count_x < 10
    count_y = 0
    while count_y < 5
      x = 21 + 60 * count_x
      y = 21 + 20 * count_y
      block(x, y, $screen[x, y])       # 色は前回の色と同じにする
      count_y = count_y + 1
    end
  count_x = count_x + 1
  end
end

def vanish_block(x, y)                 # ブロックを消去する
  if (20 < x && x < 600) && (20 < y && y < 120)
    rect_x = x - (x - 21) % 60         # 衝突位置から衝突ブロックの
    rect_y = y - (y - 21) % 20         # (x, y)を計算する
    block(rect_x, rect_y, C_DEFAULT)
  end
end

def initialize_blocks                  # ブロック群の初期色を白にする
  count_x = 0
  while count_x < 10
    count_y = 0
    while count_y < 5
      x = 21 + 60 * count_x
      y = 21 + 20 * count_y
      $screen[x, y] = C_WHITE
      count_y = count_y + 1
    end
  count_x = count_x + 1
  end
end

# バーの初期位置
x = 300

# ボールの初期値
ball_x = 300
ball_y = 400
dx =  4
dy = -4

# ブロック群の初期色の設定
initialize_blocks

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
    vanish_block(ball_x, ball_y)      # 衝突ブロックを消す
    ball_x = ball_x - dx
    dx = -dx
  end

  ball_y = ball_y + dy
  if atari_4?(ball_x, ball_y, 20, 20)
    vanish_block(ball_x, ball_y)      # 衝突ブロックを消す
    ball_y = ball_y - dy
    dy = -dy
  end

  rect(ball_x, ball_y, 20, 20, C_RED) # ボール

  blocks                              # ブロック群

  Window.draw(0, 0, $screen)
end
