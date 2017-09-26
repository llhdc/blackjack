require 'pry'
require_relative 'deck'
require_relative 'player'
require_relative 'card'

class Game
  attr_reader :user
  def initialize
    @user = Player.new('User')
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.shuffle
  end

  def user_money_and_bet(player)
    puts "You have $#{player.money - 10} and you bet $10."
  end

  def bust?(player)
    hand_value(player) > 21
  end

  def tie?(user, dealer)
    hand_value(user) == hand_value(dealer)
  end

  def defeats?
    if hand_value(user) > hand_value(dealer) && hand_value(user) < 21
      you_win
    else
      you_lose
    else
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

  def you_win
    puts "You win!"
  end

  def you_lose
    puts "You lose!"
  end
end
