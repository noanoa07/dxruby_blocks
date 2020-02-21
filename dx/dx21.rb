# DXRubyの基本/ 衝突判定1；===

require 'dxruby'

img_ball  = Image.new(100, 100).circle_fill(50, 50, 50, C_RED)
img_tohu = Image.new(100, 100, C_WHITE)

ball  = Sprite.new(0, 0, img_ball)
tohu  = Sprite.new(100, 100, img_tohu)

imgs = [ball, tohu]

font = Font.new(24)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  if ball === tohu
    Window.draw_font(200, 300, "衝突！", font)
  end

  Sprite.draw(imgs)
end
