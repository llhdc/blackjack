require_relative 'deck'

class Dealer
  def initialize(hand)
    @hand = hand
  end

  def hit
    # push drawn card to hand array
    @hand = []
    self.hand << deck.draw
  end

  def stand

  end

  def dealer_move
    rand
  end
end
