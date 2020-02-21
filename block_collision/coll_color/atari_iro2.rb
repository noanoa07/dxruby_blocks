# 衝突判定の自作（色）；atari_sprite?(jibun, aite) （判定相手が単独）
# 衝突の有/無で true/fasle
# 衝突判定用にウィンドウと同サイズの $screen を用意

require 'dxruby'

$screen = Image.new(640, 480)

def atari?(x, y)
  if $screen[x,y] == C_DEFAULT   # 位置(x,y)が透明かどうかで衝突判定
    return false
  end
  true
end

def atari_sprite?(jibun, aite)
  x0  = jibun.x
  xx0 = x0 + jibun.image.width

  y0  = jibun.y
  yy0 = y0 + jibun.image.height

  $screen.clear                            # $screenは毎回 clearする
  $screen.draw(aite.x, aite.y, aite.image) # $screenに描画して衝突判定

  atari?(x0,  y0) || atari?(xx0,  y0) ||
  atari?(x0, yy0) || atari?(xx0, yy0)
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

  result = atari_sprite?(ball, block)
  p result

  if result
    Window.draw_font(0, 0, "hit!", font)
    block.image = image2
  else
    block.image = image1
  end

  block.draw
end
