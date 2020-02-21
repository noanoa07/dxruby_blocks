# DXRubyの基本/ 画面に文字を出す

require 'dxruby'

font = Font.new(32)

Window.loop do
  Window.draw_font(200, 100, "ブロック崩し", font, {:color => C_GREEN})
end
