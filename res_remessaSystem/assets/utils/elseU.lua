--[[
    ## Author System: elseif
    ## Type: shared
    ## Creation Date: 24/04/2022
    ## System: remessaSystem();
--]]



--> shared

function formatNumber(number, sep)
	assert(type(tonumber(number)) == 'number', 'Bad argument @\'formatNumber\' [Expected number at argument 1 got '..type(number)..']')
	assert(not sep or type(sep) == 'string', 'Bad argument @\'formatNumber\' [Expected string at argument 2 got '..type(sep)..']')

	local money = number
	for i = 1, (tostring(money):len() / 3) do
		money = string.gsub(money, '^(-?%d+)(%d%d%d)', '%1'..sep..'%2')
	end
	return money
end