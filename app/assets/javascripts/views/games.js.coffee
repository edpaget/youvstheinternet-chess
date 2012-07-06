class WebChess.Views.Games extends Backbone.View
  initialize: ->
    @games = @options.games
    @template = JST['templates/games']

  render: ->
    $(@el).html(@template)