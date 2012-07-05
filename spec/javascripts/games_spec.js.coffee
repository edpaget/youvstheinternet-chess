describe 'WebChess.Collections.Games', ->
  it 'should be defined', ->
    expect(WebChess.Collections.Games).toBeDefined

  it 'should be instantiable', ->
    games = new WebChess.Collections.Games
    expect(games).not.toBeNull

  beforeEach ->
    @games = new WebChess.Collections.Games

  describe '#fetch', ->
    beforeEach ->
      @server = sinon.fakeServer.create()

    afterEach ->
      @server.restore()

    describe 'request', ->
      beforeEach ->
        @games.fetch()
        @request = @server.requests[0]

      it 'should use get', ->
        expect(@request.method).toEqual 'GET'

      it 'should be async', ->
        expect(@request.async).toBeTruthy

      it 'should use url', ->
        expect(@request.url).toEqual '/games.json'

      describe 'on success', ->
        responseFixture = { games: [