require 'test_helper'

class GameTest < ActiveSupport::TestCase

  def setup
    @game = FactoryGirl.create(:game)
  end

  test "should create a new game from the params hash" do
    params = Hash.new
    params['owner_color'] = 'black'
    game = Game.from_params params
    assert_equal 'black', game.owner_color
  end

  test "should update or throw error if non-legal move" do
    assert_nothing_raised do
      @game.make_move 'a7a5' 
    end
  end

  test "should find and update game by id and move" do
    user = FactoryGirl.create(:user)
    assert_nothing_raised do
      Game.update_by_id_with_move_and_user @game.id, 'a7a5', user
    end
  end

  test "should return all games that have non-user moves to make" do
    games = Game.find_internet_moves
    assert_equal games.first.owner_color, @game.owner_color
  end

  test "should return true if it is the owner's turn to move" do
    assert(!@game.owners_move?)
    test_game = FactoryGirl.build(:game) do |game| 
      game.game = Chess::Game.new(:game => [['e2e4', 'c7c5']])
    end
    assert test_game.owners_move?
  end

end
