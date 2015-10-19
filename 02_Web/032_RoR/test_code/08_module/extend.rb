module Greetable
  def say_hello(name)
    p "Hello #{name}"
  end
end

o = Object.new
o.extend Greetable

o.say_hello 'Ruby!'
