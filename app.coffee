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

.controller 'eachThumb', ($scope, $rootScope) ->
  $scope.isopen = false
  $rootScope.$on 'toggle', (evt, idx) ->
    if idx is $scope.$index
      $scope.isopen = !$scope.isopen
    else
      $scope.isopen = false

.controller 'inlineClicker', ($scope, inlineService) ->
  $scope.fire = (idx) ->
    console.log 'fire'
    inlineService.toggle(idx)
    return
  return

.factory 'inlineService', ($rootScope) ->

  index = null

  self = 
    toggle: (idx)->
      if index is idx
        index = null
      else
        index = idx

      $rootScope.$emit 'toggle', idx

    getIndex: ()->
      return index

  return self