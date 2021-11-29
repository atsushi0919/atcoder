# C - Takahashi's Information

INPUT1 = <<~"EOS"
  1 0 1
  2 1 2
  1 0 1
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

# a1=0,a2=1,a3=0,
# b1=1,b2=0,b3=1 などの組み合わせがありうるので, 高橋君の情報は正しいです.

INPUT2 = <<~"EOS"
  2 2 2
  2 1 2
  2 2 2
EOS
OUTPUT2 = <<~"EOS"
  No
EOS

# このグリッドの場合、高橋君の情報は間違っています.

INPUT3 = <<~"EOS"
  0 8 8
  0 8 8
  0 8 8
EOS
OUTPUT3 = <<~"EOS"
  Yes
EOS
INPUT4 = <<~"EOS"
  1 8 6
  2 9 7
  0 7 7
EOS
OUTPUT4 = <<~"EOS"
  No
EOS

def solve(input_lines)
  a = input_lines.split("\n").map { |l| l.split.map(&:to_i) }
  b = a.shift
  result = true
  a.each do |r|
    dif = b[0] - r[0]
    tmp = r.map { |n| n + dif }
    if b != tmp
      result = false
      break
    end
  end
  result ? "Yes" : "No"
end

puts solve(STDIN.read)

=begin
C - Takahashi's Information  / 
実行時間制限: 2 sec / メモリ制限: 256 MB

配点：300 点

問題文
3×3 のグリッドがあります.
上から i 番目で左から j 番目のマスを (i,j) で表すとき, マス (i,j) には数 c i,j が書かれています.
高橋君によると,
整数 a1, a2, a3, b1, b2, b3の値が決まっており,
マス (i,j) には数 ai+bj が書かれているらしいです.
高橋君の情報が正しいか判定しなさい.

制約
c 
i,j
​
  (1≤i≤3,1≤j≤3) は 0 以上 100 以下の整数
入力
入力は以下の形式で標準入力から与えられる。

c1,1 c1,2 c1,3
c2,1 c2,2 c2,3
​c3,1 c3,2 c3,3
​
出力
高橋君の情報が正しい場合 Yes, そうでない場合 No と出力してください.

入力例 1 
1 0 1
2 1 2
1 0 1
出力例 1 
Yes

a1=0,a2=1,a3=0,
b1=1,b2=0,b3=1 などの組み合わせがありうるので, 高橋君の情報は正しいです.

入力例 2 
2 2 2
2 1 2
2 2 2
出力例 2 
No

このグリッドの場合、高橋君の情報は間違っています.

入力例 3 
0 8 8
0 8 8
0 8 8
出力例 3 
Yes
入力例 4 
1 8 6
2 9 7
0 7 7
出力例 4 
No
=end
