# ブロッック崩し/ 壁を出す（上側も）

require 'dxruby'

img_bar   = Image.new(100,  20, C_WHITE)
img_hwall = Image.new( 20, 480, C_BLUE)
img_vwall = Image.new(640,  20, C_BLUE)

bar   = Sprite.new(  0, 460, img_bar)
lwall = Sprite.new(  0,   0, img_hwall)
rwall = Sprite.new(620,   0, img_hwall)
twall = Sprite.new(  0,   0, img_vwall)


Window.loop do
  bar.x = Input.mouse_pos_x
  bar.draw

  lwall.draw
  rwall.draw
  twall.draw
end
