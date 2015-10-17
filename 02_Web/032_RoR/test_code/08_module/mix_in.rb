module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

class Human
  include Greetable
end

hum = Human.new
hum.say_hello 'Mix-in'
