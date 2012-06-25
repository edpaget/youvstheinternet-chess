require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "should start game with default starting position if none provided" do
    test_game = FactoryGirl.create(:game)
    game = Game.new
    assert_equal test_game.board, game.board
  end

  test "should not save without having a valid move order" do
    game = Game.new( :moves => [['e1e4', 'e7e5']] )
    assert !game.save
  end

  test "should update or throw error if non-legal move" do
    game = FactoryGirl.create(:game)
    assert_nothing_raised do
      game.make_move( 'white' => 'e2e4' )
    end
  end

  test "should find and update game by id and move" do
    game = FactoryGirl.create(:game)
    Game.update_by_id_with_move game.id, 'a7a5'
  end


end
