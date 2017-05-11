

local function detectlimit(base, init)
	local a = init or 1
	local x = 1
	while a > 0 and a ~= a+1 do
		a = a*base
		--print(x, "a", 2^x, a)
		x = x+1
	end
	return math.floor(x/2)
end

-- soource: http://lua-users.org/wiki/IntegerDomain
--**** should be compatible with 5.xx
local function intlimit()
	local floor = math.floor

	-- get highest power of 2 which Lua can still handle as integer
	local step = 2
	while true do
		local nextstep = step*2
		if nextstep-(nextstep-1) == 1 and nextstep > 0 then
			step = nextstep
		else
			break
		end
	end

	-- now get the highest number which Lua can still handle as integer
	local limit,step = step,floor(step/2)
	while step > 0 do
		local nextlimit = limit+step
		if nextlimit-(nextlimit-1) == 1 and nextlimit > 0 then
			limit = nextlimit
		end
		step = floor(step/2)
	end
	return limit
end

return setmetatable({
	detect10 = function() return detectlimit(10) end,
	detect2  = function() return detectlimit(2)  end,
	intlimit = intlimit,
	integertostring = function(i) return type(i)=="number" and ("%.0f"):format(i) or tostring(i) end,
}, {
	__call = function(_, ...)
		return detectlimit(...)
	end,
})
