# C - Multiple Clocks

INPUT1 = <<~"EOS"
  2
  2
  3
EOS
OUTPUT1 = <<~"EOS"
  6
EOS

# 2 つの時計があり、各時計の針が真っ直ぐ上に向くのは以下の時刻です。
# 1 番目の時計の針: 時計の針を動かし始めてから、2 秒後、4 秒後、6 秒後、...
# 2 番目の時計の針: 時計の針を動かし始めてから、3 秒後、6 秒後、9 秒後、...
# したがって、2 つの時計の針が真っ直ぐ上に向くのにかかる秒数は 6 秒となります。

INPUT2 = <<~"EOS"
  5
  2
  5
  10
  1000000000000000000
  1000000000000000000
EOS
OUTPUT2 = <<~"EOS"
  1000000000000000000
EOS

def solve(input_lines)
  _, *t = input_lines.split.map(&:to_i)
  t.inject(:lcm)
end

puts solve(STDIN.read)
