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
}


describe("The BarGraph control 10 pins of an I/O expander", function() {
  it("it can display a representation of an integer", function() {
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
})


println("All tests succeeded")
