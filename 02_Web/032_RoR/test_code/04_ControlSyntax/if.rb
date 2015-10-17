n = 2
message =
  if n.zero?
    '0です'
  elsif n.even?
    '偶数です'
  elsif n.odd?
    '奇数です'
  else
    'わかりません'
  end
p message     # 偶数です

# 3項演算子も記述可能です
message = n.zero? ? '0です' : '0ではありません'
p message  # 0ではありません

# 後置if（unlessはifの逆）
p '0でした' if n.zero?
p '0ではありません' unless n.zero?
