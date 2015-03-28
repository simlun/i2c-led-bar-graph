# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("nuts/ioexpander.nut", true)
dofile("nuts/i2c.nut", true)


// TODO: Represent I2C addresses as a class
// TODO: I2C_7BIT_ADDRESS = 0x20


// Really an enum but those could not be imported using dofile :(
class MCP23017Protocol {
  static IODIR_ADDRESS = "\x00"
  static IODIR_ALL_OUTPUTS = "\x00\x00"
  static IODIR_ALL_INPUTS = "\xFF\xFF"
  static GPIO_ADDRESS = "\x12"
  static GPIO_ALL_LOW = "\x00\x00"
  static GPIO_ALL_HIGH = "\xFF\xFF"
}


class MCP23017 extends IOExpander {

  i2cAddress = null

  constructor(_i2cAddress) {
    i2cAddress = _i2cAddress
  }

  function initialize() {
    return I2CWriteRequest(i2cAddress,
                           MCP23017Protocol.IODIR_ADDRESS,
                           MCP23017Protocol.IODIR_ALL_OUTPUTS)
  }

  function _byteVectorToNumber(byteVector) {
    local number = 0
    local exponent = 7
    foreach (b in byteVector) {
      if (b) {
        number = number + pow(2, exponent)
      }
      exponent = exponent - 1
    }
    return number
  }

  function _bitVectorToString(bitVector) {
    local byte1 = [bitVector[0], bitVector[1], bitVector[2], bitVector[3],
                   bitVector[4], bitVector[5], bitVector[6], bitVector[7]]
    local number1 = _byteVectorToNumber(byte1)
    local byte2 = [bitVector[8], bitVector[9], bitVector[10], bitVector[11],
                   bitVector[12], bitVector[13], bitVector[14], bitVector[15]]
    local number2 = _byteVectorToNumber(byte2)
    return "" + number1.tochar() + number2.tochar()
  }

  function setPinStates(newStates) {
    return I2CWriteRequest(i2cAddress,
                           MCP23017Protocol.GPIO_ADDRESS,
                           _bitVectorToString(newStates))
  }

}
