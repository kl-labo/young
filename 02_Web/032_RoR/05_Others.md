# 5章 その他の組み込みクラス
この章ではRubyでよく使われるその他の組み込みクラスについて説明します。

## 5-1　シンボル
シンボルとは文字列と1:1で対応する記号です。:で始める必要があります。ダブルクォートやシングルクォートで囲う必要がなく、エスケープも自動でされ、初期化の必要がありません。
主にコードの可読性をあげるために用いられます。
```ruby
p :_ruby    # _ruby
p :ruby=    # _ruby
p :ruby!    # ruby!
```

## 5-2 配列、連想配列
配列を定義するときは{}を利用します。連想配列は{}と=>を利用して定義します。
Rubyでは型の宣言がないため、異なる型の値を格納することができます。
```ruby
# 配列
people = ['Alice', nil, 1]

p people[0]   # Alice
p people[1]   # nil
p people[2]   # 1

# 連想配列（キーには可読性向上のためシンボルがよく用いられる）
colors = {:red => 'ff0000', :green => '00ff00', :blue => '0000ff'}

p colors[:red]      # ff0000
p colors[:green]    # 00ff00
p colors[:blue]     # 0000ff
```
また、%記法を用いて簡単に配列を記述することができます。
```ruby
p %w(Alice nil 1)       # ["Alice", "nil", "1"]
p %i(red green blue)    # [:red, :green :blue]
```
%wは全て文字列になることに注意してください。

## 5-3 範囲オブジェクト
Rubyには範囲を表すオブジェクトがあります。
「1..5」または「１...5」と表現します。後者は末尾の5を含みません。
```ruby
# 数値の範囲
(1..5).include?(1)    # true
(1..5).include?(5)    # true
(1...5).include?(1)   # true
(1...5).include?(5)   # false

# 日付の範囲
vacation = Time.at(1343746800)..Time.at(1346425199)
vacation.begin        # 2012-08-01 00:00:00 +0900
vacation.end          # 2012-08-31 13:59:59 +0900

# 文字列の範囲
abc = ('a'..'c')
p abc.include?('b')       #true
p abc.include?('c')       #true
p abc.include?('d')       #false
```
※.include?は引数を含むか判別するメソッドです。

## 5-4 正規表現
正規表現リテラルは両端を/で囲んで表現します。正規表現によってパターンマッチを行うには、===や=~を利用します。===はパターンにマッチするか真偽値を、=~は最初にマッチした位置を整数で返します。
```ruby
# 0から9まで
pattern = /[0-9]+/

# マッチするかを真偽値で返す
pattern === 'TEST 1990'     # true
pattern === 'Hello Ruby'    # false

# 最初にマッチした位置を返す
pattern =~ 'TEST 1990'      # 5
pattern =~ 'Hello Ruby'     # nil
```
