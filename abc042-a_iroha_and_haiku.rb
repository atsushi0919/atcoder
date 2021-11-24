# A - 和風いろはちゃんイージー
# https://atcoder.jp/contests/abc042/tasks/abc042_a

INPUT1 = <<~"EOS"
  5 5 7
EOS
OUTPUT1 = <<~"EOS"
  YES
EOS

INPUT2 = <<~"EOS"
  7 7 5
EOS
OUTPUT2 = <<~"EOS"
  NO
EOS

def solve(input_lines)
  w_l = input_lines.split.map(&:to_i).tally
  w_l[5] == 2 && w_l[7] == 1 ? "YES\n" : "NO\n"
end

puts solve(STDIN.read)
