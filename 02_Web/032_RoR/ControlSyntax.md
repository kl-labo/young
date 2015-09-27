# Rubyの制御構文
Rubyの制御構文はJavaと書き方は似ていますが、戻り値を持っており、より利便性が高くなっています。
## 条件分岐
### - if文 -
if文は最後に評価された値を戻り値として返します。'elsif'という書き方にも注意が必要です。

```ruby
n = 2
# 戻り値をmessageに受けます
messsage =
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
```
### - unless文 -
unless文はif文と逆の働きをします。ただし、elseを記述することはできません。
```ruby
n = 2
message =
  unless n.zero?
     '0ではありません'
   end
p message   # 0ではありません
```


### - 後置if文 -
if文を処理の後ろに書くことができます。条件式がtrueの時のみ処理が実行されます。主に可読性を上げるために用いられます。
```ruby
n = 2
p '0でした' if n.zero?
p '0ではありません' unless n.zero?
```

### - 三項演算子 -
三項演算子も記述することができます。
```ruby
message = n.zero? '0です' : '0ではありません'
p message  # 0ではありません
```

### - case文 -
Javaのswitch文にあたります。if文同様、最後に評価された値を戻り値とします。thenを利用することで可読性を上げることができます。
```ruby
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

# thenと正規表現を利用します
message =
  case stone
  when /ruby/     then '7月'
  when /peridot/  then '8月'  
  else 'わかりません'
  end
p message     # 7月

#caseに値を渡さないことも可能です
message =
  case
  when stone == 'ruby'     then '7月'
  when stone == 'peridot'  then '8月'
  else 'わかりません'
  end
p message     # 7月
```

## - 繰り返し -
### - while文 -
Java同様、条件式がtrueの間、処理を繰り返します。
```ruby
languages = %w(Perl Python Ruby)
i = 0
while i < languages.length
  p languages[i]
  i += 1
end
# Perl Python Ruby
```
### - until文 -
until文はwhile文と逆の動きをします。
``` ruby
languages = %w(Perl Python Ruby)
i = 0
until languages.length <= i
  p languages[i]
  i+= 1
end
# Perl Python Ruby
```

### - 後置while文 -
処理の後ろにwhile文を記述することでJavaのdo-while文と同じ動きをします。beginとend-whileを利用すると複数の処理を実行させることができます。
```ruby
languages = %w(Perl Python Ruby)
i = 0
p i += 1 while i <languages.length
i=0
p i += i until languages.length <= i
# Perl Python Ruby

i = 0
begin
p languages[i]
i += 1
end while i < languages.length
# Perl Python Ruby
```
### - for文 -
for文はJavaとは大きく異なり、拡張for文のような形になります。また、for文で宣言した変数にfor文の外からも参照することができます。他にもハッシュ配列のkeyとvalueを同時に取得することも可能です。

```Ruby
for name in %w(Alice Bob Carol)
  p name
end
# Alice Bob Carol)

# for文の外から参照できます
p name  # Carol

# ハッシュをループさせる際はkeyも同時に取得できます
for key, val in {a: 1, b: 2}
  p key
  p val
end
```
### -その他の繰り返し構文 -
Rubyには他にも便利な繰り返し構文が多数存在します。loop文はbreakするまで無限に処理を繰り返します。timesメソッドは数値オブジェクトの回数分処理を繰り返します。eachメソッドは要素数分処理を繰り返します。繰り返し文中ではredoが使えます。redoはもう一度同じ処理を繰り返します。

```ruby
# loop
loop do
  p 'infinity?'
  break
end
# inifinity?

# times
5.times do
  p 'print 5 times'
end
# print 5times * 5

# each
languages = %w(Ruby Perl Java C#)
 languages.each { |language|
  p language
  next unless language == 'Java'
  p 'found Java'
  redo

  # Ruby Perl Java found Java Found Java...繰り返し
}
```
