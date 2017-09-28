require 'pry'
require_relative 'deck'
require_relative 'player'
require_relative 'card'
require 'byebug'

class Game
  attr_reader :user, :dealer
  def initialize
    @user = Player.new('User')
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.shuffle
  end

  def start
    puts "Hello and welcome to the game of blackjack! Let's begin."
    user_money_and_bet(user)
    sleep 0.9
    draw(@user)
    puts "\n"
    draw(@dealer)
    puts "\n"
    play(@user, @dealer)
  end

  def replay
    @deck = Deck.new
    @deck.shuffle
    @user.empty_hand()
    @dealer.empty_hand()
    puts "\n"
    @user.user_money_in_hand(@user)
    start
  end

  def show_hand(player)
    player.hand.each do |card|
      puts "#{card.rank.to_s} of #{card.suit.to_s.upcase}"
    end
    puts "The #{player.name}'s hand total is #{hand_value(player)}"
  end

  def empty_hand(player)
    player.hand = []
  end

  def draw(player)
    2.times do
      player.hand << @deck.draw
    end
    sleep 0.7
    show_hand(player)
    if hand_value(player) == 21
      you_win(player)
    end
  end

  def play(user, dealer)
    def dealer_move(dealer)
      until player_busts(dealer) || self.hand_value(dealer) == 21
        print "#{dealer.name}: Do you want to (h)it or (s)tand?\n"
        answer = gets.chomp.strip.downcase
        if answer == "h"
          sleep 0.7
          puts "\nThe dealer hit!"
          puts "\n"
          sleep 2
          1.times do
            dealer.hand << @deck.draw
          end
          dealer.hand.each do |card|
            puts "#{card.rank.to_s} of #{card.suit.to_s.upcase}"
          end
          puts "\n"
          puts "The dealer's hand total is #{hand_value(dealer)}"
          puts "\n"

          if hand_value(dealer) == 21
            you_win(dealer)
            @user.money_walks
            replay
          end

        elsif answer == "s"
          sleep 0.7
          puts "\nThe dealer chose to stand. The dealer's hand total is #{hand_value(dealer)}."
          user_defeats_dealer?(user, dealer)
        else
          puts "\nThat is not a valid answer!"
          false
        end
      end
    end

    until player_busts(user) || self.hand_value(user) == 21
      print "#{user.name}: Do you want to (h)it or (s)tand?\n"
      answer = gets.chomp.strip.downcase
      if answer == "h"
        sleep 0.7
        puts "\nYou hit!"
        puts "\n"
        1.times do
          user.hand << @deck.draw
        end
        user.hand.each do |card|
          puts "#{card.rank.to_s} of #{card.suit.to_s.upcase}"
        end
        puts "\n"
        puts "Your hand total is #{hand_value(user)}\n"
        puts "The dealer's hand total is #{hand_value(dealer)}"
        puts "\n"

        if hand_value(user) == 21
          you_win(user)
        end

      elsif answer == "s"
        sleep 0.7
        puts "\nYou chose to stand. Your hand total is #{hand_value(user)}."
        dealer_move(dealer)
        true
      else
        puts "\nThat is not a valid answer!"
        false
      end
    end
  end

  def user_money_and_bet(player)
    puts "You have $#{player.money - 10} and you bet $10."
  end

  def player_busts(player)
    if hand_value(player) > 21 && player.name == "Dealer"
      print "The #{player.name} busted! "
      @user.money_talks
      you_lose(player)
    elsif hand_value(player) > 21 && player.name == "User"
      print "The #{player.name} busted! "
      you_lose(player)
    end
  end

  def check_if_tie(user, dealer)
    hand_value(user) == hand_value(dealer)
    puts "You tied!"
    replay()
  end

  def user_defeats_dealer?(user, dealer)
    if hand_value(user) > hand_value(dealer) && hand_value(user) < 21
      you_win(user)
    elsif hand_value(user) == hand_value(dealer)
      check_if_tie(user, dealer)
    else
      you_lose(user)
    end
  end

  def hand_value(player)
    player.hand.reduce(0) do |total, card|
      if card.rank == :J || card.rank == :Q || card.rank == :K
        total + 10
      elsif card.rank == :A
        if total > 10
          total + 1
        else
          total + 11
        end
      else
        total + card.rank
      end
    end
  end

  def you_win(player)
    puts "The #{player.name} wins!"
    player.money_talks
    replay()
  end

  def you_lose(player)
    puts "The #{player.name} loses!"
    player.money_walks
    replay()
  end
end
