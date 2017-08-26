require_relative 'lib/deck'
# require_relative 'lib/game'
require_relative 'lib/user'
require_relative 'lib/dealer'

# Game.new
puts "Hello and welcome to the game of blackjack! Let's begin."

user = User.new([], 100)
puts "You have #{user.money} and bet $10"

dealer = Dealer.new([])

deck = Deck.new
deck.shuffle


user.hand << user.draw * 2
puts "You have a #{user.hand[0].to_i} and a #{user.hand[1].to_i}. Your total is #{user.hand.sum}"
dealer.hand << dealer.draw * 2
# #
# #
# # puts "Do you want to hit or stand?"
# # user_move = gets.chomp.to_s
# #
# # if user_move == "H"
# #   user.hit
# # else
# #   user.stand
# # end
