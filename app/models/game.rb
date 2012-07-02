class Game
  include MongoMapper::Document

  key :owner_color, String
  key :game, Chess::Game
  key :owner_move, Boolean, :default => true

  belongs_to :user
  many :internet_players, :class_name => "User"

  def make_move(move)
    game.half_move move
    owner_move = owners_move?
  end

  def self.update_by_id_with_move_and_user(id, move, user)
    game = self.find_by_id(id)
    game.make_move move
    if user != game.user
      game.internet_players << user
    end
    game.save!
  end

  def self.from_params(params)
    create!(:owner_color => params['owner_color'],
            :game => Chess::Game.new,
            :owner_move => (params['owner_color'] == 'white'))
  end

  def self.find_internet_moves
    where( :owner_move => false )
  end

  def owners_move?
    owner_color == game.to_move
  end
end
