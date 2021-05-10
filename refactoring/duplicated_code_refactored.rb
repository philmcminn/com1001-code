def add_average_width_and_height(widths, heights)
  average(widths) + average(heights)
end
  
def average(x)
  sum_x = 0
  x.each do |i|
    sum_x += i
  end
  sum_x / x.length  
end
