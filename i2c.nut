# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("ioexpander.nut", true)


class I2C {
  function write(request) {
    throw "ERROR: Not implemented yet"
  }
}


class ElectricImpI2C extends I2C {
  // TODO Real I2C implementation that takes I2CWriteRequest
  // instances and performs real I2C side-effects
}


class I2CIOExpander extends IOExpander {

  i2c = null
  pureIOExpander = null

  constructor(_i2c, _pureIOExpander) {
    i2c = _i2c
    pureIOExpander = _pureIOExpander
  }

  function enablePin(pin) {
    i2c.write(pureIOExpander.enablePin(pin))
  }

  function disablePin(pin) {
    i2c.write(pureIOExpander.disablePin(pin))
  }

}
