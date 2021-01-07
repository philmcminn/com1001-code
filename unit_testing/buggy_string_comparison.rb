def string_comparison(str1, str2)
  for i in 1..[str1.length, str2.length].max - 1
    return i if str1[i] != str2[i]
  end
  -1
end
