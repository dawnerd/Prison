###
  Prison.js
  Copyright(c) 2012 Troy Whiteley <troy@somanyscientists.com>
  Released under the MIT License.
###

Prison = () ->
  this.lockedDown = false

  return this

Prison::_scroll = (event) ->
  event.preventDefault()

  return

Prison::_keydown = (event) ->
  # left: 37, up: 38, right: 39, down: 40,
  # spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
  keys = [37, 38, 39, 40, 32, 33, 34, 35, 36]

  for key in keys
    if key is event.keyCode
      event.preventDefault()

  return

Prison::enable = () ->
  # Prevent double binding.
  if this.lockedDown
    return this.lockedDown

  this.lockedDown = true

  if window.addEventListener
    window.addEventListener 'DOMMouseScroll', this._scroll, false

  this.originalScrollEvent = document.onmousewheel or window.onmousewheel
  this.originalKeyEvent = document.onkeydown

  window.onmousewheel = document.onmousewheel = this._scroll
  document.onkeydown = this._keydown

  links = document.getElementsByTagName 'a'

  for link in links
    link.setAttribute 'data-original-tabIndex', link.getAttribute 'tabIndex'
    link.setAttribute 'tabIndex', -1

  return this.lockedDown

Prison::disable = () ->
  # No need to unbind events if they don't exist
  if not this.lockedDown
    return this.lockedDown

  this.lockedDown = false

  if window.removeEventListener
    window.removeEventListener 'DOMMouseScroll', this._scroll, false

  window.onmousewheel = document.onmousewheel = this.originalScrollEvent
  document.onkeydown = this.originalKeyEvent

  links = document.getElementsByTagName 'a'

  for link in links
    link.setAttribute 'tabIndex', link.getAttribute 'tabIndex'

  return this.lockedDown

Prison::getStatus = () ->
  this.lockedDown

# Expose Prison
this.Prison = new Prison()