# C - Train Ticket

INPUT1 = <<~"EOS"
  1222
EOS
OUTPUT1 = <<~"EOS"
  1+2+2+2=7
EOS

# 1+2+2+2=7 が条件を満たします。

INPUT2 = <<~"EOS"
  0290
EOS
OUTPUT2 = <<~"EOS"
  0-2+9+0=7
EOS

# この他に、0−2+9−0=7 が条件を満たします。

INPUT3 = <<~"EOS"
  3242
EOS
OUTPUT3 = <<~"EOS"
  3+2+4-2=7
EOS

def solve(input_lines)
  ans = 7
  op = ["-", "+"]
  a = input_lines.chomp.split("")

  res = [a.shift]
  a.each do |n|
    tmp = []
    while res.length > 0
      f = res.shift
      op.each { |o| tmp << f + o + n }
    end
    res = tmp.uniq
  end
  res.each do |f|
    tmp = eval(f)
    return "#{f}=#{tmp}" if tmp == ans
  end
end

puts solve(STDIN.read)
