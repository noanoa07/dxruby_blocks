# DXRubyの基本/ Windowを切り替える

require 'dxruby'

font = Font.new(32)

Window.loop do
  Window.draw_font(200, 100, "Nキーで次の画面へ", font, {:color => C_WHITE})

  if Input.key_down?(K_N)
    break                # breakで loopを抜ける
  end
end


Window.loop do
  Window.draw_font(200, 100, "ブロック崩し", font, {:color => C_GREEN})

  Window.draw_font(200, 150, "（ESCキーで終了）", font, {:color => C_RED})

  if Input.key_down?(K_ESCAPE)
    exit                 # exit でプログラムを終了する
  end
end
