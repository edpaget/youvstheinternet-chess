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
    this.setPiece piece for piece in @game.board

  setPiece: (piece) ->
    square = "#" + piece.square

    switch piece.piece
      when 'King' then pieceCode = 9812
      when 'Queen' then pieceCode = 9813
      when 'Bishop' then pieceCode = 9815
      when 'Knight' then pieceCode = 9816
      when 'Rook'  then pieceCode = 9814
      when 'Pawn' then pieceCode = 9817

    if piece.color == 'black' then pieceCode + 6
    pieceCode = "&#" + pieceCode + ";"

    $(@el).find(square).text pieceCode
