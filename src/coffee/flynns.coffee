#
# @author Daryl Roberts
# @license MIT
#

# This silly line is the require line and the jQuery function start
define ['jquery', 'jquery.cookie'], ($, cookie) ->

  $flynns   =
  $controls = {}

  FLYNNS_SMALL = "small"
  FLYNNS_MEDIUM = "medium"
  FLYNNS_LARGE = "large"

  size = FLYNNS_SMALL


  init = ->
    $(document).ready ->
      $flynns = $('[js-flynns]')
      $controls = $('[js-flynns-grid-control]')

      size = FLYNNS_MEDIUM if $flynns.hasClass 'grid--medium'
      size = FLYNNS_LARGE if $flynns.hasClass 'grid--large'

      $controls.find("[for=\"#{size}\"]").addClass 'active'
      $controls.on 'change', changeSize

  changeSize = (e) ->
    newSize = ''
    oldSize = size

    if typeof e is 'string'
      newSize = e

    else
      newSize = e.target.value

    if newSize isnt oldSize
      $flynns
        .removeClass "grid--#{oldSize}"
        .addClass "grid--#{newSize}"

    size = newSize

  # Unless we have reason not to, initialize the catbus as soon as we
  # get required.
  init() unless document.haltFlynns
