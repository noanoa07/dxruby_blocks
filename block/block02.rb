# ブロッック崩し/ 壁を出す（左側）

require 'dxruby'

img_bar   = Image.new(100,  20, C_WHITE)
img_hwall = Image.new( 20, 480, C_BLUE)

bar   = Sprite.new(0, 460, img_bar)
lwall = Sprite.new(0,   0, img_hwall)


Window.loop do
  bar.x = Input.mouse_pos_x
  bar.draw

  lwall.draw
end
