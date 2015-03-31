# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("nuts/ioexpander.nut", true)
dofile("nuts/i2c.nut", true)


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
    local GPB0 = bitVector[0]
    local GPB1 = bitVector[1]
    local GPB2 = bitVector[2]
    local GPB3 = bitVector[3]
    local GPB4 = bitVector[4]
    local GPB5 = bitVector[5]
    local GPB6 = bitVector[6]
    local GPB7 = bitVector[7]

    local GPA0 = bitVector[8]
    local GPA1 = bitVector[9]
    local GPA2 = bitVector[10]
    local GPA3 = bitVector[11]
    local GPA4 = bitVector[12]
    local GPA5 = bitVector[13]
    local GPA6 = bitVector[14]
    local GPA7 = bitVector[15]

    local byteGPA = [GPA0, GPA1, GPA2, GPA3,
                     GPA4, GPA5, GPA6, GPA7]
    local numberGPA = _byteVectorToNumber(byteGPA)

    local byteGPB = [GPB0, GPB1, GPB2, GPB3,
                     GPB4, GPB5, GPB6, GPB7]
    local numberGPB = _byteVectorToNumber(byteGPB)

    return "" + numberGPA.tochar() + numberGPB.tochar()
  }

  function setPinStates(newStates) {
    return I2CWriteRequest(i2cAddress,
                           MCP23017Protocol.GPIO_ADDRESS,
                           _bitVectorToString(newStates))
  }

}
