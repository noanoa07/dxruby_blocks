# 衝突判定の準備；=== （判定相手が配列）
# 衝突の有/無で true/fasle

require 'dxruby'

image0 = Image.new( 50,  50, C_WHITE)
image1 = Image.new(200, 100, C_WHITE)
image2 = Image.new(200, 100, C_RED)

ball   = Sprite.new(300, 400, image0)

block1 = Sprite.new( 10, 200, image1)
block2 = Sprite.new(250, 200, image1)

blocks = [block1, block2]

font = Font.new(32)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  ball.draw

  result = (ball === blocks)
  p result

  if result
    Window.draw_font(0, 0, "hit!", font)
  end

  Sprite.draw(blocks)
end
