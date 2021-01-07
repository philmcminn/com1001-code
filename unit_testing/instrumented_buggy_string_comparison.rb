def string_comparison(str1, str2)
  for i in 1..[str1.length, str2.length].max - 1
    puts "Comparing #{str1[i]} with #{str2[i]}"
    return i if str1[i] != str2[i]
  end

  puts "Loop terminated with everything identical"
  -1
end
