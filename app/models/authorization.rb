class Authorization
  include MongoMapper::Document

  belongs_to :user

  key :uid, String, :required => true
  key :provider, String, :required => true

  def self.find_by_hash(hash)
    find_by_provider_and_uid hash['provider'], hash['uid']
  end

  def self.create_from_hash(hash, user=nil)
    user ||= User.create_from_hash(hash)
    user.authorizations.create(:uid => hash['uid'], :provider => hash['povider'])
  end

end
