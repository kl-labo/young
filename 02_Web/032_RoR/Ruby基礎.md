# Rubyの基本

>名称の Ruby は、プログラミング言語 Perl が6月の誕生石である Pearl（真珠）と同じ発音をすることから、
まつもとの同僚の誕生石（7月）のルビーを取って名付けられた。

なにそれかっこいい

公式ドキュメント  
https://www.ruby-lang.org/ja/documentation/

Rubyにはたくさんの実装があって
JRubyはjavaのパッケージを呼び出せる！
やばすぎる

## 全部オブジェクト  
プリミティブ型が存在しない。
```ruby
p 'hello'.class        #String
p String.ancestors     #[String, Comparable, Object, Kernel, BasicObject]
p 10.class             #Fixnum
p Fixnum.ancestors     #[Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]
p true.class           #TrueClass
p TrueClass.ancestors  #[TrueClass, Object, Kernel, BasicObject]
p nil.class            #NilClass
p NilClass.ancestors   #[NilClass, Object, Kernel, BasicObject]
```

※nilはnullみたいなもの  
※ancestorsは継承関係を取得するメソッド  
※classはクラスを取得するメソッド  
javaではプリミティブ型として定義されていた数値や、true/falseなどすべてがオブジェクトとして
定義されている


コーディング
```ruby
def say_hello(names)
   names.each do |name|
     puts "Hello #{name.upcase}"
  end
end

members = ['sano', 'sumihara','okayama','tono']
hello_ruby(members)
```
```ruby
def add(a, b)
   a + b
end

puts add(1, 2)
```

 メソッドはdefで定義し、endで終了とする。
 変数は型を指定する必要はない。
 戻り値は最後に評価された式の値。
 明示的に戻り値を指定するにはreturnを使用する。
 ```ruby
def add(a, b)
   return a + b
   puts "ここは評価されない"
end

puts add(1, 2)
 ```
 eachはイテレーションするメソッド。|name|に値を入れる。
 文字列内に#{}で変数を埋め込むことができる。
 upcaseは文字列をすべて大文字にする。

## 変数と定数
rubyでは変数のスコープは変数名で判断されます。  
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

### インスタンス変数
インスタンスのみで参照できる変数。  
\@から始める必要があります。

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
puts ruler.length
```
Rubyではインスタンス変数への代入を行うメソッド名は末尾にイコールをつける。
以下のように記述することでgetterとsetterを省略することこができる。
```ruby
class Ruler
  attr_accessor :length
end

ruler = Ruler.new
ruler.length= 45
puts ruler.length
```

#### 定数
定数を利用する場合は大文字アルファベットで始める必要があります。
```ruby
RUBY = "Hello Ruby"
```
## クラス
クラスはclassで始まり、endで終了とする。

```ruby
class MyClass
  def say_hello
    pusts 'hello'
  end
end
```
インスタンスを作成し、呼び出す
```ruby
my_object = MyClass.new   # newメソッドでインスタンスを作成
my_object.say_hello       # helloを出力
```
## 初期化
クラスインスタンスの初期化を行うにはinitializeという名前のメソッドを定義する。

```ruby
class Ruler
  attr_accessor :length

  def initialize(length)
    @length = length
  end
end
ruler = Ruler.new(30);
puts ruler.length
```

## クラスメソッド
クラスに対してメソッドを付加することができます。

```ruby
class Ruler
  attr_accessor :length
  def self.pair
    [Ruler.new, Ruler.new]
  end
end

puts Ruler.pair
```
newもクラスメソッドです。

## クラス変数
クラスとインスタンスをスコープとした変数。
@@で始める必要が有ります。
```ruby
class MyClass
  @@cvar ="Hello Ruby"
  def self.cvar_in_class_method
    puts @@cvar
  end
end
MyClass.cvar_in_class_method
```

## 継承、オーバーライド
```ruby
class Parent
   def say_hello
     puts "hello, Parent class!"
   end
   def say_bye
     puts "bye Parent class!"
   end
end

class Child < Parent
  def say_hi
     puts "Hi, Child class!"
  end
  def say_bye
    puts "bye Child class!"
  end
end

child = Child.new
child.say_hello
child.say_hi
child.say_bye
```

## モジュール
モジュールとはインスタンス化できないクラスのようなもの。

## 配列、連想配列
```ruby
  peaple = {'Alice', 'Bob', 'John'} #配列
  colors = {'red' => 'ff000', 'green' => '00ff00', 'blue' => '0000ff'}
```

## 範囲オブジェクト(Range)
1から５までを表す範囲オブジェクトが有ります。
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

abc.each do |c|
  puts c
end
```

## 正規表現
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

## 手続きオブジェクト
関数をオブジェクトとして表現したもの。
```ruby
greeter = Proc.new{|name|
    puts "Hello , #{name}!"
  }
greeter.call('Ruby')        # Hello, Ruby!

by_literal = -> (name){ puts "Hello, #{name}!"}
by_literal.call('Java')     # Hello, Java!
```

## 外部参照
```ruby
require '/path/to/library'
```

## 文字列生成
``` ruby
String.new("Hello Wolrd")
"Hello Wolrd"
```


## 文字コードについて
$KCODE = "utf-8" は古い
#coding:utf-8

コマンドで文字コードを指定できる

```
ruby -K[kcode] プログラムファイル名
```

|kcode|文字コード|
|:--|:--|
|U| UTF-8
|S|Shift_JIS|
|e|EUC-JP|
|n|None（ASCII）|

エスケープについて  
他言語同様バックスラッシュでエスケープできる。  
%Q、%qによるエスケープ
```ruby
%Q{文字列}
%Q[文字列]
%Q(文字列)
%Q<文字列>
```
使われているかっこ以外の文字は自動的にエスケープされる。
例:
```ruby
print(%Q{"Hello"&'World'\n})
print(%q<{Hello}/(World)>)
```
出力結果:  
```ruby
"Hello"&'World'  
{Hello}/(World)
```

ヒアドキュメントによる複数行文字列生成

```
<<
"識別子"
1行目
2行目
...
最終行
識別子
```
識別子は任意の文字列だがEOS(End of String)がよく使用される。
例:
```ruby
print(<<"EOS")
  Ruby
    On
    Rails
EOS
```
出力結果:
```ruby
Ruby
  On
  Rails
```
