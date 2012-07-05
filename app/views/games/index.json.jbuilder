json.array!(@games) do |json, game|
  json.partial! "games/game", game: game
end
