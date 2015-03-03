requirejs.config
  shim:
    'bootstrap': {'deps': ['jquery']}

  paths:
    'flynns': 'src/coffee/flynns'
    'catbus': 'bower_components/catbus/src/coffee/catbus'
    'jquery': 'bower_components/jquery/dist/jquery'
    'bootstrap': 'bower_components/bootstrap-sass/assets/javascripts/bootstrap'

requirejs ['jquery', 'bootstrap', 'catbus', 'flynns'], ($) ->

  $(document).ready ->

    $flynns = $('[js-flynns]')
    $cabinets = $flynns.find('[js-cabinets]')

    $gridControls = $(['js-grid-controls'])
    $programControls = $('[js-program-controls]')

    grid = 'small'
    gridSearch = 'grid--'
    gridInitalized = false

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


    getGrid = ->
      newGrid = findInClass $flynns.get(0).classList, gridSearch
      console.log "Current grid: #{newGrid}"

      return newGrid

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

    # activateGrid = (e) ->
    #   newGrid = e.target.value
    #   console.log "Activating new grid: #{newGrid}"

    #   if newGrid isnt grid
    #     $flynns.removeClass "#{gridSearch}#{grid}"
    #     $flynns.addClass "#{gridSearch}#{newgrid}"


    toggleTheThing = (newThing, oldThing, prefix, $target) ->

      stripped = prefix.replace '--', ''
      console.log "toggling new #{stripped}: #{newThing}"

      if newThing isnt oldThing
        $target.removeClass "#{prefix}#{oldThing}"
        $target.addClass "#{prefix}#{newThing}"



    init = ->
      console.log "Flynns online"

      program = getProgram()
      grid = getGrid()

      activateProgram {target: value: program}
      # activateGrid {target: value: grid}

      $programControls.on 'change', (e) ->
        newValue = e.target.value
        toggleTheThing(newValue, program, programSearch, $cabinets)

    init()
