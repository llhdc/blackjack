require 'pry'
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
    user_move
    dealer_move
    if hand_value(user) == 21
      puts "You win!"
    elsif hand_value(dealer) == 21
      puts "Dealer wins!"
    elsif hand_value(user) > hand_value(dealer) && hand_value(user) < 21
      puts "You win"
    elsif hand_value(dealer) > hand_value(user) && hand_value(dealer) < 21
      puts "Dealer wins!"
    end
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
    print "User: Do you want to (h)it or (s)tand?"
    answer = gets.chomp.downcase
    if answer == " h" || answer == "h"
      puts "You hit!"
      2.times do
        user.hand << @deck.draw
      end

      user.hand.each do |card|
        puts "#{card.rank.to_s} of #{card.suit.to_s.upcase}"
      end
      # puts "Card: #{user.hand.rank} #{user.hand.suit.upcase}"

      puts "Your hand total is #{hand_value(user)}"

      if hand_value(user) > 21
        puts "Your hand total is #{hand_value(user)}. You bust!"
        abort
      end


    elsif answer == " s" || answer == "s"
      puts "You chose to stand. Your hand total is #{hand_value(user)}"
      dealer_move
      true
    else
      false
      puts "That is not a valid answer!"
    end
  end

  def dealer_move
    # loop until you get a good answer and return
    print "Dealer: Do you want to (h)it or (s)tand?"
    answer = gets.chomp.downcase
    if answer == " h" || answer == "h"
      2.times do
        @dealer.hand << @deck.draw
      end

      # puts "Card: #{dealer.hand[i].rank} #{dealer.hand[i].suit.upcase}"

      puts "The dealer's hand total is #{hand_value(dealer)}"



      if hand_value(dealer) > 21
        puts "Your hand total is #{hand_value(dealer)}. You bust!"
        abort
      end

    elsif answer == " s" || answer == "s"
      puts "You chose to stand. Your hand total is #{hand_value(dealer)}"
      user_move
      true
    else
      false
      puts "That is not a valid answer!"
    end
  end

  def hand_value(player)
    player.hand.reduce(0) do |acc, num|
      if num.rank.to_s == "J" || num.rank.to_s == "Q" || num.rank.to_s == "K"
        acc + 10
      elsif num.rank.to_s == "A"
        acc + 11
      else
        acc + num.rank
      end
    end
  end

  def ran_out_of_cards
    if @deck.cards_left == 0
      @deck = Deck.new
    end
  end
end
