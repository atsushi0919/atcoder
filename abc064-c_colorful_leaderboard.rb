INPUT1 = <<~"EOS"
  4
  2100 2500 2700 2700
EOS
OUTPUT1 = <<~"EOS"
  2 2
EOS
#レート 2100 の人は「黄色」であり、それ以外の人は「橙色」なので、色の種類数は 2 となる。

INPUT2 = <<~"EOS"
  5
  1100 1900 2800 3200 3200
EOS
OUTPUT2 = <<~"EOS"
  3 5
EOS
# レート 1100 の人は「緑色」、レート 1900 の人は「青色」、レート 2800 の人は「赤色」である。
# 4 人目が「赤色」を選び、5 人目が「青色」を選んだ時、色の種類数は 3 であり、これは最小値を取る一つの例である。
# 4 人目が「紫色」を選び、5 人目が「黒色」を選んだ時、色の種類数は 5 であり、これは最大値を取る一つの例である。

INPUT3 = <<~"EOS"
  20
  800 810 820 830 840 850 860 870 880 890 900 910 920 930 940 950 960 970 980 990
EOS
OUTPUT3 = <<~"EOS"
  1 1
EOS

def solve(input_lines)
  color = 8
  n, *a = input_lines.split.map(&:to_i)

  r = Array.new(color + 1, 0)
  a.each do |sc|
    if sc < 400
      r[0] += 1
    elsif sc < 800
      r[1] += 1
    elsif sc < 1200
      r[2] += 1
    elsif sc < 1600
      r[3] += 1
    elsif sc < 2000
      r[4] += 1
    elsif sc < 2400
      r[5] += 1
    elsif sc < 2800
      r[6] += 1
    elsif sc < 3200
      r[7] += 1
    else
      r[8] += 1
    end
  end

  base_count = r[..7].count { |i| i > 0 }
  if base_count == 0 && r[8] > 0
    min_count = 1
  else
    min_count = base_count
  end
  max_count = base_count + r[8]
  "#{min_count} #{max_count}\n"
end

puts solve(STDIN.read)
