catch :triple_loop do
  loop do
    p 1
    loop do 
      p 2
      loop do 
        p 3
        throw :triple_loop
      end
    end
  end
end
