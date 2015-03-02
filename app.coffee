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
    $controls = $('[js-controls]')
    $cabinets = $flynns.find('[js-cabinets]')

    config = 'asteroids'
    searchString = 'arcade--'
    initalized = false

    getConfig = ->
      first = $cabinets.get 0
      classList = first.classList

      for c in classList
        if -1 isnt c.indexOf searchString
          newConfig = c.replace searchString, ''
          break

      console.log "Current program: #{newConfig}"

      return newConfig

    activateProgram = (e) ->
      newProgram = e.target.value
      console.log "Activating new program: #{newProgram}"

      if newProgram isnt config
        $cabinets.removeClass "#{searchString}#{config}"
        $cabinets.addClass "#{searchString}#{newProgram}"
        config = newProgram

      unless initalized
        initalized = true
        $('#' + newProgram).click()


    init = ->
      console.log "Flynns online"

      config = getConfig()

      activateProgram {target: value: config}

      $controls.on 'change', activateProgram

    init()
