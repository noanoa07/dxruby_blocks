# DXRubyの基本/ キー入力をとらえる

require 'dxruby'

font = Font.new(32)

Window.loop do
  Window.draw_font(200, 100, "ESCキーで終了します", font, {:color => C_GREEN})

  if Input.key_down?(K_ESCAPE)
    exit                 # exit でプログラムを終了する
  end
end
