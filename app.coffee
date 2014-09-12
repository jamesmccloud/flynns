angular.module 'flynns', []

.factory 'kimono', ($http) ->
  apikey = 'apikey=3c4b8cd526ff926daf398b6213a1a256'
  url = 'https://www.kimonolabs.com/api/266j8z8q'
  callback = 'callback=JSON_CALLBACK'
  return {
    getData: ->
      $http.jsonp "#{url}?#{apikey}&#{callback}"
  }

.controller 'the-grid', (kimono, $scope) ->
  kimono.getData().success (data) ->
    $scope.programs = data.results.collection1

.controller 'inlineClicker', ($scope, inlineService) ->
  console.log 'PACHOLSKI'
  $scope.fire = () ->
    console.log 'fire'
    inlineService.beep()
    return
  return

.factory 'inlineService', () ->
  self = 
    beep: ()->
      console.log 'boop'
  return self