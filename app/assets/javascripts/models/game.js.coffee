class WebChess.Models.Game extends Backbone.Model
  defaults:
    lastMove: ''
    ownerColor: 'white'

  url: ->
    if this.isNew() then '/games.json' else '/games/' + @id + '.json'

  initialize: ->

  toJSON: ->
    game:
      lastMove: @attributes.lastMove
      lastPlayer: @attributes.lastPlayer
      ownerColor: @attributes.ownerColor
