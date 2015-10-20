module ModuleA
  def say_A
      p 'Hello A'
  end
end
module ModuleB
   def say_B
      p 'Hello B'
   end
   include ModuleA
end

class AandB
   include ModuleB
end

ab = AandB.new
ab.say_A    # Hello A
ab.say_B    # Hello B
