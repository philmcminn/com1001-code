def classify(side1, side2, side3)
  # 1. sort the sides so that side1 < side2 < side3
  # (NOTE: "x, y = y, x" is an easy way to swap the values of
  # two variables in Ruby without needing a temporary variable)
  # side1, side2 = side2, side1 if side1 > side2
  # side1, side3 = side3, side1 if side1 > side3
  # side2, side3 = side3, side2 if side2 > side3

  # Somebody mentioned this as a potentially more elegant
  # way of sorting the sides in the lab. Good suggestion!
  # Essentially we leverage the sort method of arrays
  # in Ruby: we put the sides into the array, sort it,
  # then retrieve the values (now in order) back into
  # side1, side2, and side3.
  #
  # Note that this is functionally equivalent to the
  # code above that I've commmented out and does not
  # fix the bug.
  (side1, side2, side3) = [side1, side2, side3].sort

  # 2. classify the type of triangle
  #
  # Note that I have tidied up the structure in general
  # as well...
  return "invalid" if side1 + side2 <= side3
  return "equilateral" if side1 == side2 && side2 == side3
  return "isoceles" if side1 == side2 || side2 == side3

  "scalene"
end
