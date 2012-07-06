class WebChess.Routers.Router extends Backbone.Router
  routes: 
    "game/:id" : "game",
    ""          : "index",
    "game/new" : "new", 

  game: (id) ->
    game = new WebChess.Models.Game { id: id }
    game.fetch {
      success: (model) ->
        board = new WebChess.Views.Board { game: model, el: $('#board') }
        board.render()
      error: ->
        window.location.hash = '#'
    }

  index: ->
    games = new WebChess.Collections.Games
    games.fetch {
      success: (collection) ->
        games_list = new WebChess.Views.Games { games: collection, el: $('#games') }
        games_list.render()
      error: ->
        window.location.hash = '#'
    }

  new: ->
    new WebChess.Views.NewGame