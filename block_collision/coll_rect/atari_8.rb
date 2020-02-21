# 自作の衝突判定（四角）を使ったブロック崩し
# ブロッック崩し block28.rb の書き換え

require 'dxruby'

class Sprite
  def atari?(aite)
    x0  = self.x
    xx0 = x0 + self.image.width

    y0  = self.y
    yy0 = y0 + self.image.height

    x   = aite.x
    xx  = x  + aite.image.width

    y   = aite.y
    yy  = y  + aite.image.height

    (x <= x0  && x0  <= xx ||
     x <= xx0 && xx0 <= xx) &&

    (y <= y0  && y0  <= yy ||
     y <= yy0 && yy0 <= yy)
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
img_block = Image.new( 58,  18, C_GREEN)
img_block_y = Image.new( 58,  18, C_YELLOW)

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
10.times do |x|
  5.times do |y|
    blocks << Sprite.new(21 + 60 * x, 21 + 20 * y, img_block)
  end
end


Window.loop do
  bar.x = Input.mouse_pos_x
  Sprite.draw(walls)

  move(ball, dx, 0)
  if ball.atari_array(walls)
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
  if ball.atari_array(walls)
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
