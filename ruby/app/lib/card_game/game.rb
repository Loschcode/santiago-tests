class Game

  require_relative 'deck'
  require_relative 'card'
  require_relative 'player'
  
  attr_accessor :decks, :players, :title

  def initialize(title)
    puts "Here begins our game of #{title}"
    @title = title
    @players = []
    @decks = []
  end

  def add_deck(cards_in_deck=51)
    puts "We add a deck of #{cards_in_deck} cards"
    @decks << Deck.new(cards_in_deck)
    self
  end

  def add_player(name, cards_in_hand=5)
    puts "We add a player with #{cards_in_hand} cards in hand"
    @players << Player.new(cards_in_hand)
    self
  end

end