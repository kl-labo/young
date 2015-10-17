# 9章 オープンクラス
この章ではRubyのオープンクラスについて説明します。

## 9-1 オープンクラスとは
Rubyではすでに定義されたクラスに対して再度メソッドを定義しなおしたり、メソッドを追加することが可能です。
定義済みのクラスを拡張できることをRubyではオープンクラスと言います。
すでに定義されているクラスを再度記述することで拡張することができます。
```ruby
class Human
  def say_hello
    p "Hello!"
  end
end

class Human
  def say_bye
    p "Bye!"
  end
end

hum = Human.new
hum.say_hello   # Hello!
hum.say_bye     # Bye!
```
既存の組み込みクラスも拡張することができます。
Numericクラスに0から自分自身の数値までの配列を返すメソッドを追加します。
```ruby
class Numeric
  def steps
    return [] if self <= 0
    0.upto(self).to_a
  end
end
p 5.steps     # [0, 1, 2, 3, 4, 5]
p 1.steps     # [0, 1]
p 0.steps     # []
p -1.steps    # []
```
## 9-2 全てがオブジェクト
Rubyでは全てのクラスがObjectを継承しています。
そのため、Objectクラスにメソッドを追加することで、全てのクラスに継承させることができます。
```ruby
class Object
  def say_hello
    p "Hello! #{self}"
  end
end

1.say_hello       # Hello 1
nil.say_hello     # Hello

# 新しく作成されたクラスもObjectを継承するため、メソッドが追加されます
class Human
end

Human.say_hello   # Hello Human
hum = Human.new
hum.say_hello     # Hello #<Human:0x007f91fb02a370>"
```
