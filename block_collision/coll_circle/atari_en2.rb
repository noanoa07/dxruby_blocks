# 衝突判定の自作（円）；atari?(jibun, aite) （判定相手が単独）
# 衝突の有/無で true/fasle

require 'dxruby'

def atari?(jibun, aite)
  x0     = jibun.x
  rad_x0 = jibun.image.width / 2
  cen_x0 = x0 + rad_x0

  y0     = jibun.y
  rad_y0 = jibun.image.height / 2
  cen_y0 = y0 + rad_y0

  x1     = aite.x
  rad_x1 = aite.image.width / 2
  cen_x1 = x1 + rad_x1

  y1     = aite.y
  rad_y1 = aite.image.height / 2
  cen_y1 = y1 + rad_y1

  # 半径は長径と短径の1/2に設定
  # 半径同士の和
  cir_dis = (rad_x0 + rad_y0) / 2 + (rad_x1 + rad_y1) / 2

  # 2乗で比較する
  cir_dis_2 = cir_dis **2
  dist_2 = (cen_x0 - cen_x1) ** 2 + (cen_y0 - cen_y1) ** 2
  cir_dis_2 >= dist_2
end

image0 = Image.new(100, 100).circle_fill( 50,  50,  50, C_WHITE)
image1 = Image.new(200, 200).circle_fill(100, 100, 100, C_WHITE)
image2 = Image.new(200, 200).circle_fill(100, 100, 100, C_RED)

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
