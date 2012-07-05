json.game do |json|   
  json.id game.id
  json.owner json.partial!("games/user", user: game.user)
  json.lastPlayer json.partial!("games/user", user: game.internet_players.last)
  json.lastMove game.game.moves.last
  json.ownerColor game.owner_color
  json.array!(game.game.board.pieces) do |json, piece|
    json.piece piece.to_s
    json.square piece.square
    json.color piece.color
  end
end
