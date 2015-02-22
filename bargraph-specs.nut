# vi: set ft=JavaScript et sw=2 sts=2 :
dofile("libs/sqjasmine/sqjasmine.nut", true)
dofile("bargraph.nut", true)

describe("This test", function() {
  it("succeeds", function() {
    expect(1 + 2).toEqual(3)
  })
})

println("All tests succeeded")
