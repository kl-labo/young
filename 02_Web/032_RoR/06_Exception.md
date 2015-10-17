# 6章 Rubyの例外処理
この章ではRubyの例外処理の記述について説明します。
RubyにはJavaの様にchecked例外、unchecked例外のような区別はありません。
StandardErrorとそのサブクラスとそれ以外のExceptionが存在するだけです。

## 6-1 例外を発生させる
Rubyで独自に例外を作成するにはraiseを使用します。特に指定しない場合はRuntimeErrorが発生します。
```ruby
raise 'MyError'   
# `<main>': MyError (RuntimeError)
```
第一引数には例外クラスを指定することができます。その場合、例外メッセージは第二引数に指定します。
```ruby
raise StandardError, 'スタンダードエラーが発生しました。'
# `<main>': スタンダードエラーが発生しました。 (StandardError)
```
## 6-2 begin-rescue節
例外を捕捉するには、begin-rescueを使用します。
これはJavaで言うところのtry-catchにあたります。
```ruby
begin
  p 1/0
rescue ZeroDivisionError => e
  p e.class         # ZeroDivisionError
  p e.message       # "divided by 0"
  p e.backtrace     # ["begin_rescue.rb:2:in `/'", "begin_rescue.rb:2:in `<main>'"]
end
```
rescueにエラークラスを指定しないと全てのエラーを捕捉します。
```ruby
begin
  # 通常処理
rescue => e
  # 例外処理
end
```
rescueは同時に複数記述したり、複数の例外エラーを同時に補足したりすることができます。Java同様、例外エラーは最初にクラスがマッチしたrescue節で捕捉されます。
```ruby
begin
  # 通常処理
rescue ArgumentError => e
  # 例外処理
rescue ZeroDivisionError, NameError => e
  # 例外処理
end
```
## 6-3 後置rescue
rescueもifと同じ様に処理の後ろに記述することができます。
ただし、後置rescueで捕捉できるのはStandardErrorとそのサブクラスのみなので注意が必要です。
```ruby
result = 1/0 rescue false
p result    # false
```
## 6-4 begin-rescue-ensure節
Javaのfinallyのように最後にかならず実行したい処理はensure節に記述します。
```ruby
begin
  p 1/0
rescue ZeroDivisionError => e
  p '例外処理'       # 例外処理
ensure
  p '最後の処理'     # 最後の処理
end
```
## 6-5 begin-rescue-else節
例外エラーが発生しなかった場合のみ処理をelse節に記述することができます。
```ruby
begin
  result = 10/1
rescue
  p '0で割りました。'
else
  p 'エラーは発生しませんでした。'
end
```
## 6-6 戻り値
begin-rescueは戻り値を持っており、begin節、rescue節、else節で最後に評価された値を返します。
ensure節は戻り値の値にはならないので注意が必要です。
```ruby
returned =
  begin
    value = 'return begin value'
    raise
  rescue
    value = 'return rescue value'
  else
    value = 'return else value'
  ensure
    value = ' not return'
  end
p returned    # return rescue value
```
## 6-7 beginを使わない
rescue節、ensure節、else節はメソッドやクラス、モジュールとも組み合わせることができます。
※モジュールについては後の章で説明します。
```ruby
def method
  # 処理
rescue
  # メソッド呼び出し時に例外が発生した場合の処理
else
  # メソッド呼び出し時に例外が発生しなかった場合の処理
ensure
  # 最終処理
end
```
クラスに記述するには以下の様にします。
```ruby
class Whatever
  # 処理
rescue
  # クラス定義時に例外が発生した場合の処理
else
  # クラス定義時に例外が発生しなかった場合の処理
ensure
  # 最終処理
end
```
## 6-8 Retry
rescue節の中でretryを呼び出すと、begin節やメソッドのはじめから処理をやり直します。
5回までやり直す処理を記述してみましょう。
```ruby
begin
  failed ||= 0
  p 'try'

  result = 1/0
rescue
  failed += 1
  retry if failed < 5
end
# tryが5回表示される
```
## 6-9 throw-catchについて
Rubyにはthrow-catchという大域脱出の処理が用意されています。
Javaの例外エラーの記述と似ていますが、Rubyの場合は例外とは特に関係がありませんので注意してください。
```ruby
catch :triple_loop do
  loop do
    p 1
    loop do
      p 2
      loop do
        p 3
        throw :triple_loop
      end
    end
  end
end
# 1,2,3が表示される
```
