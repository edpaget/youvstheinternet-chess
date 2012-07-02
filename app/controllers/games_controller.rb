
class GamesController < ApplicationController
  def index
    if session[:net_move]
      @games = Game.find_internet_moves
    elsif @current_user
      @games = User.moves_for_user_id @current_user
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder
    end
  end

  def create
    if @current_user
      @game = Game.from_params params
      @current_user.games << @game
      @current_user.save!
    end
    redirect_to @game
  end

  def update
    @game = Game.update_by_id_with_move_and_user(params[:id], params[:move], @current_user)
    redirect_to @game
  end

  def show
    @game = Game.find_by_id(params[:id])
    respond_to do |format|
      format.html # game.html.erb
      format.json # game.json.jbuilder
    end
  end
end
