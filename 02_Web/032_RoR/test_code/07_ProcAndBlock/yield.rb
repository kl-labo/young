def recieve_block
  yield
end

recieve_block do
  p "Hello yield!"
end

