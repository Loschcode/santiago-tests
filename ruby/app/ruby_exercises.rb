class RubyExercise

  require 'pry'
  attr_reader :knight_tour

  def initialize(knight_tour=KnightTour.new)
    @knight_tour = knight_tour
  end

  def run

    # Exercise 1.
    puts 100.to_factorial_zeros

    # Exercise 2.
    puts 4506778.to_letters

    # Exercise 3.
    puts knight_tour.go(8,8)

    # binding.pry

  end

end
