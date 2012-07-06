class WebChess.Views.Board extends Backbone.View

  initialize: ->
    @template = JST['templates/game']
    @game = @options.game

  render: ->
    $(@el).html(@template)
    this.placePieces()

  placePieces: ->
    if @game.hasChanged
      @game.fetch
    this.setPiece piece for piece in @game.get('board')

  setPiece: (piece) ->
    square = "#" + piece.square

    switch piece.piece
      when 'King' then pieceCode = 9812
      when 'Queen' then pieceCode = 9813
      when 'Bishop' then pieceCode = 9815
      when 'Knight' then pieceCode = 9816
      when 'Rook'  then pieceCode = 9814
      when 'Pawn' then pieceCode = 9817

    if piece.color == 'black' then pieceCode = pieceCode + 6
    if piece.color == 'black' then console.log pieceCode
    pieceCode = "&#" + pieceCode + ";"

    $(@el).find(square).append "<p>" + pieceCode + "</p>"
