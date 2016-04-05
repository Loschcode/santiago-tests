class Deck

  attr_accessor :cards

  def initialize(number_cards)
    @cards = (1..number_cards).to_a.shuffle.map { |n| Card.new(n) }
  end

end
