# vi: set ft=JavaScript et sw=2 sts=2 :


// To run this on an Electric Imp, please replace this comment with the contents of:
// - ioexpander.nut
// - i2c.nut
// - mcp23017.nut
// - bargraph.nut


i2cIoExpander <- I2CIOExpander(ElectricImpI2C(),
                               MCP23017(I2CAddress(0x20)))
i2cIoExpander.initialize()

barGraph <- BarGraph(i2cIoExpander)

i <- 0
delta <- 1
function loop() {
  barGraph.display(i)
  i = i + delta
  if (i == 10) {
    delta = -1
  } else if (i == 0) {
    delta = 1
  }
  imp.wakeup(0.01 * i, loop)
}
loop()
