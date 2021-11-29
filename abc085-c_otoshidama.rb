# C - Otoshidama

INPUT1 = <<~"EOS"
  9 45000
EOS
OUTPUT1 = <<~"EOS"
  4 0 5
EOS

# お年玉袋に 10000 円札 4 枚と 1000 円札 5 枚が入っていれば、合計枚数が 9 枚、合計金額が 45000 円になります。
# 5000 円札 9 枚という可能性も考えられるため、0 9 0 も正しい出力です。

INPUT2 = <<~"EOS"
  20 196000
EOS
OUTPUT2 = <<~"EOS"
  -1 -1 -1
EOS

# 合計枚数が 20 枚の場合、すべてが 10000 円札であれば合計金額は 200000 円になり、
# そうでなければ 195000 円以下になるため、196000 円という合計金額はありえません。

INPUT3 = <<~"EOS"
  1000 1234000
EOS
OUTPUT3 = <<~"EOS"
  14 27 959
EOS

# この他にも多くの候補があります。

INPUT4 = <<~"EOS"
  2000 20000000
EOS
OUTPUT4 = <<~"EOS"
  2000 0 0
EOS

def solve(input_lines)
  s = { ma: 10000, go: 5000, se: 1000 }
  d = s[:go] - s[:se]
  n, y = input_lines.split.map(&:to_i)

  result = [-1, -1, -1]
  (y / s[:ma]).downto(0) do |ma|
    # y 円に満たない
    break if ma > n
    # 5千円, 千円の組み合わせで作りたい金額
    c_a = y - s[:ma] * ma
    # 組み合わせで使えるお札の枚数
    c_q = n - ma
    # 組み合わせで作れる最大金額
    c_max = s[:go] * c_q
    # 組み合わせで作れる最小金額
    c_min = s[:se] * c_q
    # 組み合わせで作れないならスキップ
    next if c_a < c_min || c_a > c_max

    # 作れる可能性があるなら計算してみる
    quo = (c_a - c_min) / d
    if (c_a - c_min) % d == 0
      result = [ma, quo, c_q - quo]
      break
    end
  end
  result.join(" ")
end

puts solve(STDIN.read)
