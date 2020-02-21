# ブロッック崩し/ ボールが跳ね返る（横方向）

require 'dxruby'

img_bar   = Image.new(100,  20, C_WHITE)
img_hwall = Image.new( 20, 480, C_BLUE)
img_vwall = Image.new(640,  20, C_BLUE)
img_ball  = Image.new( 20,  20).circle_fill(10, 10, 10, C_RED)

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


Window.loop do
  bar.x = Input.mouse_pos_x
  Sprite.draw(walls)

  move(ball, dx, 0)      #横方向だけ動かす
  if ball === walls
    ball.x -= dx
    dx = -dx
  end

  ball.draw
end
