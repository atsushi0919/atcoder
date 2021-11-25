# C - Big Array

INPUT1 = <<~"EOS"
  3 4
  1 1
  2 2
  3 3
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  10 500000
  1 100000
  1 100000
  1 100000
  1 100000
  1 100000
  100000 100000
  100000 100000
  100000 100000
  100000 100000
  100000 100000
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, k = input_lines.shift.split.map(&:to_i)
  a_b = input_lines.shift(n).map { |l| l.split.map(&:to_i) }

  a_b.sort_by { |a, b| a }.each do |a, b|
    k -= b
    return a if k <= 0
  end
end

puts solve(STDIN.read)
