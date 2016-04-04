
require_relative '../../../app/lib/card_game/game.rb'

RSpec.describe Game do

  context "make a game" do

    it "should setup a game without error" do

      expect{
        Game.new("Fast Party").add_deck.add_player("Laurent", 5).add_player("Jose", 8)
      }.to_not raise_exception

    end

    it "should pick a card and change the number in the deck" do

      g = Game.new("Another Party").add_deck(30).add_player("Jose", 8)
      g.players.first.pick(g.decks.first)

      expect(g.decks.first.cards.size).to eq(29)

    end

  end

end