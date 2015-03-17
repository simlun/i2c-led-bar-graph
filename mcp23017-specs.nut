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

  describe("setting pin states", function() {
    it("can set all pins to logic-low", function() {
      local mcp23017 = MCP23017()
      local ALL_PINS_DISABLED = [false, false, false, false, false, false, false, false,
                                 false, false, false, false, false, false, false, false]

      local actualRequest = mcp23017.setPinStates(ALL_PINS_DISABLED)

      local writeTwoZeroBytesToTheGPIORegisters = I2CWriteRequest("\x12", "\x00\x00")
      expect(actualRequest.tostring()).toEqual(writeTwoZeroBytesToTheGPIORegisters.tostring())
    })
  })
})


println("All tests succeeded")
