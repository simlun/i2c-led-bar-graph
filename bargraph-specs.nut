# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("bargraph.nut", true)


class FakeIOExpander {
  state = null

  constructor() {
    state = [false, false, false, false, false, false, false, false, false, false]
  }

  function pin(i) {
    return state[i]
  }

  function enablePin(pin) {
    state[pin] = true
  }

  function disablePin(pin) {
    state[pin] = false
  }
}


describe("The BarGraph control LEDs connected to 10 pins of an I/O expander", function() {
  it("can display a representation of the integer 3 by enabling the first 3 LEDs", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(3)

    expect(expander.pin(0)).toBe(true)
    expect(expander.pin(1)).toBe(true)
    expect(expander.pin(2)).toBe(true)
    expect(expander.pin(3)).toBe(false)
    expect(expander.pin(4)).toBe(false)
    expect(expander.pin(5)).toBe(false)
    expect(expander.pin(6)).toBe(false)
    expect(expander.pin(7)).toBe(false)
    expect(expander.pin(8)).toBe(false)
    expect(expander.pin(9)).toBe(false)
  })

  it("has a lower bound of 0", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(0)

    expect(expander.pin(0)).toBe(false)
    expect(expander.pin(1)).toBe(false)
    expect(expander.pin(2)).toBe(false)
    expect(expander.pin(3)).toBe(false)
    expect(expander.pin(4)).toBe(false)
    expect(expander.pin(5)).toBe(false)
    expect(expander.pin(6)).toBe(false)
    expect(expander.pin(7)).toBe(false)
    expect(expander.pin(8)).toBe(false)
    expect(expander.pin(9)).toBe(false)
  })

  it("has an upper bound of 10", function() {
    local expander = FakeIOExpander()
    local barGraph = BarGraph(expander)

    barGraph.display(10)

    expect(expander.pin(0)).toBe(true)
    expect(expander.pin(1)).toBe(true)
    expect(expander.pin(2)).toBe(true)
    expect(expander.pin(3)).toBe(true)
    expect(expander.pin(4)).toBe(true)
    expect(expander.pin(5)).toBe(true)
    expect(expander.pin(6)).toBe(true)
    expect(expander.pin(7)).toBe(true)
    expect(expander.pin(8)).toBe(true)
    expect(expander.pin(9)).toBe(true)
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

    expect(expander.pin(0)).toBe(true)
    expect(expander.pin(1)).toBe(true)
    expect(expander.pin(2)).toBe(true)
    expect(expander.pin(3)).toBe(true)
    expect(expander.pin(4)).toBe(true)
    expect(expander.pin(5)).toBe(false)
    expect(expander.pin(6)).toBe(false)
    expect(expander.pin(7)).toBe(false)
    expect(expander.pin(8)).toBe(false)
    expect(expander.pin(9)).toBe(false)
  })

})


println("All tests succeeded")
