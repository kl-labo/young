module Greetable
  def self.say_hello
    p 'Hello module!'
  end
  def say_bye
    p 'Bye module!'
  end
end

Greetable.say_hello
Greetable.say_bye
