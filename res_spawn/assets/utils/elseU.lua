--[[
    ## Author System: drypzz
    ## Type: utils
    ## Creation Date: 20/06/2024
    ## System: weaponsRemessa();
--]]



--> util's

formatNumber = function(number, sep)
	assert(type(tonumber(number)) == 'number', 'Bad argument @\'formatNumber\' [Expected number at argument 1 got '..type(number)..']')
	assert(not sep or type(sep) == 'string', 'Bad argument @\'formatNumber\' [Expected string at argument 2 got '..type(sep)..']')

	for i = 1, (tostring(number):len() / 3) do
		number = string.gsub(number, '^(-?%d+)(%d%d%d)', '%1'..sep..'%2')
	end
	return number
end

getPlayerAcl = function(player, acl)
	if ((getElementType(player) == 'player') and tostring(acl)) then
		if (isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(acl))) then
			return true
		end
	end
	return false
end;