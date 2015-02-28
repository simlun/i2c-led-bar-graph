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

    for (local pin = 0; pin < integer; pin += 1) {
      expander.enablePin(pin)
    }
  }

}
