require_relative 'lib/game'

puts "Hello and welcome to the game of blackjack! Let's begin."
game = Game.new

game.start



# until loop for rounds
until game.user.money == 0
end
