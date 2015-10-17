# 8章 Module
この章ではRubyのModuleの仕様について説明します。

## 8-1 Moduleとは
モジュールとは処理をひとまとめにして定義したものです。
以下の特徴があります。

+ インスタンスを生成することができない
+ 継承することはできない
+ モジュールのメソッドをクラスのインスタンスメソッドとして取り込む
+ モジュールのメソッドをオブジェクトの特異メソッド（クラスメソッド）として取り込む
+ モジュール関数を定義して使う

モジュールの定義にはmoduleキーワードを使用します。
```ruby
module Greetable
  def self.say_hello
    p 'Hello module!'
  end
  def say_bye
    p 'Bye module'
  end
end

# selfメソッドを呼び出すことができます
Greetable.say_hello   # Hello module

# インスタンス化できないのでインスタンスメソッドは呼び出せません
# Greetable.say_bye   # undefined method
```

## 8-2 Mix-in
モジュールは前述の通り、クラスのインスタンスメソッドとして取り込む事ができます。これをMix-inといいます。
Mix-inを行うにはincludeを用います。
```ruby
module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

class Human
  include Greetable
end

hum = Human.new
hum.say_hello 'Mix-in'    # Hello Mix-in
```
一つのクラスに複数のmoduleをMix-inすることもできます。
```ruby
module ModuleA
  def say_A
    p 'Hello A'
  end
end
module ModuleB
  def say_B
    p 'Hello B'
  end
end

class AandB
  include ModuleA
  include ModuleB
end

ab = AandB.new
ab.say_A    # Hello A
ab.say_B    # Hello B
```
また、Moduleの中にModuleをMix-inすることもできます。
```ruby
module ModuleA
  def say_A
    p 'Hello A'
  end
end
module ModuleB
  def say_B
    p 'Hello B'
  end
  include ModuleA
end

class AandB
  include ModuleB
end

ab = AandB.new
ab.say_A    # Hello A
ab.say_B    # Hello B
```

## 8-3 extend
Moduleに定義されたメソッドはオブジェクトの特異メソッドとして取り込むことができます。
取り込むためにはextendを用います。
```ruby
module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

o = Object.new
o.extend Greetable

o.say_hello 'Ruby!'   # Hello Ruby!
```
また、クラスもオブジェクトなので、Moduleをextendすることが可能です。
クラス定義内でextendするとクラスメソッドとして取り込みます。
```ruby
module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

class Human
  extend Greetable
end

Human.say_hello 'Ruby'  # Hello Ruby!
```
