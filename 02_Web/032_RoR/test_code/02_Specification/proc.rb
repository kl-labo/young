greeter = 
Proc.new { |name|
  p "Hello, #{name}!"
}
greeter.call('Ruby')

by_literal = ->(name) { p "Hello, #{name}!"}
by_literal.call('Java');
