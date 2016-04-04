class Card

  attr_accessor :suit, :rank, :id

  require_relative 'data'

  def initialize(value)
    @rank = RANKS.sample
    @suit = SUITS.sample
    @id = id
    self
  end

end