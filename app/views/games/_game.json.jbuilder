json.id game.id
json.ownerColor game.owner_color
json.lastMove game.game.moves.last
json.owner { |json| json.partial!("games/user", user: game.user) }
json.lastPlayer { |json| json.partial!("games/user", user: game.internet_players.last) }
json.board do |json|
  json.array!(game.game.board.pieces) do |json, piece|
    json.piece piece.to_s
    json.square piece.square
    json.color piece.color
  end
end
