# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("ioexpander.nut", true)
dofile("bargraph.nut", true)


class FakeIOExpander extends IOExpander {
  fakePinState = null

  constructor() {
    fakePinState = [false, false, false, false, false, false, false, false, false, false]
  }

  function fakedPin(i) {
    return fakePinState[i]
  }

  function enablePin(pin) {
    fakePinState[pin] = true
  }

  function disablePin(pin) {
    fakePinState[pin] = false
  }
}


describe("The BarGraph control LEDs connected to 10 pins of an I/O expander", function() {
  it("can display a representation of the integer 3 by enabling the first 3 LEDs", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(3)

    expect(expander.fakedPin(0)).toBe(true)
    expect(expander.fakedPin(1)).toBe(true)
    expect(expander.fakedPin(2)).toBe(true)
    expect(expander.fakedPin(3)).toBe(false)
    expect(expander.fakedPin(4)).toBe(false)
    expect(expander.fakedPin(5)).toBe(false)
    expect(expander.fakedPin(6)).toBe(false)
    expect(expander.fakedPin(7)).toBe(false)
    expect(expander.fakedPin(8)).toBe(false)
    expect(expander.fakedPin(9)).toBe(false)
  })

  it("has a lower bound of 0", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(0)

    expect(expander.fakedPin(0)).toBe(false)
    expect(expander.fakedPin(1)).toBe(false)
    expect(expander.fakedPin(2)).toBe(false)
    expect(expander.fakedPin(3)).toBe(false)
    expect(expander.fakedPin(4)).toBe(false)
    expect(expander.fakedPin(5)).toBe(false)
    expect(expander.fakedPin(6)).toBe(false)
    expect(expander.fakedPin(7)).toBe(false)
    expect(expander.fakedPin(8)).toBe(false)
    expect(expander.fakedPin(9)).toBe(false)
  })

  it("has an upper bound of 10", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(10)

    expect(expander.fakedPin(0)).toBe(true)
    expect(expander.fakedPin(1)).toBe(true)
    expect(expander.fakedPin(2)).toBe(true)
    expect(expander.fakedPin(3)).toBe(true)
    expect(expander.fakedPin(4)).toBe(true)
    expect(expander.fakedPin(5)).toBe(true)
    expect(expander.fakedPin(6)).toBe(true)
    expect(expander.fakedPin(7)).toBe(true)
    expect(expander.fakedPin(8)).toBe(true)
    expect(expander.fakedPin(9)).toBe(true)
  })

  it("can't display negative integers", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    expectException("ERROR: Can only display integer between 0 and 10 inclusive.", function() {
      barGraph.display(-1)
    })
  })

  it("can't display integers greater than 10", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    expectException("ERROR: Can only display integer between 0 and 10 inclusive.", function() {
      barGraph.display(11)
    })
  })

  it("also disables LEDs when for example displaying a lower integer after a higher integer", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(7)
    barGraph.display(5)

    expect(expander.fakedPin(0)).toBe(true)
    expect(expander.fakedPin(1)).toBe(true)
    expect(expander.fakedPin(2)).toBe(true)
    expect(expander.fakedPin(3)).toBe(true)
    expect(expander.fakedPin(4)).toBe(true)
    expect(expander.fakedPin(5)).toBe(false)
    expect(expander.fakedPin(6)).toBe(false)
    expect(expander.fakedPin(7)).toBe(false)
    expect(expander.fakedPin(8)).toBe(false)
    expect(expander.fakedPin(9)).toBe(false)
  })

})


println("All tests succeeded")
