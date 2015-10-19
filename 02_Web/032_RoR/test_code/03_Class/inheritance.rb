class Parent
  def say_hello
    p "hello, Parent class!"
  end
  def say_bye
    p "bye Parent class!"
  end
end

class Child < Parent
  def say_hi
    p "hi, Child class!"
  end
  def say_bye
    p "bye Child class!"
  end
end

child = Child.new
child.say_hello
child.say_hi
child.say_bye
