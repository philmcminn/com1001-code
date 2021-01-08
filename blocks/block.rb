def my_block(&block)
  puts "Hi!"
  block.call
  puts "That's all folks!"
end

my_block do
  puts "> This is being executed within"
  puts "> the my_block method"
end
