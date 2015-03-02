requirejs.config
  shim:
    'bootstrap': {'deps': ['jquery']}

  paths:
    'catbus': 'bower_components/catbus/src/coffee/catbus'
    'jquery': 'bower_components/jquery/dist/jquery'
    'bootstrap': 'bower_components/bootstrap-sass/assets/javascripts/bootstrap'

requirejs ['jquery', 'bootstrap', 'catbus']
# requirejs ['jquery', 'bootstrap', 'catbus'], ($) -> $ ->
