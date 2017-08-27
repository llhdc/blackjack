require_relative 'deck'

class Dealer
  def initialize(hand)
    @hand = hand
  end

  def hand
    @hand
  end

  def stand

  end

  def dealer_move
    rand
  end
end
