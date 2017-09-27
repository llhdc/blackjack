require_relative 'deck'

class Player
  attr_accessor :hand, :money, :name
  def initialize(name)
    @hand = []
    @money = 10
    @name = name
  end

  def empty_hand
    @hand = []
  end

  def user_money_in_hand(player)
    sleep 1.0
    puts "The User has $#{player.money} dollars to bet with."
    puts "\n"
    if player.money <= 0
      puts "The User ran out of money!\n\n"
      sleep 1.0
      puts "G"
      sleep 0.9
      puts "A"
      sleep 0.5
      puts "M"
      sleep 0.4
      puts "E"
      sleep 2
      puts "\nO V E R\n"
      sleep 0.7
      puts "\n\n\n\n\n:)\n\n\n\n\n\n"
      sleep 3
      puts "Hello Michael.\n\n\n\n\n" 
      sleep 3
      puts "This is God, speaking.\n\n\n\n\n"
      sleep 4
      puts "What?\n\n\n\n\n\n\n\n\n\n"
      sleep 3
      puts "Y...Yes. It's\n\n\n\n\n\n\n\n\n\n"
      sleep 2
      puts "ME!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n\n\n\n"
      sleep 0.8
      puts "Nice shirt. Tee hee."
      exit
    end
  end

  def money_walks
    self.money -= 10
  end

  def money_talks
    self.money += 10
  end

end
