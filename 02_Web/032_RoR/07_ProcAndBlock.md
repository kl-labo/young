# 7章 blockとProc
この章ではRubyのblockとProcについて説明します。

## 7-1 block
blockとは処理のまとまりを引数としてメソッドに渡すためのものです。do-endや{}で囲って記述します。
ブロックを仮引数として受け取るメソッドを記述するには&を使用します。
```ruby
# ブロックを引数として受け取るメソッド
def recieve_block(&block)
  # callメソッドでブロックの中身の処理を呼び出す
  block.call
end

# 引数としてブロックを記述する
recieve_block do
  p "Hello, block!"
end
```

## 7-2 yield
yieldを使ってcallと仮引数を省略できます。
```ruby
def recieve_block
  yield
end

recieve_block do
  p "Hello yield!"
end
# Hello yield!
```

## 7-3 Proc
Procはblockをオブジェクトとして定義できるようにしたものです。
Proc.newの引数にブロックを渡して生成できます。仮引数は|name|のように縦線で囲って記述します。
```ruby
greeter = Proc.new  do |name|
    p "Hello , #{name}!"
end

greeter.call('Ruby')   # Hello Ruby
```
また、ProcはJavaのラムダ式のように短縮することができます。
```ruby
by_literal = -> (name){ p "Hello, #{name}!"}
by_literal.call('Java')     # Hello, Java!
```
