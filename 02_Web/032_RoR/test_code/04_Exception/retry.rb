begin
  failed ||= 0
  p 'try'

  result = 1/0
rescue
  failed += 1
  retry if failed < 5
end
