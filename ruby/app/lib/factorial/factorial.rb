module Factorial

  # Number of zeros with n!
  def to_factorial_zeros

    n = self
    return 0 unless n > 0
    ((n /= 5) + n.to_factorial_zeros)

  end

end

class Integer
  include Factorial
end