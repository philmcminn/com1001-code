def classify(side1, side2, side3)
  # 1. sort the sides so that side1 < side2 < side3
  # (NOTE: "x, y = y, x" is an easy way to swap the values of
  # two variables in Ruby without needing a temporary variable)
  side1, side2 = side2, side1 if side1 > side2
  side1, side3 = side3, side1 if side1 > side3
  side2, side3 = side3, side2 if side2 > side3

  # 2. classify the type of triangle
  type = "invalid"

  if side1 + side2 > side3
    type = "scalene"
    if side1 == side2
      type = "equilateral" if side2 == side3
    elsif side2 == side3
      type = "isosceles"
    end
  end

  type
end
