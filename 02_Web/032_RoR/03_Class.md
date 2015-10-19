# 3章 クラス
この章ではRubyのクラスの記述方法と仕様について説明します。

## 3-1 クラスの定義
クラスはclassで始まり、endで終わるように定義します。クラス名をアルファベットの大文字で始めます。一章でも説明した通り、全てのクラスにObjectクラスが継承されているので、newメソッドを使ってインスタンスを作成することができます。
```ruby
class MyClass
  def say_hello
    p 'hello'
  end
end

my_object = MyClass.new
my_object.say_hello       # hello
```

## 3-2 インスタンス変数
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

## 3-3 クラスの初期化
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

## 3-4 クラスメソッド
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

## 3-5 クラス変数
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

## 3-6 継承、オーバーライド
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

## 3-7 特異メソッド
オブジェクトはクラスに定義されたメソッドとは別に固有のメソッドを付け加えることができます。これを特異メソッドと言います。
```ruby
class Foo
end

foo = Foo.new
bar = Foo.new

# barだけにメソッドを定義する
def bar.singular_method
  p 'Hello bar!'
end

bar.singular_method     # Hello bar!
# foo.singular_method   # NoMethodError
```
