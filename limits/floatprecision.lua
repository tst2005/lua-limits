
local function floatprecision()
	local max = 20
	for prec=9,max do
		if tonumber("9."..("9"):rep(prec-2).."9") == tonumber("9."..("9"):rep(prec-2).."8") then
			return prec-1
		end
	end
	return max
end
return floatprecision
