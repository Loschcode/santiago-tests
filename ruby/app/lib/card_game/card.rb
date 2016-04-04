class Card

  attr_accessor :suit, :rank, :value

  require_relative 'data'

  def initialize(value)
    @rank = RANKS.sample
    @suit = SUITS.sample
    @value = value
    self
  end

end