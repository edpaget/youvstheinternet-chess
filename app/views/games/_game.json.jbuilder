json.game do |json|
  json.last_player json.partial!("games/user", user: game.internet_players.last)
  json.last_move game.game.moves.last
  json.array!(game.game.board.pieces) do |json, piece|
    json.piece piece.to_s
    json.square piece.square
    json.color piece.color
  end
end
