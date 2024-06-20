--[[
    ## Author System: drypzz
    ## Type: server
    ## Creation Date: 20/06/2024
    ## System: weaponsRemessa();
--]]



--> tables create

local tables = {
    amount = { };
    block = { };
    time = { };
    give = { };
};



--> required

local marker = createMarker( config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 3 ] - 1, config[ 'settings' ][ 'geral' ]['marker'].type, 10, 255, 0, 0, 0 )
local pickup = createPickup( config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 3 ], 2, config[ 'settings' ][ 'geral' ]['marker'].id, 0, 0 )



--> import

addEventHandler('onResourceStart', root,
    function()
        if not (aclGetGroup(config['settings'][ 'geral'].acl) and aclGetGroup(config['settings']['geral']['pecas'].acl) and aclGetGroup(config['settings']['geral']['block'].acl)) then
            print('* Revise as ACL\'s inseridas na(s) Tabela');
            cancelEvent( );
        end
    end
);



--> give

addEventHandler('onPickupHit', pickup,
    function(hitElement)
        if ((getElementType(hitElement) == 'player') and not isPedInVehicle(hitElement)) then
            if (getPlayerAcl(hitElement, config['settings']['geral']['pecas'].acl)) then
                if (tables.block[pickup] ~= nil and tables.block[pickup].bol and tables.block[pickup].timer ~= 0) then
                    return outputChatBox('* System: Os armamentos foram bloqueados por ' .. (tables.block[pickup] ~= nil and tables.block[pickup].timer or 0) .. ' minutos.', hitElement, 255, 0, 0, true)
                end
                if (tables.amount[pickup] == nil or tonumber(tables.amount[pickup]) <= 0) then
                    return outputChatBox('* System: Sem peças de armas, crie mais e entregue.', hitElement, 255, 0, 0, true)
                end
                if (tables.give[hitElement]) then
                    return outputChatBox('* System: Você deve esperar (' .. (tonumber(config['settings']['geral']['timer']) or 1) .. ' min) para pegar o armamento novamente.', hitElement, 255, 0, 0, true)
                end

                tables.amount[pickup] = (tables.amount[pickup] - 1)

                sendWeaponInfoToAllClients()

                tables.give[hitElement] = true
                for i, v in ipairs(config['settings']['geral']['give'].weaponsID) do
                    local wp = config['settings']['geral']['give'].weaponsID
                    giveWeapon(hitElement, wp[i], config['settings']['geral']['give'].ammu, true)
                end
                setElementHealth(hitElement, 100)
                setPedArmor(hitElement, 100)
                outputChatBox('* System: Você pegou o armamento com sucesso.', hitElement, 53, 153, 204, true)

                if (isTimer(tables.time[hitElement])) then
                    killTimer(tables.time[hitElement])
                end
                tables.time[hitElement] = setTimer(function()
                    tables.give[hitElement] = false
                end, (tonumber(config['settings']['geral']['timer']) or 1) * 60000, 1)
            else
                outputChatBox('* System: Você não tem permissão de pegar o armamento neste local.', hitElement, 255, 0, 0, true)
            end
        else
            outputChatBox('* System: Saia do Veículo para pegar a(s) arma(s)', hitElement, 255, 0, 0, true)
        end
    end
)



--> delivery

local delivery_marker = createMarker( config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ] - 1, 'cylinder', 1.2, 53, 153, 204, 50 )
local delivery_pickup = createPickup( config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ], 3, config[ 'settings' ][ 'geral' ]['delivery']['marker'].id, 0, 0 )

