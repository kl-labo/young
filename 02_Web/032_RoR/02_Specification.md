# 2章 Rubyの言語仕様
この章ではRubyの言語仕様（クラス、メソッドの書き方など）を説明します。

## 2-1 Rubyのメソッド
Rubyのメソッドはdefで始まり、endで終わるように定義します。メソッドは内部で最後に評価された値を返します。 足し算をするメソッドを作成してみましょう。  

```ruby
def add(a, b)
   a + b
end

p add(1, 2)   # 3
```
<span　style="font-size:80% color:#666666">
※Rubyでは変数の型は定義せず、動的に決定されます。
</span>
pは結果を出力するメソッドです。addメソッド内で最後に評価された[a + b]の結果が出力されているのがわかります。
明示的に戻り値を指定したい場合にはreturnを使用します。
 ```ruby
def add(a, b)
   return a + b
   p "ここは評価されない"
end

p add(1, 2)   # 3
 ```
return以下の内容が評価されることはありません。

### 真偽値を返すメソッド
メソッドの中には末尾に?が付いているものがあります。（コアリファレンス参照）
これは真偽値を返すメソッドです。例えばempty?というメソッドがあります。
```ruby
message = "hello Ruby"
p message.empty?    # false
```

### 破壊的メソッド
メソッド名の末尾に!が付いているものがあります。
これは破壊的メソッドといい、元の値を変更するメソッドです。例えばupcase!というメソッドがあります。
```ruby
message = "hello Ruby"
# !をつけない場合、破壊的メソッドではないため元の値に影響はありません
p message.upcase    # HELLO RUBY
p message           # hello Ruby

# !をつけた場合、破壊的メソッドとなり元の値を変更します
p message.upcase!   # HELLO RUBY
p message           # HELLO RUBY
```

## 2-2 変数と定数
Rubyでは変数のスコープは変数名で判断しています。宣言された場所を確認しなくても一目でスコープがわかるようになっています。

####  ローカル変数  
ローカル変数の変数名は小文字のアルファベットもしくは、\_で始める必要があります。
```ruby
ruby = 'Hello Ruby'
_ruby = 'Hello Ruby'
```
#### グローバル変数
グローバル変数の変数名は$から始める必要があります。

```ruby
$ruby = 'Hello Ruby'
```

#### 定数
定数を利用する場合は大文字アルファベットで始める必要があります。
```ruby
RUBY = "Hello Ruby"
```

## 2-3 クラス
クラスはclassで始まり、endで終わるように定義します。クラス名をアルファベットの大文字で始めます。一章でも説明した通り、全てのクラスにObjectクラスが継承されているので、newメソッドを使ってインスタンスを作成することができます。
```ruby
class MyClass
  def say_hello
    pusts 'hello'
  end
end

my_object = MyClass.new
my_object.say_hello       # hello
```

### インスタンス変数
インスタンス内のみで参照できる変数です。\@から始める必要があります。
Rubyではインスタンス変数への代入を行うメソッド（Javaでいうところのsetterメソッド）は末尾にイコールをつける必要があります。
受け取った長さを返すクラスを作ってみましょう。
```ruby
class Ruler
  def length=(val)
      @length = val
  end

  def length
    @length
  end
end

ruler = Ruler.new
ruler.length = 30
puts ruler.length   # 30
```
attr_accessorを利用することでgetterとsetterを省略することこができます。
```ruby
class Ruler
  attr_accessor :length
end

ruler = Ruler.new
ruler.length= 45
p ruler.length    # 45
```

### クラスの初期化
クラスインスタンスの初期化を明示的に行うにはinitializeという名前のメソッドを定義します。これはJavaでいうところのコンストラクタにあたります。

```ruby
class Ruler
  attr_accessor :length

  def initialize(length)
    @length = length
  end
end
ruler = Ruler.new(30);
p ruler.length    # 30
```

### クラスメソッド
クラスメソッドはインスタンス化しなくても呼び出せるメソッドです。メソッド名の前にself.をつけて定義します。
newもクラスメソッドとなります。
```ruby
class Ruler
  attr_accessor :length
  def self.pair
    [Ruler.new, Ruler.new]
  end
end

p Ruler.pair    # [#<Ruler:0x007fdf3480ece0>, #<Ruler:0x007fdf3480ecb8>]
```

### クラス変数
クラスとインスタンスをスコープとした変数です。@@で始める必要があります。
```ruby
class MyClass
  @@cvar ="Hello Ruby"
  def self.cvar_in_class_method
    p @@cvar
  end
end
MyClass.cvar_in_class_method    # Hello Ruby
```

### 継承、オーバーライド
Rubyでは単一継承をサポートしています。継承は以下の様に<を利用します。
Java同様、サブクラスで同名のメソッドを定義することでオーバーライドすることができます。
```ruby
class Parent
   def say_hello
     p "hello, Parent class!"
   end
   def say_bye
     p "bye Parent class!"
   end
end

class Child < Parent
  def say_hi
     p "hi, Child class!"
  end
  def say_bye
    p "bye Child class!"
  end
end

child = Child.new
child.say_hello   # hello, Parent class!
child.say_hi      # hi, Child class!
# オーバーライド
child.say_bye     # bye, Child class!
```
## 2-3 主な組み込みクラス
Rubyでよく使われる組み込みクラスを紹介します。

###　シンボル
シンボルとは文字列と1:1で対応する記号です。:で始める必要があります。ダブルクォートやシングルクォートで囲う必要がなく、エスケープも自動でされ、初期化の必要がありません。
主にコードの可読性をあげるために用いられます。
```ruby
p :_ruby    # _ruby
p :ruby=    # _ruby
p :ruby!    # ruby!
```

### 配列、連想配列
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

### 範囲オブジェクト(Range)
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
<span　style="font-size:80% color:#666666">
.include?は引数を含むか判別するメソッドです。
</span>

### 正規表現
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

### 手続きオブジェクト
手続き型オブジェクトは関数をオブジェクトとして表現したものです。
Proc.newにブロックを渡すことで手続きオブジェクトを生成できます。仮引数は|name|のように縦線で囲って記述します。
```ruby
greeter = Proc.new {|name|
    p "Hello , #{name}!"
  }
greeter.call('Ruby')        # Hello, Ruby!
```
また、手続き型オブジェクトはJavaのラムダ式のように短縮することができます。
```ruby
by_literal = -> (name){ p "Hello, #{name}!"}
by_literal.call('Java')     # Hello, Java!
```
