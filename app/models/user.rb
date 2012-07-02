class User
  include MongoMapper::Document

  key :name, String
  key :email, String, :required => true

  many :games
  many :authorizations

  def self.create_from_hash(hash)
    if hash['provider'] == 'browser_id'
      create( :email => hash['uid'] )
    end
  end

  def games_to_move
    games.select { |game| game.owners_move? }
  end

  def self.moves_for_user_id(id)
    user = find_by_id id
    user.games_to_move
  end
end
