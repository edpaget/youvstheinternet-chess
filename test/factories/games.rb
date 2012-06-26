FactoryGirl.define do
  factory :game do |game|
    game.game Chess::Game.new(:game => [['e2e4', 'c7c5'], ['g1f3', nil]])
    game.owner_color 'white'
  end
end

