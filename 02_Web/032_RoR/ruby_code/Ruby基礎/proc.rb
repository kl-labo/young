greeter = Proc.new{|name|
  puts "Hello, #{name}!"
  }
greeter.call('Ruby')

by_literal = ->(name) { puts "Hello, #{name}!"}
by_literal.call('Java');
