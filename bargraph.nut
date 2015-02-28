# vi: set ft=JavaScript et sw=2 sts=2 :

class BarGraph {

  expander = null

  constructor(ioExpander) {
    expander = ioExpander
  }

  function display(integer) {
    for (local pin = 0; pin < integer; pin += 1) {
      expander.enablePin(pin)
    }
  }

}
