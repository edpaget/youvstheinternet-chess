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
        responseFixture = [ { id: 11, ownerColor: 'white', lastMove: 'e1e2', owner: {id: 12, name: 'Ed'}, lastPlayer: {id: 13, name: 'Tony'}, board: [{piece: 'King', square: 'e2', color: 'white'}, {piece: 'Pawn', square: 'e3', color: 'white'}, {piece: 'King', square: 'e7', color: 'black'}]}, { id: 12, ownerColor: 'black', lastMove: 'e7e6', owner: {id: 13, name: 'Tony'}, lastPlayer: {id: 12, name: 'Ed'}, board: [{piece: 'King', square: 'e2', color: 'white'}, {piece: 'Rook', square: 'd8', color: 'white'}, {piece: 'King', square: 'e6', color: 'black'}]}]
        
        beforeEach ->
          @server.respondWith('GET', '/games.json', [
            200,
            { 'content-type': 'application/json' },
            JSON.stringify(responseFixture)
          ])

          @games.fetch()
          @server.respond()

        describe 'loaded games collection', ->
          it 'loads all tasks', ->
            expect(@games.models.length).toEqual 2

          it 'parses tasks from response', ->
            expect(@games.get(11).get('ownerColor')).toEqual 'white'
            expect(@games.get(12).get('ownerColor')).toEqual 'black'
            expect(@games.get(11).get('board')[0].piece).toEqual 'King'
            
          
