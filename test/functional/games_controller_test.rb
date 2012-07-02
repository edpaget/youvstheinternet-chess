require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  def setup 
    @game = FactoryGirl.create(:game)
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get game" do
    get :show, :id => @game.id
    assert_response :success
  end

  test "should create new games" do
    assert_difference('Game.count') do
      post :create
    end
    assert_redirected_to game_path(assigns(:game))
  end

  test "should update games with move" do
    put :update, :id => @game.id, :move => 'd7d6'
    assert_redirected_to game_path(assigns(:game))
  end

end
