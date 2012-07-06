describe 'WebChess.Views.Games', ->
  it 'should be defined', ->
    expect(WebChess.Views.Games).toBeDefined

  it 'should be instantiable', ->
    games = new WebChess.Views.Games
    expect(games).not.toBeNull

  beforeEach ->
    @games = new WebChess.Collections.Games { games:
      [ { id: 12, ownerColor: 'white', lastPlayer: { id: 16, name: 'Tony' } },
        { id: 13, ownerColor: 'black', lastPlayer: { id: 16, name: 'Tony' } } ] 
    }
    @gamesList = new WebChess.Views.Games { games: @games }
    @gamesList.render()

  describe '#render', ->
    it 'should have a link to the game\'s page', ->
      link = $(@gamesList.el).find('table a')
      expect(link.attr('href')).toBe '#games/12'
      