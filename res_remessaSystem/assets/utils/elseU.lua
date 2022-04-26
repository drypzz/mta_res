--[[
    ## Author System: elseif
    ## Type: shared
    ## Creation Date: 24/04/2022
    ## System: remessaSystem();
--]]



--> shared

formatNumber = function(number, sep)
	assert(type(tonumber(number)) == 'number', 'Bad argument @\'formatNumber\' [Expected number at argument 1 got '..type(number)..']')
	assert(not sep or type(sep) == 'string', 'Bad argument @\'formatNumber\' [Expected string at argument 2 got '..type(sep)..']')

	for i = 1, (tostring(number):len() / 3) do
		number = string.gsub(number, '^(-?%d+)(%d%d%d)', '%1'..sep..'%2')
	end
	return number
end

rgbToHex = function(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and ( alpha < 0 or alpha > 255))) then
		return nil
	end
	if (alpha) then
		return string.format('#%.2X%.2X%.2X%.2X', red, green, blue, alpha)
	else
		return string.format('#%.2X%.2X%.2X', red, green, blue)
	end
end;