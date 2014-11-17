/*******************************************************************************
 * I2C
 ******************************************************************************/

I2C <- hardware.i2c12


function configureI2C() {
  I2C.configure(CLOCK_SPEED_100_KHZ)
}



/*******************************************************************************
 * MCP23017 I2C I/O Expander
 ******************************************************************************/

// Options
const EXPANDER_I2C_7BIT_ADDRESS = 0x20


// Register constants
const EXPANDER_IODIR_ADDRESS = "\x00"
const EXPANDER_IODIR_ALL_OUTPUTS = "\x00\x00"
const EXPANDER_IODIR_ALL_INPUTS = "\xFF\xFF"
const EXPANDER_GPIO_ADDRESS = "\x12"
const EXPANDER_GPIO_ALL_LOW = "\x00\x00"
const EXPANDER_GPIO_ALL_HIGH = "\xFF\xFF"


// The first 8 bits represent the expander port B,
// the last 8 bits represent the expander port A.
// As if they are numbered 15...0 where the 0th is
// A0 and the 15th is B7.
expanderPinState <- 0x0000


function writeExpanderI2C(expanderRegisterAddress, data) {
  local result = I2C.write(EXPANDER_I2C_7BIT_ADDRESS << 1, expanderRegisterAddress + data)
  if (result != 0) {
    server.log("I2C Expander ERROR:" + I2C.readerror())
  }
}


function setupExpander() {
  // Set all of port A and port B to outputs
  writeExpanderI2C(EXPANDER_IODIR_ADDRESS, EXPANDER_IODIR_ALL_OUTPUTS)
    
  // Initialize to logic-low on all pins
  writeExpanderI2C(EXPANDER_GPIO_ADDRESS, EXPANDER_GPIO_ALL_LOW)
  expanderPinState = 0x0000
}


function writeExpanderPin(pin, value) {
  // Calculate next state of all the pins of the expander
  local nextState = null
  if (value == 1) {
      nextState = expanderPinState | (0x1 << pin)
  } else {
      nextState = (((expanderPinState ^ 0xFFFF) | (0x1 << pin)) ^ 0xFFFF)
  }
  
  // Split next state into port A and port B state
  local nextPortAState = nextState & 0xFF
  local nextPortBState = nextState >> 8
  
  // Write both states
  writeExpanderI2C(EXPANDER_GPIO_ADDRESS, nextPortAState.tochar() + nextPortBState.tochar())
  
  // Finally save the new state in the global variable
  expanderPinState = nextState
}


// Hello world blinky function for the expander
expanderBlinkyP <- 0
expanderBlinkyX <- 1

function expanderBlinky() {
    writeExpanderPin(expanderBlinkyP, expanderBlinkyX)
    expanderBlinkyP++
    if (expanderBlinkyP > 15) {
        expanderBlinkyP = 0
        expanderBlinkyX = 1 - expanderBlinkyX
    }
    imp.wakeup(0.03, expanderBlinky)
}



/*******************************************************************************
 * Main
 ******************************************************************************/

function main() {
  configureI2C()
  setupExpander()
  expanderBlinky()
}


main()


