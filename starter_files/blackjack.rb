require_relative 'lib/game'

puts "Hello and welcome to the game of blackjack! Let's begin."
game = Game.new

def start(game)
  game.user_money_and_bet
  game.user_hand_value
end

start(game)
game.new_deck
game.hit
game.user_hand
game.user_hand_value
game.user_move


# until loop for rounds
until game.user.money == 0
end
