# 衝突判定の自作（四角）；atari?(jibun, aite) （判定相手が単独）
# 衝突の有/無で true/fasle

require 'dxruby'

def atari?(jibun, aite)
  x0  = jibun.x
  xx0 = x0 + jibun.image.width

  y0  = jibun.y
  yy0 = y0 + jibun.image.height

  x   = aite.x
  xx  = x  + aite.image.width

  y   = aite.y
  yy  = y  + aite.image.height

  (x <= x0  && x0  <= xx ||
   x <= xx0 && xx0 <= xx) &&

  (y <= y0  && y0  <= yy ||
   y <= yy0 && yy0 <= yy)
end

image0 = Image.new( 50,  50, C_WHITE)
image1 = Image.new(200, 100, C_WHITE)
image2 = Image.new(200, 100, C_RED)

ball  = Sprite.new(300, 400, image0)
block = Sprite.new(200, 200, image1)

font = Font.new(32)

Window.loop do
  ball.x = Input.mouse_pos_x
  ball.y = Input.mouse_pos_y

  ball.draw

  result = atari?(ball, block)
  p result

  if result
    Window.draw_font(0, 0, "hit!", font)
    block.image = image2
  else
    block.image = image1
  end

  block.draw
end
