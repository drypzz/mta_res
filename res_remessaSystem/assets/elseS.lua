--[[
    ## Author System: elseif
    ## Type: server
    ## Creation Date: 23/04/2022
    ## System: remessaSystem();
--]]



--> function

for i, v in ipairs(config.settings.markers) do

    --> marker's

    local marker = createMarker(v.pos[1], v.pos[2], v.pos[3], 'cylinder', 1.2, 255, 255, 255, 50)
    local blip = (v.blip == true and createBlipAttachedTo(marker, v.icon) or return cancelEvent())
    setBlipVisibleDistance(blip, 100)

    addEventHandler('onMarkerHit', marker,
        function(hitElement)
            if (getElementType(hitElement) == 'player') then
                if (isObjectInACLGroup('user.'..(getAccountName(getPlayerAccount(hitElement))), aclGetGroup(v.acl))) then
                    outputChatBox('* Utilize: /'..config.settings.commandName..' valor para utilizar $'..formatNumber(tonumber(v.value)), hitElement, 255, 255, 0, true)
                else
                    outputChatBox('* Sem permissão de utilizar este local.', player, 255, 0, 0, true)
                end
            end
        end
    );




    --> create

    local tables = {
        usage = { };
        timer = { };
    };

    addCommandHandler(config.settings.commandName,
        function(player)
            if (isElementWithinMarker(player, marker)) then
                if (isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(v.acl))) then
                    if (getPlayerMoney(player) >= tonumber(v.value)) then
                        if (tables.usage[player]) then
                            return outputChatBox('* Você ja esta construindo uma peça.', player, 255, 0, 0, true)
                        end
                        outputChatBox('* Aguarde até terminar de construir a peça.', player, 0, 255, 0, true)
                        tables.usage[player] = true
                        tables.timer[player] = setTimer(function()
                            tables.usage[player] = false
                            if (isTimer(tables.timer[player])) then
                                killTimer(tables.timer[player])
                            end
                        end, 5000, 1)
                    else
                        outputChatBox('* Você não possui $'..formatNumber(tonumber(v.value)), player, 255, 0, 0, true)
                    end
                else
                    outputChatBox('* Você não tem permissão de utilizar o comando neste local.', player, 255, 0, 0, true)
                end
            end
        end
    );

end;