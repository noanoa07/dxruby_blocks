# ブロッック崩し
#--------------------------------------------------------------
# Sprite + Class版
#--------------------------------------------------------------
require 'dxruby'

# 棒
class Bar < Sprite
  def initialize(x = 0, y = 460)
    self.x = x
    self.y = y
    self.image = Image.new(100,  20, C_WHITE)
  end
  def update
    self.x = Input.mouse_pos_x
  end
end


# 壁
class Walls < Array
  def initialize
    self << Wall.new(  0, 0,  20, 480)   # 左側
    self << Wall.new(  0, 0, 640,  20)   # 上側
    self << Wall.new(620, 0,  20, 480)   # 右側
  end
  def draw
    Sprite.draw(self)
  end
end

class Wall < Sprite
  def initialize(x, y, dx, dy)
    self.x = x
    self.y = y
    self.image = Image.new(dx, dy, C_WHITE)
  end
end


# ブロック
class Blocks < Array
  def initialize
    colors = [C_BLUE, C_YELLOW, C_WHITE, C_RED, C_GREEN]
    5.times do |y|
      10.times do |x|
        self << Block.new(21 + 60 * x , 21 + 20 * y, colors[y])
      end
    end
  end
  def draw
    self.each do |b|
      b.draw
    end
  end
end

class Block < Sprite
  def initialize(x, y, c)
    self.x = x
    self.y = y
    self.image = Image.new(58, 18, c)
  end
end


# ボール
class Ball < Sprite
  def initialize(x = 300, y = 400)
    self.x = x
    self.y = y
    self.image = Image.new(20, 20).circle_fill(10, 10, 10, C_WHITE)
    @dx =  4
    @dy = -4
  end

  def update(walls, bar, blocks)

    # 横方向への移動
    self.x += @dx

    # 壁または棒に衝突
    if self === walls or self === bar
      self.x -= @dx
      @dx    *= -1
    end

    # ブロックに衝突
    hit = self.check(blocks).first
    if hit != nil
      hit.vanish
      self.x -= @dx
      @dx    *= -1
    end

    # 縦方向への移動
    self.y += @dy

    # 壁または棒に衝突
    if self === walls or self === bar
      self.y -= @dy
      @dy    *= -1
    end

    # ブロックに衝突
    hit = self.check(blocks).first
    if hit != nil
      hit.vanish
      self.y -= @dy
      @dy    *= -1
    end

  end
end


# ブロック崩しゲーム
class Game
  def initialize
    @walls  = Walls.new    # 壁
    @bar    = Bar.new      # 棒
    @ball   = Ball.new     # ボール
    @blocks = Blocks.new   # ブロック
  end

  def play
    Window.loop do
      @walls.draw
      @bar.update
      @bar.draw
      @ball.update(@walls, @bar, @blocks)
      @ball.draw
      @blocks.draw

      break if Input.key_push?(K_ESCAPE)
    end
  end
end



#
# メイン
#
game = Game.new   # ゲーム初期化
game.play         # ゲーム開始