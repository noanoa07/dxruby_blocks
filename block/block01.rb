# ブロッック崩し/ バーを出す

require 'dxruby'

img_bar = Image.new(100, 20, C_WHITE)

bar = Sprite.new(0, 460, img_bar)


Window.loop do
  bar.x = Input.mouse_pos_x

  bar.draw
end
