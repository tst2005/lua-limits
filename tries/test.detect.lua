local D = require "detect"

local b10 = D.detect10()
local b2  = D.detect2()

local x = D.intlimit()
print( D.integertostring(x), ("%e"):format(x))
print("10^"..b10)
print("2^"..b2)
