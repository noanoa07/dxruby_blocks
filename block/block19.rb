# ブロッック崩し/ ブロックを出す（10個）

require 'dxruby'

img_bar   = Image.new(100,  20, C_WHITE)
img_hwall = Image.new( 20, 480, C_BLUE)
img_vwall = Image.new(640,  20, C_BLUE)
img_ball  = Image.new( 20,  20).circle_fill(10, 10, 10, C_RED)
img_block = Image.new( 58,  18, C_GREEN)

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

block_00 = Sprite.new(21         , 21, img_block)
block_01 = Sprite.new(21 + 60    , 21, img_block)
block_02 = Sprite.new(21 + 60 * 2, 21, img_block)
block_03 = Sprite.new(21 + 60 * 3, 21, img_block)
block_04 = Sprite.new(21 + 60 * 4, 21, img_block)
block_05 = Sprite.new(21 + 60 * 5, 21, img_block)
block_06 = Sprite.new(21 + 60 * 6, 21, img_block)
block_07 = Sprite.new(21 + 60 * 7, 21, img_block)
block_08 = Sprite.new(21 + 60 * 8, 21, img_block)
block_09 = Sprite.new(21 + 60 * 9, 21, img_block)


Window.loop do
  bar.x = Input.mouse_pos_x
  Sprite.draw(walls)

  move(ball, dx, 0)
  if ball === walls
    ball.x -= dx
    dx = -dx
  end

  move(ball, 0, dy)
  if ball === walls
    ball. y -= dy
    dy = -dy
  end

  ball.draw

  block_00.draw
  block_01.draw
  block_02.draw
  block_03.draw
  block_04.draw
  block_05.draw
  block_06.draw
  block_07.draw
  block_08.draw
  block_09.draw
end
