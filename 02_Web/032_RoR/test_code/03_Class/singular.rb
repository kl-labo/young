class Foo
end

foo = Foo.new
bar = Foo.new

def bar.singular_method
  p 'Hello bar!'
end

bar.singular_method
# foo.singular_method

