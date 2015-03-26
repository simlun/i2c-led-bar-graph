# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("mcp23017.nut", true)

describe("The MCP23017 I/O expander", function() {
  it("sets all pins as outputs on initialization", function() {
    local mcp23017 = MCP23017()

    local actualRequest = mcp23017.initialize()

    local writeTwoZeroBytesToTheIODIRRegister = I2CWriteRequest("\x00", "\x00\x00")
    expect(actualRequest.tostring()).toEqual(writeTwoZeroBytesToTheIODIRRegister.tostring())
  })

  it("has a helper method to convert a 1-byte bit vector to a decimal number", function() {
    local mcp23017 = MCP23017()
    local ZERO = [false, false, false, false, false, false, false, false]
    local ONE = [false, false, false, false, false, false, false, true]
    local SEVENTEEN = [false, false, false, true, false, false, false, true]

    expect(mcp23017._byteVectorToNumber(ZERO)).toEqual(0)
    expect(mcp23017._byteVectorToNumber(ONE)).toEqual(1)
    expect(mcp23017._byteVectorToNumber(SEVENTEEN)).toEqual(17)
  })

  describe("setting pin states", function() {
    it("can set all pins to logic-low", function() {
      local mcp23017 = MCP23017()
      local ALL_PINS_DISABLED = [false, false, false, false, false, false, false, false,
                                 false, false, false, false, false, false, false, false]

      local actualRequest = mcp23017.setPinStates(ALL_PINS_DISABLED)

      local writeTwoZeroBytesToTheGPIORegisters = I2CWriteRequest("\x12", "\x00\x00")
      expect(actualRequest.tostring()).toEqual(writeTwoZeroBytesToTheGPIORegisters.tostring())
    })

    it("can set a single pin", function() {
      local mcp23017 = MCP23017()
      local SINGLE_PIN_ENABLED = [false, false, false, false, false, false, false, false,
                                  false, false, false, false, false, false, false, true]

      local actualRequest = mcp23017.setPinStates(SINGLE_PIN_ENABLED)

      local writeDecimal1ToTheGPIORegisters = I2CWriteRequest("\x12", "\x00\x01")
      expect(actualRequest.tostring()).toEqual(writeDecimal1ToTheGPIORegisters.tostring())
    })

    it("can set all pins arbitrarily", function() {
      local mcp23017 = MCP23017()
      local ARBITRARY_PIN_STATES = [false, false, false, true, false, false, true, false,
                                    false, true, true, false, false, true, true, true]

      local actualRequest = mcp23017.setPinStates(ARBITRARY_PIN_STATES)

      local writeDecimal4711ToTheGPIORegisters = I2CWriteRequest("\x12", "\x12\x67")
      expect(actualRequest.tostring()).toEqual(writeDecimal4711ToTheGPIORegisters.tostring())
    })
  })
})


println("All tests succeeded")
