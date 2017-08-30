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
    user_move
    dealer_move
  end

  def user_money_and_bet
    puts "You have $#{user.money - 10} and you bet $10"
  end

  def dealer
    @dealer
  end

  def user
    @user
  end

  def user_move
    # loop until you get a good answer and return
    while true
      print "User: Do you want to (h)it or (s)tand?"
      answer = gets.chomp.downcase
      if answer == " h" || answer == "h"
        puts "You hit!"
        2.times do
          user.hand << @deck.draw
        end

        hand = user.hand.length - 1
        hand_value = 0

        for i in 0..hand
          hand_value += user.hand[i].value
          # if hand_value > 11
          #   "A" = 1
          # elsif hand_value < 11
          #   "A" = 11
          # end
          puts "Card: #{user.hand[i].rank} #{user.hand[i].suit.upcase}"
        end
        puts "Your hand total is #{hand_value}"

        if hand_value > 21
          puts "Your hand total is #{hand_value}. You bust!"
          abort
        end

        dealer_move


      elsif answer == " s" || answer == "s"
        puts "You chose to stand. Your hand total is #{hand_value}"
        dealer_move
        true
      else
        false
        puts "That is not a valid answer!"
      end
    end
  end

  def dealer_move
    # loop until you get a good answer and return
    while true
      print "Dealer: Do you want to (h)it or (s)tand?"
      answer = gets.chomp.downcase
      if answer == " h" || answer == "h"
        2.times do
          @dealer.hand << @deck.draw
        end

        hand = dealer.hand.length - 1
        hand_value = 0

        for i in 0..hand
          hand_value += user.hand[i].value
          # if dealer.hand_value > 11
          #   dealer.hand[0].value = 1
          # elsif dealer.hand_value < 11
          #   dealer.hand[0].value = 11
          # end
          puts "Card: #{dealer.hand[i].rank} #{dealer.hand[i].suit.upcase}"
        end
        puts "The dealer's hand total is #{hand_value}"

        if hand_value > 21
          puts "Your hand total is #{hand_value}. You bust!"
          abort
        end

      elsif answer == " s" || answer == "s"
        puts "You chose to stand. Your hand total is #{hand_value}"
        true
      else
        false
        puts "That is not a valid answer!"
      end
    end
  end



  def ran_out_of_cards
    if @deck.cards_left == 0
      @deck = Deck.new
    end
  end


end
