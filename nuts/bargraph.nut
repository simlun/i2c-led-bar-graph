# vi: set ft=JavaScript et sw=2 sts=2 :

class BarGraph {

  expander = null

  constructor(ioExpander) {
    expander = ioExpander
  }

  function display(integer) {
    if (integer < 0 || integer > 10) {
      throw "ERROR: Can only display integer between 0 and 10 inclusive."
    }

    local newPinStates = [false, false, false, false, false, false, false, false,
                          false, false, false, false, false, false, false, false]

    for (local pin = 15; pin > 15 - integer; pin -= 1) {
      newPinStates[pin] = true
    }

    expander.setPinStates(newPinStates)
  }

}
