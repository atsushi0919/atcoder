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

=begin
n, k = gets.chomp.split.map(&:to_i)
h = Hash.new(0)
n.times{
    a, b = gets.chomp.split.map(&:to_i)
    h[a] += b
}
sum = 0
h.to_a.sort_by{|a, b| a}.each{|a, b|
    sum += b
    if sum >= k
        puts a
        break
    end
}

実行時間制限: 2 sec / メモリ制限: 256 MB

配点 : 300 点

問題文
空の配列が 1 つあります。
この配列に、整数を配列に挿入する操作を N 回行います。
i(1≦i≦N) 回目の操作では、配列に整数 ai を bi 個挿入します。
N 回の挿入操作後の配列の中で、K 番目に小さい数を求めてください。
例えば、配列が {1,2,2,3,3,3} の時、4 番目に小さい数は 3 となります。

制約
1≦N≦10^5
1≦a i
​
 ,b 
i
​
 ≦10 
5
 
1≦K≦b 
1
​
 …+…b 
n
​
 
入力は全て整数である。
入力
入力は以下の形式で標準入力から与えられる。

N K
a 
1
​
  b 
1
​
 
:  
a 
N
​
  b 
N
​
 
出力
N 回の挿入操作後の配列の中で、K 番目に小さい数を出力せよ。

入力例 1 
Copy
3 4
1 1
2 2
3 3
出力例 1 
Copy
3
操作後の配列は、問題文に書かれている例と同じです。

入力例 2 
Copy
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
出力例 2 
Copy
1
=end
