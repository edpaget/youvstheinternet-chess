describe 'WebChess.Models.Game', ->
  it 'should be defined', ->
    expect(WebChess.Models.Game).toBeDefined()

  it 'should be instantiable', ->
    game = new WebChess.Models.Game
    expect(game).not.toBeNull()

  beforeEach ->
    @game = new WebChess.Models.Game

  describe '#toJSON', ->
    it 'should only send the last move, last player, and owner color to server', ->
      @game.set(
        lastMove: 'e2e4'
        lastPlayer: 78
        ownerColor: 'white'
      )
      params = @game.toJSON()

      expect(params.game).toBeDefined()
      expect(params.game.lastMove).toEqual 'e2e4'
      expect(params.game.lastPlayer).toEqual 78
      expect(params.game.ownerColor).toEqual 'white'

  describe '#save', ->
    beforeEach ->
      @server = sinon.fakeServer.create()

    afterEach ->
      @server.restore()

    it 'sends valid data to server', ->
      @game.save(
        lastMove: 'e2e4'
        lastPlayer: 78
        ownerColor: 'white'
      )
      request = @server.requests[0]
      params = JSON.parse(request.requestBody)
        
      expect(params.game).toBeDefined()
      expect(params.game.lastMove).toEqual 'e2e4'
      expect(params.game.lastPlayer).toEqual 78
      expect(params.game.ownerColor).toEqual 'white'

    describe 'request', ->
      describe 'on create', ->
        beforeEach ->
          @game.id = null
          @game.save()
          @request = @server.requests[0]

        it 'should use POST', ->
          expect(@request.method).toEqual 'POST'

        it 'should use async', ->
          expect(@request.async).toBeTruthy

        it 'should use the right URL', ->
          expect(@request.url).toEqual '/games.json'

      describe 'on update', ->
        beforeEach ->
          @game.id = 42
          @game.save()
          @request = @server.requests[0]

        it 'should use PUT', -> 
          expect(@request.method).toEqual 'PUT'

        it 'should use async', ->
          expect(@request.async).toBeTruthy

        it 'should use the right URL', ->
          expect(@request.url).toEqual '/games/42.json'