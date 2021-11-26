# C - Dubious Document 2

INPUT1 = <<~"EOS"
  ?tc????
  coder
EOS
OUTPUT1 = <<~"EOS"
  atcoder
EOS

INPUT2 = <<~"EOS"
  ??p??d??
  abc
EOS
OUTPUT2 = <<~"EOS"
  UNRESTORABLE
EOS

INPUT3 = <<~"EOS"
  ???
  b
EOS
OUTPUT3 = <<~"EOS"
  aab
EOS

INPUT4 = <<~"EOS"
  a
  aa
EOS
OUTPUT4 = <<~"EOS"
  UNRESTORABLE
EOS

def solve(input_lines)
  sd, t = input_lines.split

  sd_l = sd.length
  t_l = t.length
  res = "UNRESTORABLE"
  (sd_l - t_l).downto(0) do |i|
    s = sd.slice(i, t_l).gsub("?", ".")
    if t.match(s)
      sd[i..i + t_l - 1] = t
      return sd.gsub("?", "a")
    end
  end
  res
end

puts solve(STDIN.read)
