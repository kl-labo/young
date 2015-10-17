result = 
  begin
    1/0
  rescue ZeroDivisionError => e
    p e.class
    p e.message
    p e.backtrace
  ensure
    p '最後の処理'
  end
p result
