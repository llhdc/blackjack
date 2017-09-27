require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/deck'
require_relative '../lib/card'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @user = Player.new('User')
    @dealer = Player.new('Dealer')
    @deck = Deck.new
    @deck.shuffle
  end

  def test_user_starts_with_100_dollars
    assert_equal 100, @game.user.money
  end

  def test_user_money_bets_and_cedes_10_dollars
    assert_output "You have $90 and you bet $10.\n"  do
      @game.user_money_and_bet(@user)
    end
  end

  def test_deck_draws
    @user.hand << @deck.draw
    assert @user.hand.length == 1 # check if card is present in user's hand after draw
  end

  def test_player_draw
    @game.draw(@user)
    assert @user.hand.length == 2
  end

  def test_show_hand
    a_of_clubs = Card.new(Card::RANKS[0], Card::SUITS[0])
    @user.hand.push(a_of_clubs)
    assert_output "A of CLUBS\nYour hand total is 11\n" do
      @game.show_hand(@user)
    end
  end

  def test_hand_value
    a_of_spades = Card.new(Card::RANKS[0], Card::SUITS[3])
    a_of_hearts = Card.new(Card::RANKS[0], Card::SUITS[2])
    a_of_clubs = Card.new(Card::RANKS[0], Card::SUITS[0])
    @user.hand.push(a_of_spades, a_of_hearts, a_of_clubs)
    assert @user.hand.length == 3
    assert @game.hand_value(@user) == 13
  end

  def test_bust?
    7.times do
      @user.hand << @deck.draw
    end
    assert @game.bust?(@user)
  end

  def test_tie
    a_of_spades = Card.new(Card::RANKS[0], Card::SUITS[3])
    k_of_hearts = Card.new(Card::RANKS[12], Card::SUITS[2])
    @user.hand.push(a_of_spades, k_of_hearts)
    @dealer.hand.push(a_of_spades, k_of_hearts)
    @game.tie?(@user, @dealer)
  end

  def test_user_defeats_dealer(user, dealer)?\n
    a_of_spades = Card.new(Card::RANKS[0], Card::SUITS[3])
    k_of_hearts = Card.new(Card::RANKS[12], Card::SUITS[2])
    six_of_hearts = Card.new(Card::RANKS[5], Card::SUITS[2])
    @user.hand.push(a_of_spades, k_of_hearts, six_of_hearts)
    @dealer.hand.push(a_of_spades, k_of_hearts)
    assert user_defeats_dealer(user, dealer)
  end

end
