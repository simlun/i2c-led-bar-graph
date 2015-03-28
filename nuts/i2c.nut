# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("nuts/ioexpander.nut", true)

function stringToHexString(s) {
  local hex = ""
  local separator = ""
  foreach (c in s) {
    hex += separator + format("0x%02X", c)
    separator = ","
  }
  return hex
}


class I2CWriteRequest {

  i2cAddress = null
  registerAddress = null
  data = null

  constructor(_i2cAddress, _registerAddress, _data) {
    i2cAddress = _i2cAddress
    registerAddress = _registerAddress
    data = _data
  }

  function _tostring() {
    return "I2CWriteRequest(i2cAddress=[" + i2cAddress +
           "], registerAddress=[" + stringToHexString(registerAddress) +
           "], data=[" + stringToHexString(data) + "])"
  }
}


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

  function setPinStates(newPinStates) {
    i2c.write(pureIOExpander.setPinStates(newPinStates))
  }

}
