# C - Write and Erase

INPUT1 = <<~"EOS"
  3
  6
  2
  6
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

# 以下の操作を行うこととなります。
# 紙に 6 は書かれていないので、6 を書く。
# 紙に 2 は書かれていないので、2 を書く。
# 紙に 6 は書かれているので、6 を消す。
# よって、最後に書いてあるのは 2 だけなので、答えは 1 です。

INPUT2 = <<~"EOS"
  4
  2
  5
  5
  2
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

# 最後に紙に数字が一つも書かれていない場合もあります。

INPUT3 = <<~"EOS"
  6
  12
  22
  16
  22
  18
  12
EOS
OUTPUT3 = <<~"EOS"
  2
EOS

def solve(input_lines)
  _, *a = input_lines.split.map(&:to_i)
  a.tally.count { |k, v| v.odd? }
end

puts solve(STDIN.read)

# puts STDIN.read.split.map(&:to_i)[1..].tally.count { |k, v| v.odd? }
