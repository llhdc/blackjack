require_relative 'deck'
require_relative 'user'
require_relative 'dealer'

class Game
  def initialize(user, dealer)
    @user = User.new
    @dealer = Dealer.new
  end
  #what functionality do I put here?
end
