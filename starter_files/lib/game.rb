require_relative 'deck'
require_relative 'user'
require_relative 'dealer'
require_relative 'card'

class Game
  def initialize
    @user = User.new([], 100)
    @dealer = Dealer.new([])
  end

  def new_deck
    @deck = Deck.new
    @deck.shuffle
  end

  def user_move
    # loop until you get a good answer and return
    while true
      print "Do you want to (h)it or (s)tand?"
      answer = gets.chomp.downcase
      if answer == "h"
        hit
      elsif answer == "s"
        true
      else
        false
      end
      puts "That is not a valid answer!"
    end
  end

  def user_hand
    puts "You have a #{user.hand[0]} and a #{user.hand[1]}. Your total is #{user.hand_value}."
  end


  def user_hand_value
    user.hand_value
  end

  def dealer
    @dealer
  end

  def user
    @user
  end

  def user_money_and_bet
    puts "You have #{user.money} and you bet $10"
  end

  def ran_out_of_cards
    if @deck.cards_left == 0
      @deck = Deck.new
    end
  end

  def hit
    # push drawn card to hand array
    user.hand
    dealer.hand
    2.times do
      user.hand << @deck.draw
      dealer.hand << @deck.draw
    end
  end
end
