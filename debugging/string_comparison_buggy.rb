def string_comparison(str1, str2)
  (1..[str1.length, str2.length].min).each do |i|
    return i if str1[i] != str2[i]
  end
  -1
end
