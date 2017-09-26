require_relative "card"

class Deck
  def initialize
    @cards = []
    @ranks = Card::RANKS
    Card::SUITS.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def money
    @money
  end

  def cards_left
   @cards.length
  end

  def draw
   @cards.shift
  end

  def shuffle
   @cards = @cards.shuffle
  end

end
