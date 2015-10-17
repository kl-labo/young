# 4章 Rubyの制御構文
この章ではRubyの制御構文の書き方や特徴について説明します。
Rubyの制御構文はJavaと書き方は似ていますが、戻り値を持っているなどより利便性が高くなっています。

## 4-1 if文
Rubyのif文は最後に評価された値を戻り値として返します。
elsifという書き方にも注意が必要です。

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
## 4-2 unless文
unless文はif文と逆の働きをします。
ただし、elseを記述することはできません。
```ruby
n = 2
message =
  unless n.zero?
     '0ではありません'
   end
p message   # 0ではありません
```

## 4-3 後置if文
if文を処理の後ろに書くことができます。
条件式がtrueの時のみ処理が実行されます。
主に可読性を上げるために用いられます。
```ruby
n = 2
p '0でした' if n.zero?
p '0ではありません' unless n.zero?
```

## 4-4 三項演算子
三項演算子も記述することができます。
```ruby
message = n.zero? '0です' : '0ではありません'
p message  # 0ではありません
```

## 4-5 case文
Rubyのcase文はJavaのswitch文にあたります。
if文同様、最後に評価された値を戻り値とします。
thenを利用することで可読性を上げることができます。
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

## 4-6 while文
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
## 4-7 until文
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

## 4-8 後置while文
処理の後ろにwhile文を記述することでJavaのdo-while文と同じ動きをします。
beginとend-whileを利用すると複数の処理を実行させることができます。
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
## 4-9 for文
for文はJavaとは大きく異なり、拡張for文のような形になります。
また、for文で宣言した変数にfor文の外からも参照することができます。
他にもハッシュ配列のkeyとvalueを同時に取得することも可能です。

```ruby
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
### 4-10 その他の繰り返し構文
Rubyには他にも便利な繰り返し構文が多数存在します。
loop文はbreakするまで無限に処理を繰り返します。
timesメソッドは数値オブジェクトの回数分処理を繰り返します。
eachメソッドは要素数分処理を繰り返します。
繰り返し文中ではredoというもう一度同じ処理を繰り返す命令を記述することができます。

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
```
