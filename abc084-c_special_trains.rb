# C - Special Trains

INPUT1 = <<~"EOS"
  3
  6 5 1
  1 10 1
EOS
OUTPUT1 = <<~"EOS"
  12
  11
  0
EOS

# 駅 1 からは、以下のように移動します。
# 開通式開始 5 秒後に、駅 2 に向かう列車に乗る。
# 開通式開始 11 秒後に、駅 2 に到着する。
# 開通式開始 11 秒後に、駅 3 に向かう列車に乗る。
# 開通式開始 12 秒後に、駅 3 に到着する。

# 駅 2 からは、以下のように移動します。
# 開通式開始 10 秒後に、駅 3 に向かう列車に乗る。
# 開通式開始 11 秒後に、駅 3 に到着する。
# 駅 3 に対しても、0 を出力しなければならないことに注意してください。

INPUT2 = <<~"EOS"
  4
  12 24 6
  52 16 4
  99 2 2
EOS
OUTPUT2 = <<~"EOS"
  187
  167
  101
  0
EOS

INPUT3 = <<~"EOS"
  4
  12 13 1
  44 17 17
  66 4096 64
EOS
OUTPUT3 = <<~"EOS"
  4162
  4162
  4162
  0
EOS

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  d = input_lines.shift(n - 1).map { |l| l.split.map(&:to_i) }

  result = (n - 1).times.map do |i|
    time = 0
    d[i..].each do |c, s, f|
      if time > s
        tmp = time - s
        quo = tmp / f
        sur = tmp % f
        s = s + quo * f
        s += f if sur != 0
      end
      time = s + c
    end
    time
  end
  result << 0
end

puts solve(STDIN.read)
