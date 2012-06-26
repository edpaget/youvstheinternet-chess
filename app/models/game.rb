class Game
  include MongoMapper::Document

  key :last_players, Hash
  key :owner_color, String
  key :game, Chess::Game

  belongs_to :user

  def make_move(move)
    game.half_move move
  end

  def self.update_by_id_with_move(id, move)
    game = self.find_by_id(id)
    game.make_move move
  end

end
