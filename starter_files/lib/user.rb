require_relative 'deck'

class User
  def initialize
    @hand = []
    @money = 100
  end

  def hand
    @hand
  end

  def money
    @money
  end
end
