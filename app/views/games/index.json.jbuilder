json.user json.partial! "games/user", user: current_user if current_user
json.array!(@games) do |json, game|
  json.partial! "games/game", game: game
end
