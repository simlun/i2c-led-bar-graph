# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("nuts/ioexpander.nut", true)
dofile("nuts/bargraph.nut", true)


class IOExpanderSpy extends IOExpander {
  spiedPinState = null

  constructor() {
    spiedPinState = [false, false, false, false, false, false, false, false,
                     false, false, false, false, false, false, false, false]
  }

  function setPinStates(newPinStates) {
    spiedPinState = newPinStates
  }
}


describe("The BarGraph control LEDs connected to 10 pins of an I/O expander", function() {
  it("has a lower bound of 0", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    barGraph.display(0)

    expect([true]).toEqual([true])
    expect(expander.spiedPinState).toEqual([false, false, false, false, false, false, false, false,
                                            false, false, false, false, false, false, false, false])
  })

  it("can display a representation of the integer 3 by enabling the first 3 LEDs", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    barGraph.display(3)

    expect(expander.spiedPinState).toEqual([false, false, false, false, false, false, false, false
                                            false, false, false, false, false, true, true, true])
  })

  it("has an upper bound of 10", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    barGraph.display(10)

    expect(expander.spiedPinState).toEqual([false, false, false, false, false, false, true, true
                                            true, true, true, true, true, true, true, true])
  })

  it("can't display negative integers", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    expectException("ERROR: Can only display integer between 0 and 10 inclusive.", function() {
      barGraph.display(-1)
    })
  })

  it("can't display integers greater than 10", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    expectException("ERROR: Can only display integer between 0 and 10 inclusive.", function() {
      barGraph.display(11)
    })
  })

  it("also disables LEDs when for example displaying a lower integer after a higher integer", function() {
    local expander = IOExpanderSpy()
    local barGraph = BarGraph(expander)

    barGraph.display(7)
    barGraph.display(5)

    expect(expander.spiedPinState).toEqual([false, false, false, false, false, false, false, false,
                                            false, false, false, true, true, true, true, true])
  })

})


println("All tests succeeded")