addCommandHandler(config['settings']['geral']['delivery'].cmd,
    function(player)
        if ((isElementWithinMarker(player, delivery_marker)) and not isPedInVehicle(player)) then
            if (getPlayerAcl(player, config['settings']['geral']['delivery'].acl)) then
                if (tonumber(getElementData(player, 'item:peca') or 0) > 0) then
                    if (tables.block[pickup] ~= nil and tables.block[pickup].bol and tables.block[pickup].timer ~= 0) then
                        return outputChatBox('* System: Não foi possivel entregar neste local. Armas desativadas por ('.. (tables.block[pickup] ~= nil and tables.block[pickup].timer or 0) ..' min)', player, 255, 0, 0, true)
                    end
                    tables.amount[pickup] = ((tonumber(tables.amount[pickup]) or 0) + tonumber(getElementData(player, 'item:peca') or 0))
                    outputChatBox('* System: Você entregou [ '.. (tonumber(getElementData(player, 'item:peca') or 0)) ..' ] peças de armas com sucesso.', player, 255, 255, 255, true)
                    setElementData(player, 'item:peca', nil)
                    sendWeaponInfoToAllClients()
                else
                    outputChatBox('* System: Você não tem peças para entregar', player, 255, 0, 0, true)
                end
            else
                outputChatBox('* System: Você não tem permissão de entregar as peças neste local.', player, 255, 0, 0, true)
            end
        end
    end
);



--> set

addCommandHandler(config['settings']['geral']['pecas'].cmd, 
    function(player, cmd, value)
        if (getPlayerAcl(player, config['settings']['geral']['pecas'].acl)) then
            if (tonumber(value)) then
                tables.amount[pickup] = (tonumber(tables.amount[pickup]) or 0) + tonumber(value)
                outputChatBox('* System: Você setou [ ' .. formatNumber(value, '.') .. ' ] peça(s) de arma(s) para [ ' .. config['settings']['geral'].acl .. ' ]', player, 53, 153, 204, true)
                sendWeaponInfoToAllClients()
            else
                outputChatBox('* System: Utilize /' .. cmd .. ' <value>', player, 255, 0, 0, true)
            end
        else
            outputChatBox('* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true)
        end
    end
);



--> getPlayer

addCommandHandler(config['settings']['geral']['info'].cmd,
    function(player)
        if (getPlayerAcl(player, config['settings']['geral'].acl)) then
            sendWeaponInfoToAllClients()
            local get = tonumber(tables.amount[pickup]) or 0
            outputChatBox('* System: Atualmente há #3399cc[ '.. (formatNumber(get, '.')) ..' ]#ffffff peças de armas', player, 255, 255, 255, true)
        else
            outputChatBox('* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true)
        end
    end
);



--> block

addCommandHandler(config['settings']['geral']['block'].cmd, 
    function(player, cmd, time)
        if (getPlayerAcl(player, config['settings']['geral']['block'].acl)) then
            if (tonumber(time)) then
                tables.block[pickup] = {
                    bol = not (tables.block[pickup] and tables.block[pickup].bol),
                    timer = tonumber(time)
                }
                local status = tables.block[pickup].bol and 'Desativadas' or 'Ativadas'
                if (status == 'Desativadas') then
                    outputChatBox('* Server: As armas da(e) [ ' .. config['settings']['geral'].acl .. ' ] foram ' .. status .. ' por (' .. time .. ' min)', root, 53, 153, 204, true)
                else
                    outputChatBox('* Server: As armas da(e) [ ' .. config['settings']['geral'].acl .. ' ] foram ' .. status, root, 53, 153, 204, true)
                end
                sendWeaponInfoToAllClients()
                if tables.block[pickup].bol then
                    tables.time[pickup] = setTimer(function()
                        tables.block[pickup] = {bol = false, timer = 0}
                        outputChatBox('* Server: As armas da(e) [ ' .. config['settings']['geral'].acl .. ' ] foram Ativadas', root, 53, 153, 204, true)
                        sendWeaponInfoToAllClients()
                    end, time * 60000, 1)
                elseif (isTimer(tables.time[pickup])) then
                    killTimer(tables.time[pickup])
                end
            else
                outputChatBox('* System: Utilize /' .. cmd .. ' <tempo(Em minutos)>', player, 255, 0, 0, true)
            end
        else
            outputChatBox('* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true)
        end
    end
);



--> client

function sendWeaponInfoToAllClients()
    local amount = tonumber(tables.amount[pickup]) or 0
    local block = tables.block[pickup] and tables.block[pickup].bol or false
    local blockTime = tables.block[pickup] and tables.block[pickup].timer or 0

    triggerClientEvent('updateWeaponInfo', root, amount, block, blockTime)
end;