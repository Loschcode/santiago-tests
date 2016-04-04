class Player

  attr_accessor :cards, :name

  def initialize(number_cards)
    @cards = (1..number_cards).to_a.shuffle.collect { |n| Card.new(n) }
  end

  def pick(deck)
    @cards << deck.cards.shift
    self
  end

  def give(deck)
    deck.cards << @cards.shift
    self
  end

end