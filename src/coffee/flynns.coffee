#
# @author Daryl Roberts
# @license MIT
#

# This silly line is the require line and the jQuery function start
define ['jquery'], ($) ->
  $(document).ready ->

    $flynns = $('[js-flynns]')
    $controls = $('[js-flynns-grid-control]')

    FLYNNS_SMALL = "small"
    FLYNNS_MEDIUM = "medium"
    FLYNNS_LARGE = "large"

    size = FLYNNS_SMALL

    init = ->
      size = FLYNNS_MEDIUM if $flynns.hasClass 'grid--medium'
      size = FLYNNS_LARGE if $flynns.hasClass 'grid--large'

      $controls.on 'change', changeSize

    changeSize = (e) ->
      oldSize = size

      if typeof e is 'string'
        newSize = e

      else
        newSize = e.target.value

      $flynns
        .removeClass "grid--#{oldSize}"
        .addClass "grid--#{newSize}"

      size = newSize

    init()
