def recieve_block(&block)
  block.call
end

recieve_block do
  p "Hello, block!"
end

