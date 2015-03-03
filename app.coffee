requirejs.config
  shim:
    'bootstrap': {'deps': ['jquery']}

  paths:
    'flynns': 'src/coffee/flynns'
    'catbus': 'bower_components/catbus/src/coffee/catbus'
    'jquery': 'bower_components/jquery/dist/jquery'
    'bootstrap': 'bower_components/bootstrap-sass/assets/javascripts/bootstrap'

requirejs [
    'jquery',
    'bootstrap',
    'catbus',
    'src/coffee/flynns'
], ($) ->

  $(document).ready ->

    $flynns = $('[js-flynns]')
    $cabinets = $flynns.find('[js-cabinets]')
    $programControls = $('[js-program-controls]')

    program = 'asteroids'
    programSearch = 'arcade--'
    programInitalized = false


    findInClass = (classList, search) ->
      out = ''

      for c in classList
        if -1 isnt c.indexOf programSearch
          out = c.replace programSearch, ''
          break

      return out


    getProgram = ->
      newProgram = findInClass $cabinets.get(0).classList, programSearch
      console.log "Current program: #{newProgram}"

      return newProgram

    activateProgram = (e) ->
      newProgram = e.target.value
      console.log "Activating new program: #{newProgram}"

      if newProgram isnt program
        $cabinets.removeClass "#{programSearch}#{program}"
        $cabinets.addClass "#{programSearch}#{newProgram}"
        program = newProgram

      unless programInitalized
        programInitalized = true
        $('#' + newProgram).click()


    toggleTheThing = (newThing, oldThing, prefix, $target) ->

      stripped = prefix.replace '--', ''
      console.log "toggling new #{stripped}: #{newThing}"

      if newThing isnt oldThing
        $target.removeClass "#{prefix}#{oldThing}"
        $target.addClass "#{prefix}#{newThing}"

      return newThing

    init = ->
      console.log "Flynns online"

      program = getProgram()

      activateProgram {target: value: program}
      # activateGrid {target: value: grid}

      $programControls.on 'change', (e) ->
        newValue = e.target.value
        program = toggleTheThing(newValue, program, programSearch, $cabinets)

    init()
