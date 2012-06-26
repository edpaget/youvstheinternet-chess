FactoryGirl.define do
  factory :game do
    game Chess::Game.new(:game => [['e2e4', 'c7c5'], ['g1f3', nil]])
    owner_color 'white'
    owner_move false
  end
end

