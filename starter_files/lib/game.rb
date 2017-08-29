require_relative 'deck'
require_relative 'user'
require_relative 'dealer'
require_relative 'card'

class Game
  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @deck.shuffle
  end

  def start
    user_money_and_bet
    user_hand
    hit
    user_move
  end

  def user_move
    # loop until you get a good answer and return
    while true
      print "Do you want to (h)it or (s)tand?"
      answer = gets.chomp.downcase
      if answer == " h" || answer == "h"
        hit
        # create a 'show_hand' method that will dynamically show cards in hand
      elsif answer == " s" || answer == "s"
        stand
        true
      else
        false
        puts "That is not a valid answer!"
      end
    end
  end


  def user_hand_value
    user.hand_value
  end

  def user_hand
    puts user.hand
  end

  def dealer
    @dealer
  end

  def user
    @user
  end

  def user_money_and_bet
    puts "You have #{user.money - 10} and you bet $10"
  end

  def hit
    # push drawn card to hand array
    2.times do
      @dealer.hand << @deck.draw
      @user.hand << @deck.draw
    end

    hand = user.hand.length - 1
    hand_value = 0

    for i in 0..hand
      hand_value += user.hand[i].value
      puts "#{user.hand[i].rank} #{user.hand[i].suit.upcase}"
    end
    puts "Your hand total is #{hand_value}"
  end

  def ran_out_of_cards
    if @deck.cards_left == 0
      @deck = Deck.new
    end
  end


end
