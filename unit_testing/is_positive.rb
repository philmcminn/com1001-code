def positive?(x)
  return true if x > 0

  false
end

puts positive?(3)
puts positive?( 0)
puts positive? -1
