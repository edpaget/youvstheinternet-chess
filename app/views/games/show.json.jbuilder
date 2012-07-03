json.user json.partial! "games/user", user: current_user if current_user
json.partial! "games/game", game: @game