## CARD GAME (Diseño)

>2.­ Diseñe un mazo de cartas (orientado a objetos) con propiedades y métodos básicos que considere para ser utilizado en distintas aplicaciones que utilicen cartas.

Simple but flexible game. You can create a new game, have multiple players and multiple decks and setup whatever you want, you can also tell how many cards a player / a deck got and pick cards from the deck. What I didn't code (like throwing away a card, removing it randomly) are basic Ruby methods that don't need any layer on it.

Example 1 :

```
game = Game.new("Double Deck Game")
game.add_deck(30) # Add a deck with 30 random cards
game.add_deck # Add another deck with the default number of cards
game.add_player("Laurent").add_player("Roberto") # Chaining possible pretty much everywhere it's useful
game.players.first.pick(game.decks.last) # Pick a card from the last deck
game.players.first.give(game.decks.first) # Give a card to the first deck
game.players.last.cards.pop # Throw away the last card
```

Example 2 :

```
game = Game.new("Fast Party").add_deck.add_player("Laurent", 5).add_player("José", 8) # Setup
game.players.first.pick(game.decks.first) # Pick from a player
game.players.last.give(game.decks.first) # Give from another player
game.decks.first.cards.size # Size of the first deck
```