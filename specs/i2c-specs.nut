# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("nuts/i2c.nut", true)


class StubIOExpander extends IOExpander {
  function setPinStates(pin) {
    return "Stubbed I2C pin states are now: " + pin
  }
}


class I2CSpy extends I2C {
  written = null

  function write(request) {
    written = request
  }

  function spiedLastWriteRequest() {
    return written
  }
}


describe("The I2CIOExpander call I2C side-effects for side-effect free (pure) IOExpanders", function() {
  it("delegates setPinStates calls to the pure IOExpander and writes the returned I2C request", function() {
    local stubbedIoExpander = StubIOExpander()
    local i2cSpy = I2CSpy()
    local i2cIoExpander = I2CIOExpander(i2cSpy, stubbedIoExpander)

    i2cIoExpander.setPinStates("some stubbed values")

    expect(i2cSpy.spiedLastWriteRequest()).toEqual("Stubbed I2C pin states are now: some stubbed values")
  })
})


println("All tests succeeded")
