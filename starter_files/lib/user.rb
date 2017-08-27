require_relative 'deck'

class User
  def initialize(hand, money)
    @hand = hand
    @money = money
    @hand_value = [].sum
  end

  def hand
    @hand
  end

  def hand_value
    if self.value == 1
      @user.hand_value = 11
    elsif self.value == 2..9
      @user.hand_value + 1
    elsif self.value == 10 || self.value == 11 || self.value == 12
      @user.hand_value
    end
  end

  def money
    @money
  end

  def hand_value
    @hand_value
  end

  def stand
    puts "You stand. Your total is #{hand}"
  end
end
