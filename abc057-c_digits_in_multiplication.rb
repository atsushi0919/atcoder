# C - Digits in Multiplication
# https://atcoder.jp/contests/abc057/tasks/abc057_c

INPUT1 = <<~"EOS"
  10000
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  1000003
EOS
OUTPUT2 = <<~"EOS"
  7
EOS

INPUT3 = <<~"EOS"
  9876543210
EOS
OUTPUT3 = <<~"EOS"
  6
EOS

def solve(input_lines)
  n = input_lines.to_i

  res = 1.0 / 0
  1.upto((n ** 0.5).ceil) do |a|
    if n % a == 0
      a_l = a.to_s.length
      b_l = (n / a).to_s.length
      res = [res, [a_l, b_l].max].min
    end
  end
  res.to_s << "\n"
end

puts solve(STDIN.read)
