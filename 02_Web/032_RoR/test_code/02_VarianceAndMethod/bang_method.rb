message = "hello Ruby"
# !をつけない場合、破壊的メソッドではないため元の値に影響はありません
p message.upcase    # HELLO RUBY
p message           # hello Ruby

# !をつけた場合、破壊的メソッドとなり元の値を変更します
p message.upcase!   # HELLO RUBY
p message           # HELLO RUBY
