# Provide various functions for validating data
module Validation
  def self.str_is_integer?(str)
    return false if str.nil?

    str.match?(/^(\d)+$/)
  end

  def self.str_is_valid_yyy_mm_dd_date?(str)
    y, m, d = str.split("-")

    return false unless str_is_integer?(y) && y.length == 4
    return false unless str_is_integer?(m) && m.length == 2
    return false unless str_is_integer?(d) && d.length == 2

    Date.valid_date?(y.to_i, m.to_i, d.to_i)
  end
end
