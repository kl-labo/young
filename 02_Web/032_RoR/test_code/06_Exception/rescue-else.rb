begin
  result =  10/1
rescue ZeroDivisionError => e
  p '0で割りました'
else
  p 'エラーは発生しませんでした。'
end
