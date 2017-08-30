require_relative 'deck'

class User
  def initialize
    @hand = []
    @money = 100
    # @hand_value = 0
  end

  def hand
    @hand
  end

  def money
    @money
  end

  # def hand_value
  #   @hand_value
  # end

end
