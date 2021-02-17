# This version of classify properly checks each of 
# the inputs are individually valid.
def classify(side_a, side_b, side_c)
  # put the inputs into an array
  sides = [side_a, side_b, side_c]

  # are the individual inputs valid?
  sides.each do |side|
    return "invalid" unless side.is_a?(Numeric) && side.positive?
  end

  # sort the sides in the array
  sides.sort!

  # classify the type of triangle
  return "invalid" if sides[0] + sides[1] <= sides[2]
  return "equilateral" if sides[0] == sides[1] && sides[1] == sides[2]
  return "isoceles" if sides[0] == sides[1] || sides[1] == sides[2]

  "scalene"
end
