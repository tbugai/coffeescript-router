blog_route = "/blog/:year/:month/:day"

describe "Router", ->
  it "should exist", ->
    expect(Router).not.toBeNull()
    
  describe "#buildRegexString", ->
    it "should build the regular expression correctly", ->
      expect(Router.buildRegexString(blog_route)).toEqual("\\/blog\\/(\\w*)\\/(\\w*)\\/(\\w*)")
  
  describe "#add", ->
    beforeEach ->
      Router.add blog_route, null
    
    it "should add a route to the routes array", ->
      expect(Router.routes.length).toBe(1)
    
    it "should find the three named params", ->
      expect(Router.routes[0].params.length).toBe(3)
      
  describe "#clear", ->
    beforeEach ->
      Router.add blog_route, null
    
    it "should clear out the routes array", ->
      Router.clear()
      expect(Router.routes.length).toBe(0)
  
  describe "#process", ->
    api = result = ""
    beforeEach ->
      api = {
        testCallBack: (params)->
          console.log "testCallBack"
      }
      spyOn(api, "testCallBack").andCallFake( (params)-> 
        result = params
      )
      
      Router.add blog_route, api.testCallBack
      Router.process("/blog/2012/01/01")
    
    it "should find the route and execute the callback", ->
      expect(api.testCallBack).toHaveBeenCalled()
      
    it "should execute the callback with the correct parameters", ->
      expect(result).toEqual({ year: "2012", month: "01", day: "01"})