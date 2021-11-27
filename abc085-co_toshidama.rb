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
  n, y = input_lines.split.map(&:to_i)

  result = [-1, -1, -1]
  (y / s[:ma]).downto(0) do |ma|
    break if ma > n
  end
end

p solve(INPUT1)

=begin
C - Otoshidama  / 
実行時間制限: 2 sec / メモリ制限: 256 MB

配点 : 300 点

問題文
日本でよく使われる紙幣は、10000 円札、5000 円札、1000 円札です。以下、「お札」とはこれらのみを指します。

青橋くんが言うには、彼が祖父から受け取ったお年玉袋にはお札が N 枚入っていて、
合計で Y 円だったそうですが、嘘かもしれません。このような状況がありうるか判定し、
ありうる場合はお年玉袋の中身の候補を一つ見つけてください。
なお、彼の祖父は十分裕福であり、お年玉袋は十分大きかったものとします。

制約
1≤N≤2000
1000≤Y≤2×10^7
 
N は整数である。
Y は 1000 の倍数である。
入力
入力は以下の形式で標準入力から与えられる。

N Y
出力
N 枚のお札の合計金額が Y 円となることがありえない場合は、-1 -1 -1 と出力せよ。
N 枚のお札の合計金額が Y 円となることがありうる場合は、
そのような N 枚のお札の組み合わせの一例を「10000 円札 x 枚、5000 円札 y 枚、1000 円札 z 枚」として、
x、y、z を空白で区切って出力せよ。複数の可能性が考えられるときは、そのうちどれを出力してもよい。

入力例 1 
Copy
9 45000
出力例 1 
Copy
4 0 5
お年玉袋に 10000 円札 4 枚と 1000 円札 5 枚が入っていれば、合計枚数が 9 枚、合計金額が 45000 円になります。5000 円札 9 枚という可能性も考えられるため、0 9 0 も正しい出力です。

入力例 2 
Copy
20 196000
出力例 2 
Copy
-1 -1 -1
合計枚数が 20 枚の場合、すべてが 10000 円札であれば合計金額は 200000 円になり、そうでなければ 195000 円以下になるため、196000 円という合計金額はありえません。

入力例 3 
Copy
1000 1234000
出力例 3 
Copy
14 27 959
この他にも多くの候補があります。

入力例 4 
Copy
2000 20000000
出力例 4 
Copy
2000 0 0
=end
