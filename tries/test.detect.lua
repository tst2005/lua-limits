local D = require "detect"

local b10 = D.detect10()
local b2  = D.detect2()

local max = D.intlimit()

local int2str = D.integertostring
print(int2str(max))
print("10^"..b10)
print("2^"..b2)

local emul = {}
emul.mininteger = -max-1
emul.maxinteger = max
print("emulated: math.mininteger="..int2str(emul.mininteger) .." math.maxinteger="..int2str(emul.maxinteger) )
print("native  : math.mininteger="..int2str(math.mininteger) .." math.maxinteger="..int2str(math.maxinteger) )

