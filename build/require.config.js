requirejs.config({
  shim: {
    'bootstrap': {'deps': ['jquery']},
    'jquery.cookie': {'deps': ['jquery'], 'exports': 'jQuery.cookie'}
  },
  paths: {
    'flynns'        : 'src/coffee/flynns',
    'catbus'        : 'bower_components/catbus/public/javascript/catbus',
    'jquery'        : 'bower_components/jquery/dist/jquery',
    'jquery.cookie' : 'bower_components/jquery.cookie/src/jquery.cookie',
    'bootstrap'     : 'bower_components/bootstrap-sass/assets/javascripts/bootstrap'
  },
  packages: [
    { name: 'cs', location: 'bower_components/require-cs', main: 'cs'},
    { name: 'coffee-script', location: 'bower_components/coffeescript', main: 'extras/coffee-script'}
  ]
})

