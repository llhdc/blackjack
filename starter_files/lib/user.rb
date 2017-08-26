require_relative 'deck'

class User
  def initialize(hand, money)
    @hand = hand
    @money = money
  end
  
  def money
    @money
  end

  def hit
    # push drawn card to hand array
    @hand = []
    self.hand << deck.draw
  end

  def stand
    puts "You stand. Your total is #{hand}"
  end
end
