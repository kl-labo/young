class MyClass
  @@cvar ="Hello Ruby"
  def self.cvar_in_class_method
    p @@cvar
  end
end

MyClass.cvar_in_class_method
