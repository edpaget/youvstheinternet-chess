describe 'WebChess.Models.Game', ->

  it 'should be defined', ->
    expect(WebChess.Models.Game).toBeDefined()

  it 'can be instantiated', ->
    game = new WebChess.Models.Game
    expect(game).not.toBeNull()

