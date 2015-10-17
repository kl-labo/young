stone = 'ruby'

message =
  case stone
  when 'ruby'
     '7月'
  when 'peridot'
     '8月'
  else
     'わかりません'
  end
p message     # 7月

# thenと正規表現を利用
message =
  case stone
  when /ruby/     then '7月'
  when /peridot/  then '8月'
  else 'わかりません'
  end
p message     # 7月

#caseに値を渡さないことも可能
message =
  case
  when stone == 'ruby'     then '7月'
  when stone == 'peridot'  then '8月'
  else 'わかりません'
  end
p message   #7月
