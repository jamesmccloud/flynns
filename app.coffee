requirejs.config
  shim:
    'bootstrap': {'deps': ['jquery']}

  paths:
    'catbus': 'bower_components/catbus/src/coffee/catbus'
    'jquery': 'bower_components/jquery/dist/jquery'
    'bootstrap': 'bower_components/bootstrap-sass/assets/javascripts/bootstrap'

# requirejs ['jquery', 'bootstrap', 'catbus']
requirejs ['jquery', 'bootstrap', 'catbus'], ($) ->

  $(document).ready ->

    $flynns = $('[js-flynns]')
    $cabinets = $flynns.find '[js-cabinets]'
    searchString = 'arcade--'

    first = $cabinets.get 0
    classList = first.classList

    for c in classList
      if -1 isnt c.indexOf searchString
        config = c.replace searchString, ''
        break

    # debugger
