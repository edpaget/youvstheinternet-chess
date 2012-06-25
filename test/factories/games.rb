FactoryGirl.define do
  factory :game do |game|
    moves = [['e2e4', 'e7e5'], ['g1f3', nil]]
    game.moves moves
    game.board Chess::Board.new(:game => moves).pieces
    game.to_move 'black'
  end
end

