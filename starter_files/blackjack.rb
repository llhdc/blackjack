require_relative 'deck'
require_relative 'game'
require_relative 'user'
require_relative 'dealer'

puts "Hello and welcome to the game of blackjack! Let's begin."

user = User.new
dealer = Dealer.new
deck = Deck.new
deck.shuffle


user.hand << user.draw * 2
dealer.hand << dealer.draw * 2


puts "Do you want to hit or stand?"
user_move = gets.chomp.to_s

if user_move == "H"
  user.hit
else
  user.stand
end
