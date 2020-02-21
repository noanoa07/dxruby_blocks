# 自作の衝突判定（円）を使ったブロック崩し（円にしたブロックとの判定のみ）
# ブロッック崩し block28.rb の書き換え（ブロックは円に変更）

require 'dxruby'

class Sprite
  def atari?(aite)
    x0     = self.x
    rad_x0 = self.image.width / 2
    cen_x0 = x0 + rad_x0

    y0     = self.y
    rad_y0 = self.image.height / 2
    cen_y0 = y0 + rad_y0

    x1     = aite.x
    rad_x1 = aite.image.width / 2
    cen_x1 = x1 + rad_x1

    y1     = aite.y
    rad_y1 = aite.image.height / 2
    cen_y1 = y1 + rad_y1

    # 半径は長径と短径の1/2に設定
    # 半径同士の和
    cir_dis = (rad_x0 + rad_y0) / 2 + (rad_x1 + rad_y1) / 2

    # 2乗で比較する
    cir_dis_2 = cir_dis **2
    dist_2 = (cen_x0 - cen_x1) ** 2 + (cen_y0 - cen_y1) ** 2
    cir_dis_2 >= dist_2
  end

  def atari_array(array)
    array.each do |a|
      if self.atari?(a)
        return a
      end
    end
    nil
  end
end

img_bar   = Image.new(100,  20, C_WHITE)
img_hwall = Image.new( 20, 480, C_BLUE)
img_vwall = Image.new(640,  20, C_BLUE)
img_ball  = Image.new( 20,  20).circle_fill(10, 10, 10, C_RED)
img_block = Image.new(28, 28).circle_fill(14, 14, 14, C_GREEN)   # ブロックを円に
img_block_y = Image.new(28, 28).circle_fill(14, 14, 14, C_YELLOW)   # ブロックを円に

bar   = Sprite.new(  0, 460, img_bar)
lwall = Sprite.new(  0,   0, img_hwall)
rwall = Sprite.new(620,   0, img_hwall)
twall = Sprite.new(  0,   0, img_vwall)

walls = [bar, lwall, rwall, twall]

ball  =  Sprite.new(300, 400, img_ball)
dx =  2
dy = -2

def move(sprite, speed_x, speed_y)
  sprite.x += speed_x
  sprite.y += speed_y
end

blocks = []
20.times do |x|       # ブロックの組み方を少し変更
  5.times do |y|
    blocks << Sprite.new(21 + 30 * x, 21 + 30 * y, img_block)
  end
end


Window.loop do
  bar.x = Input.mouse_pos_x
  Sprite.draw(walls)

  move(ball, dx, 0)
  if ball === walls
    ball.x -= dx
    dx = -dx
  end
  coll_x = ball.atari_array(blocks)
  if coll_x
    coll_x.image = img_block_y
    coll_x.draw     #一瞬色が変わって表示
    coll_x.vanish   #消える
    ball.x -= dx
    dx = -dx
  end

  move(ball, 0, dy)
  if ball=== walls
    ball. y -= dy
    dy = -dy
  end
  coll_y = ball.atari_array(blocks)
  if coll_y
    coll_y.image = img_block_y
    coll_y.draw     #一瞬色が変わって表示
    coll_y.vanish   #消える
    ball. y -= dy
    dy = -dy
  end

  ball.draw

  Sprite.draw(blocks)
end
