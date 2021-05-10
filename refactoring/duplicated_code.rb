def add_average_width_and_height(widths, heights)
  # get the average of the widths
  sum_widths = 0
  widths.each do |i|
    sum_widths += i
  end
  average_widths = sum_widths / widths.length

  # get the average of the heights
  sum_heights = 0
  heights.each do |i|
    sum_heights += i
  end
  average_heights = sum_heights / heights.length

  # add and return
  average_widths + average_heights
end
