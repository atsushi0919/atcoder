=begin
C - March  / 
実行時間制限: 2 sec / メモリ制限: 256 MB

配点 : 300 点

問題文
N 人の人がいて、i 番目の人の名前は Si です。

この中から、以下の条件を満たすように 3 人を選びたいです。

全ての人の名前が M,A,R,C,H のどれかから始まっている
同じ文字から始まる名前を持つ人が複数いない
これらの条件を満たすように 3 人を選ぶ方法が何通りあるか、求めてください。ただし、選ぶ順番は考えません。

答えが 32 bit整数型に収まらない場合に注意してください。

制約
1≤N≤10^5
Si は英大文字からなる
1≤∣Si∣≤10
S 
i
​
 

=S 
j
​
 (i

=j)
入力
入力は以下の形式で標準入力から与えられる。

N
S 
1
​
 
:
S 
N
​
 
出力
与えられた条件を満たすように 3 人を選ぶ方法が x 通りのとき、x を出力せよ。

入力例 1 
Copy
5
MASHIKE
RUMOI
OBIRA
HABORO
HOROKANAI
出力例 1 
Copy
2
次のような名前の 3 人を選ぶと良いです。

MASHIKE,RUMOI,HABORO

MASHIKE,RUMOI,HOROKANAI

よって、2 通りとなります。

入力例 2 
Copy
4
ZZ
ZZZ
Z
ZZZZZZZZZZ
出力例 2 
Copy
0
与えられた条件を満たすように 3 人を選ぶ方法が存在しない場合に注意してください。

入力例 3 
Copy
5
CHOKUDAI
RNG
MAKOTO
AOKI
RINGO
出力例 3 
Copy
7
=end