describe 'WebChess.Routers.Router', ->
  it 'should be defined', ->
    expect(WebChess.Routers.Router).toBeDefined

  it 'should be instantiable', ->
    router = new WebChess.Routers.Router
    expect(router).not.toBeNull