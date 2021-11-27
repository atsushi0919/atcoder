# C - Shopping Street

INPUT1 = <<~"EOS"
  1
  1 1 0 1 0 0 0 1 0 1
  3 4 5 6 7 8 9 -2 -3 4 -2
EOS
OUTPUT1 = <<~"EOS"
  8
EOS

INPUT2 = <<~"EOS"
  2
  1 1 1 1 1 0 0 0 0 0
  0 0 0 0 0 1 1 1 1 1
  0 -2 -2 -2 -2 -2 -1 -1 -1 -1 -1
  0 -2 -2 -2 -2 -2 -1 -1 -1 -1 -1
EOS
OUTPUT2 = <<~"EOS"
  -2
EOS

INPUT3 = <<~"EOS"
  3
  1 1 1 1 1 1 0 0 1 1
  0 1 0 1 1 1 1 0 1 0
  1 0 1 1 0 1 0 1 0 1
  -8 6 -2 -8 -8 4 8 7 -6 2 2
  -9 2 0 1 7 -5 0 -2 -6 5 5
  6 -6 7 -9 6 -5 8 0 -9 -7 -7
EOS
OUTPUT3 = <<~"EOS"
  23
EOS

def solve(input_lines)
  d = 10
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  f = input_lines.shift(n).map { |l| l.delete(" ").to_i(2) }
  r = input_lines.shift(n).map { |l| l.split.map(&:to_i) }

  profit = -Float::INFINITY
  1.upto(2 ** d - 1) do |s|
    tmp = 0
    f.each_with_index do |a, i|
      tmp += r[i][(a & s).to_s(2).count("1")]
    end
    profit = [profit, tmp].max
  end
  profit
end

puts solve(STDIN.read)
