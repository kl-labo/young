returned =
  begin
    value = 'return begin value'
    raise
  rescue
    value = 'return rescue value'
  else
    value = 'return else value'
  ensure
    value = 'not return'
  end
p returned
