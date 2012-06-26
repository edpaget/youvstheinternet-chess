require 'test_helper'

class GameTest < ActiveSupport::TestCase

  def setup
    @game = FactoryGirl.create(:game)
  end

  test "should update or throw error if non-legal move" do
    assert_nothing_raised do
      @game.make_move 'a7a5' 
    end
  end

  test "should find and update game by id and move" do
    Game.update_by_id_with_move @game.id, 'a7a5'
  end

  test "should return all games that have non-user moves to make" do
  end


end
