class Game
  include MongoMapper::Document

  key :last_players, Hash
  key :owner_color, String
  key :to_move, String
  key :game, Chess::Game

  belongs_to :user

  validate :valid_moves

  def valid_moves
    if !(Chess.valid_moves? moves)
      errors.add( :moves, "There are non-legal chess moves")
    end
  end

  def make_move(move)
    game = Chess::Board.new( :game => moves )
    game.move move
    if move.key? 'white'
      moves.push [move[:white], nil]
    elsif move.key? 'black'
      moves.last[1] = move[:black]
    end
  end


end
