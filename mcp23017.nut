# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("ioexpander.nut", true)
dofile("i2c.nut", true)


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

  function initialize() {
    return I2CWriteRequest(MCP23017Protocol.IODIR_ADDRESS,
                           MCP23017Protocol.IODIR_ALL_OUTPUTS)
  }

  function setPinStates(newStates) {
    return I2CWriteRequest(MCP23017Protocol.GPIO_ADDRESS,
                           MCP23017Protocol.GPIO_ALL_LOW)
  }

}
