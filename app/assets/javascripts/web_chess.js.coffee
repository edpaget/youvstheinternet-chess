window.WebChess =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    app = new WebChess.Routers.Router
    Backbone.history.start()

$(document).ready ->
  WebChess.init()
