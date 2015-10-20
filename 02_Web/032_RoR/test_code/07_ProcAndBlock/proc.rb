greeter = 
Proc.new do |name|
  p "Hello, #{name}!"
end

greeter.call('Ruby')

by_literal = ->(name) { p "Hello, #{name}!"}
by_literal.call('Java')
