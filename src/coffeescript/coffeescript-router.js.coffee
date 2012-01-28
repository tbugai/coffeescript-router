class Router
  @routes = []
  constructor: ->
    console.log "should never get here"
    
  @buildRegexString: (path) ->
    path.replace(/\//g, "\\/").replace(/:(\w*)/g,"(\\w*)")
  
  @add: (path, func) ->
    @routes.push {
      params: path.match(/:(\w*)/g)
      regex: new RegExp(@buildRegexString(path))
      callback: func
    }
    
  @clear: ->
    @routes = []
    
  @process: (url = window.location.pathname) ->
    for route in @routes
      results = url.match(route.regex)  
      if results?
        index = 1
        namedParams = {}
        if route.params?
          for name in route.params
            namedParams[name.slice(1)] = results[index++]
        route.callback(namedParams)
        return
    
window.Router = Router