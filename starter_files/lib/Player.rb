require_relative 'deck'

class Player
  attr_reader :hand, :money, :name
  def initialize(name)
    @hand = []
    @money = 100
    @name = name
    # @hand_value = 0
  end

  # def hand_value
  #   @hand_value
  # end

end
