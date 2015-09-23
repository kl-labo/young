class Parent
   def say_hello
        puts "hello, Parent class!"
           end
              def say_bye
                   puts "bye Parent class!"
                      end
                      end

                      class Child < Parent
                        def say_hi
                             puts "Hi, Child class!"
                               end
                                 def say_bye
                                     puts "bye Child class!"
                                       end
                                       end

                                       child = Child.new
                                       child.say_hello
                                       child.say_hi
                                       child.say_bye
