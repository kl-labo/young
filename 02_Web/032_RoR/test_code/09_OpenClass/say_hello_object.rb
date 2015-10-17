class Object
  def say_hello
    p "Hello! #{self}"
  end
end

1.say_hello
nil.say_hello

class Human
end
Human.say_hello
hum = Human.new
hum.say_hello
