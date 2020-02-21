# 衝突判定の準備；check.first（判定相手が配列）
# 衝突の有/無で ぶつかった最初のオブジェクト/nil

require 'dxruby'

image0 = Image.new(100, 100).circle_fill( 50,  50,  50, C_WHITE)
image1 = Image.new(200, 200).circle_fill(100, 100, 100, C_WHITE)
image2 = Image.new(200, 200).circle_fill(100, 100, 100, C_RED)

ball   = Sprite.new(300, 400, image0)

block1 = Sprite.new(110, 130, image1)
block2 = Sprite.new(390, 130, image1)

ball.collision  = [ 50,  50,  50]
block1.collision = [100, 100, 100]
block2.collision = [100, 100, 100]

blocks = [block1, block2]

font = Font.new(32)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  ball.draw

  col = ball.check(blocks).first
  p col

  if col
    Window.draw_font(0, 0, "hit!", font)
    col.image = image2
    Sprite.draw(blocks)
    col.image = image1
  else
    Sprite.draw(blocks)
  end
end
