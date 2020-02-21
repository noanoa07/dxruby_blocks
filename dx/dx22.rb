# DXRubyの基本/ 衝突判定2；check

require 'dxruby'

img_ball  = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)
img_tohu   = Image.new(100, 100, C_WHITE)
img_tohu_r = Image.new(100, 100, C_RED)


ball   = Sprite.new(  0,   0, img_ball)
tohu1  = Sprite.new(150, 150, img_tohu)
tohu2  = Sprite.new(300, 150, img_tohu)
tohu3  = Sprite.new(300, 300, img_tohu)

blocks = [tohu1, tohu2, tohu3]

font = Font.new(24)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  coll = ball.check(blocks)
  if coll[0]
    coll[0].image = img_tohu_r
  end

  Window.draw_font(200, 10, "#{blocks.size}個中、#{coll.size}個 衝突！", font)

  Sprite.draw(blocks)
  ball.draw
end
