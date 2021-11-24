# C - One-stroke Path
# https://atcoder.jp/contests/abc054/tasks/abc054_c

INPUT1 = <<~"EOS"
  3 3
  1 2
  1 3
  2 3
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  7 7
  1 3
  2 7
  3 4
  4 5
  4 6
  5 6
  6 7
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, m = input_lines.shift.split.map(&:to_i)
  a_b = input_lines.shift(m).map { |l| l.split.map(&:to_i) }

  path = Hash.new
  1.upto(n) { |k| path[k] = [] }
  a_b.each do |a, b|
    path[a] << b
    path[b] << a
  end

  count = 0
  stack = [[1]]
  while stack.length > 0
    r = stack.pop
    if r.length == n
      count += 1
      next
    end
    path[r.last].each do |next_pos|
      next if r.include?(next_pos)
      stack << r + [next_pos]
    end
  end

  count.to_s << "\n"
end

puts solve(STDIN.read)
