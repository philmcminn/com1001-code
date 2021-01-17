def string_comparison(str1, str2)
  (1..[str1.length, str2.length].min).each do |i|
    puts "Comparing #{str1[i]} with #{str2[i]}"
    return i if str1[i] != str2[i]
  end

  puts "Loop terminated with everything identical"
  -1
end
