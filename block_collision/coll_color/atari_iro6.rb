# 衝突判定の自作（色）；atari_array(jibun, array) （判定相手が配列）
# 衝突の有/無で ぶつかった最初のオブジェクト/nil


require 'dxruby'

$screen = Image.new(640, 480)

def atari?(x, y)
  if $screen[x,y] == C_DEFAULT
    return false
  end
  true
end

def atari_sprite?(jibun, aite)
  x0  = jibun.x
  xx0 = x0 + jibun.image.width

  y0  = jibun.y
  yy0 = y0 + jibun.image.height

  $screen.clear
  $screen.draw(aite.x, aite.y, aite.image)

  atari?(x0,  y0) || atari?(xx0,  y0) ||
  atari?(x0, yy0) || atari?(xx0, yy0)
end

def atari_array(jibun, array)
  array.each do |aite|
    return aite if atari_sprite?(jibun, aite)
  end
  nil
end

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

  col = atari_array(ball, blocks)
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
