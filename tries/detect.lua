
local function detect(base)
	local a = 1
	local x = -1
	while a > 0 and a ~= a+1 do
		a = a*base
		print(x, "a", 2^x, a)
		x = x+1
	end
	return math.floor(x/2)
end
return {
	detect10 = function() return detect(10) end,
	detect2  = function() return detect(2)  end,
}
