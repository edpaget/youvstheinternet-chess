describe "WebChess.Views.Board", ->
  it 'should be defined', ->
    expect(WebChess.Views.Board).toBeDefined

  it 'should be instantiable', ->
    board = new WebChess.Views.Board
    expect(board).not.toBeNull
      
  beforeEach ->
    @game = new WebChess.Models.Game { board: [ {piece: 'King', color: 'white', square: 'e2' },
                                                {piece: 'King', color: 'black', square: 'e8' } ]}

    @board = new WebChess.Views.Board({ game: @game })
    @template = @board.render()

  describe '#render', ->

    it 'should have the rank and file on each div', ->
      div = $(@board.el).find('#e2')
      expect(div.html()).not.toBeNull

    it 'should place pieces', ->
      div = $(@board.el).find('#e2')
      expect(div.text()).toBe "♔"
      div = $(@board.el).find('#e8')
      expect(div.text()).toBe "♚"

