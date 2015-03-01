# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("i2c.nut", true)


class StubIOExpander extends IOExpander {
  function enablePin(pin) {
    return "Stubbed I2C pin enable write request for pin " + pin
  }

  function disablePin(pin) {
    return "Stubbed I2C pin disable write request for pin " + pin
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
  it("delegates enablePin calls to the pure IOExpander and writes the returned I2C request", function() {
    local stubbedIoExpander = StubIOExpander()
    local i2cSpy = I2CSpy()
    local i2cIoExpander = I2CIOExpander(i2cSpy, stubbedIoExpander)

    i2cIoExpander.enablePin(4711)

    expect(i2cSpy.spiedLastWriteRequest()).toEqual("Stubbed I2C pin enable write request for pin 4711")
  })

  it("delegates disablePin calls to the pure IOExpander and writes the returned I2C request", function() {
    local stubbedIoExpander = StubIOExpander()
    local i2cSpy = I2CSpy()
    local i2cIoExpander = I2CIOExpander(i2cSpy, stubbedIoExpander)

    i2cIoExpander.disablePin(17)

    expect(i2cSpy.spiedLastWriteRequest()).toEqual("Stubbed I2C pin disable write request for pin 17")
  })
})


println("All tests succeeded")
