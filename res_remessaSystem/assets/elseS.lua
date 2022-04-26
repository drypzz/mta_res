--[[
    ## Author System: elseif
    ## Type: server
    ## Creation Date: 23/04/2022
    ## System: remessaSystem();
--]]



--> tables create

local tables = {
    usage = { };
    timer = { };
};



--> function

for i, v in ipairs(config.settings.geral) do

    --> marker's

    local marker = createMarker(v.pos[1], v.pos[2], v.pos[3], 'cylinder', 1.2, 167, 196, 245, 50)
    local blip = (v.blip == true and createBlipAttachedTo(marker, v.icon) or cancelEvent())
    if (v.blip == true) then
        setBlipVisibleDistance(marker, 100)
    end

    addCommandHandler(v.command,
        function(player)
            if (isElementWithinMarker(player, marker)) then
                if (isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(v.acl))) then
                    if (tables.usage[player]) then
                        return outputChatBox('* Você ja esta construindo uma peça.', player, 255, 0, 0, true)
                    end
                    if (getPlayerMoney(player) >= tonumber(v.value)) then
                        outputChatBox('* Aguarde até terminar de construir a peça.', player, 0, 255, 0, true)
                        tables.usage[player] = true
                        takePlayerMoney(player, tonumber(v.value))
                        setElementPosition(marker, v.pos[1], v.pos[2], v.pos[3] - 999)
                        tables.timer[player] = setTimer(function()
                            outputChatBox('* Peça construida com sucesso.', player, 255, 255, 0)
                            setElementPosition(marker, v.pos[1], v.pos[2], v.pos[3])
                            tables.usage[player] = false
                            if (isTimer(tables.timer[player])) then
                                killTimer(tables.timer[player])
                            end
                        end, 5000, 1)
                    else
                        outputChatBox('* Você não possui $'..formatNumber(tonumber(v.value), '.'), player, 255, 0, 0, true)
                    end
                else
                    outputChatBox('* Você não tem permissão de utilizar o comando neste local.', player, 255, 0, 0, true)
                end
            end
        end
    );

end;