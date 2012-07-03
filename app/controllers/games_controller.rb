class GamesController < ApplicationController

  def index
    if @current_user || session[:net_move]
      @games = Game.find_internet_moves
    elsif @current_user
      puts 'here'
      @games = @current_user.games_to_move
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
      format.html # show.html.erb
      format.json # show.json.jbuilder
    end
  end
end
