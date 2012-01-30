# CoffeeScript Router

A standalone router written in CoffeeScript that anyone can use in their web apps.  It uses Ruby on Rails like human readable routes with named parameters instead of ugly regular expresssions.

## Install from source

From project root:

    cake build:all

Include the resulting minified javascript file in your webpage
    
    <script src="coffeescript-router.min.js"></script>

## Install from gem

Add the gem to your bundle
    
    gem 'coffeescript-router'

Add the javascript file to application.js

    //= require coffeescript-router
  
## Usage

Add the setup for your routes somewhere in your code that will executed before the DOM is ready.  Make sure to order the routes from most to least specific.

    Router.add "/blog/:year/:month/:day", (params) ->
      # code for the route goes here

    Router.add "/blog", (params) ->
      # code for the route goes here

Then execute the processor when the DOM is ready

    $(document).on "ready", ->
      Router.process()


## More Info

The original blog post about this project can be found here:
* [Standalone Javascript Router](http://collectiveidea.com/blog)
