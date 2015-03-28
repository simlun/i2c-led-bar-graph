# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("nuts/mcp23017.nut", true)

describe("The MCP23017 I/O expander", function() {
  it("sets all pins as outputs on initialization by writing two zero bytes to the IODIR register", function() {
    local mcp23017 = MCP23017(null)

    local request = mcp23017.initialize()

    expect(stringToHexString(request.registerAddress)).toEqual(stringToHexString("\x00"))
    expect(stringToHexString(request.data)).toEqual(stringToHexString("\x00\x00"))
  })

  it("initialization creates I2CWriteRequests for the given I2C address", function() {
    local mcp23017 = MCP23017("my I2C address")

    local request = mcp23017.initialize()

    expect(request.i2cAddress).toEqual("my I2C address")
  })

  it("has a helper method to convert a 1-byte bit vector to a decimal number", function() {
    local mcp23017 = MCP23017(null)

    local ZERO = [false, false, false, false, false, false, false, false]
    local ONE = [false, false, false, false, false, false, false, true]
    local SEVENTEEN = [false, false, false, true, false, false, false, true]

    expect(mcp23017._byteVectorToNumber(ZERO)).toEqual(0)
    expect(mcp23017._byteVectorToNumber(ONE)).toEqual(1)
    expect(mcp23017._byteVectorToNumber(SEVENTEEN)).toEqual(17)
  })

  describe("setting pin states", function() {
    it("creates I2CWriteRequests for the given I2C address", function() {
      local mcp23017 = MCP23017("my I2C address")
      local ANY_PIN_STATE = [false, false, false, false, false, false, false, false,
                             false, false, false, false, false, false, false, false]

      local request = mcp23017.setPinStates(ANY_PIN_STATE)

      expect(request.i2cAddress).toEqual("my I2C address")
    })

    it("writes to the GPIO register", function() {
      local mcp23017 = MCP23017(null)
      local ANY_PIN_STATE = [false, false, false, false, false, false, false, false,
                             false, false, false, false, false, false, false, false]

      local request = mcp23017.setPinStates(ANY_PIN_STATE)

      expect(stringToHexString(request.registerAddress)).toEqual(stringToHexString("\x12"))
    })

    it("can set all pins to logic-low by writing two all-zero bytes", function() {
      local mcp23017 = MCP23017(null)
      local ALL_PINS_DISABLED = [false, false, false, false, false, false, false, false,
                                 false, false, false, false, false, false, false, false]

      local request = mcp23017.setPinStates(ALL_PINS_DISABLED)

      expect(stringToHexString(request.data)).toEqual(stringToHexString("\x00\x00"))
    })

    it("can set a single pin", function() {
      local mcp23017 = MCP23017(null)
      local SINGLE_PIN_ENABLED = [false, false, false, false, false, false, false, false,
                                  false, false, false, false, false, false, false, true]

      local request = mcp23017.setPinStates(SINGLE_PIN_ENABLED)

      expect(stringToHexString(request.data)).toEqual(stringToHexString("\x00\x01"))
    })

    it("can set all pins arbitrarily", function() {
      local mcp23017 = MCP23017(null)
      local ARBITRARY_PIN_STATES = [false, false, false, true, false, false, true, false,
                                    false, true, true, false, false, true, true, true]

      local request = mcp23017.setPinStates(ARBITRARY_PIN_STATES)

      expect(stringToHexString(request.data)).toEqual(stringToHexString("\x12\x67"))
    })
  })
})


println("All tests succeeded")
