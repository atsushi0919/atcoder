# C - Bridge

INPUT1 = <<~"EOS"
  7 7
  1 3
  2 7
  3 4
  4 5
  4 6
  5 6
  6 7
EOS
OUTPUT1 = <<~"EOS"
  4
EOS

INPUT2 = <<~"EOS"
  3 3
  1 2
  1 3
  2 3
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

INPUT3 = <<~"EOS"
  6 5
  1 2
  2 3
  3 4
  4 5
  5 6
EOS
OUTPUT3 = <<~"EOS"
  5
EOS

class UnionFind
  attr_reader :parent, :max_size

  def initialize(size)
    @parent = Array.new(size, -1)
    @max_size = 1
  end

  def root(x)
    return x if @parent[x] < 0
    @parent[x] = root(@parent[x])
  end

  def merge(x, y)
    x_r = root(x)
    y_r = root(y)
    return if x_r == y_r

    x_r, y_r = y_r, x_r if @parent[x_r] > @parent[y_r]
    @parent[x_r] += @parent[y_r]
    @parent[y_r] = x_r
    @max_size = [@max_size, size(x_r)].max
  end

  def size(x)
    -@parent[root(x)]
  end
end

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, m = input_lines.shift.split.map(&:to_i)
  a_b = input_lines.shift(m).map { |l| l.split.map(&:to_i) }

  count = 0
  a_b.combination(m - 1).each do |c|
    uf = UnionFind.new(n)
    c.each { |a, b| uf.merge(a - 1, b - 1) }
    count += 1 if uf.max_size < n
  end
  count
end

puts solve(STDIN.read)
