module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

class Human
  extend Greetable
end

Human.say_hello 'Ruby'
