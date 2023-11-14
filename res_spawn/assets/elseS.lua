--[[
    ## Author System: elseif
    ## Type: server
    ## Creation Date: 10/01/2023
    ## System: weaponsRemessa();
--]]



--> tables create

local tables = {
    amount = {
    };

    block = {
    };
    
    time = {
    };

    give = {
    };
};



--> required

local marker = createMarker( config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 3 ] - 1, config[ 'settings' ][ 'geral' ]['marker'].type, 10, 255, 0, 0, 0 )
local pickup = createPickup( config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'marker' ].pos[ 3 ], 2, config[ 'settings' ][ 'geral' ]['marker'].id, 0, 0 )



--> import

addEventHandler('onResourceStart', root,
    function()
        if not ( aclGetGroup( config[ 'settings' ][ 'geral' ].acl ) and aclGetGroup( config[ 'settings' ][ 'geral' ][ 'pecas' ].acl ) and aclGetGroup( config[ 'settings' ][ 'geral' ][ 'block' ].acl ) ) then
            print( '* Revise as ACL"s inseridas na(s) Tabela' );
            cancelEvent( );
        end
    end
);



--> give

addEventHandler('onPickupHit', pickup,
    function( hitElement )
        if ( ( getElementType( hitElement ) == 'player' ) and not isPedInVehicle( hitElement ) ) then
            if ( getPlayerAcl( hitElement, config[ 'settings' ][ 'geral' ][ 'pecas' ].acl ) ) then
                if ( tables.block[ pickup ] ~= nil and tables.block[ pickup ].bol and tables.block[ pickup ].timer ~= 0 ) then
                    return outputChatBox( '* System: Os armamentos da(e) [ '..( config[ 'settings' ][ 'geral' ].acl )..' ] foram bloqueados por '..( tables.block[ pickup ] ~= nil and tables.block[ pickup ].timer or 0 )..' minutos.', hitElement, 255, 0, 0, true )
                end
                if ( tables.amount[ pickup ] == nil or tonumber( tables.amount[ pickup ] ) <= 0 ) then
                    return outputChatBox( '* System: Sem peças de armas, crie mais e entregue.', hitElement, 255, 0, 0, true )
                end
                if ( tables.give[ hitElement ] ) then
                    return outputChatBox( '* System: Você deve esperar ('..( tonumber( config[ 'settings' ][ 'geral' ].timer ) or 1 )..' min) para pegar o armamento novamente.', hitElement, 255, 0, 0, true )
                end
                tables.amount[ pickup ] = ( tables.amount[ pickup ] - 1 )
                tables.give[ hitElement ] = true
                for i, v in ipairs(config[ 'settings' ][ 'geral' ]['give'].weaponsID) do
                    local wp = config[ 'settings' ][ 'geral' ]['give'].weaponsID
                    giveWeapon( hitElement, wp[i], config[ 'settings' ][ 'geral' ]['give'].ammu, true )
                end
                setElementHealth( hitElement, 100 )
                setPedArmor( hitElement, 100 )
                outputChatBox( '* System: Você pegou o armamento com sucesso.', hitElement, 53, 153, 204, true )
                tables.time[ hitElement ] = setTimer(function()
                    tables.give[ hitElement ] = false
                    if ( isTimer( tables.time[ hitElement ] ) ) then
                        killTimer( tables.time[ hitElement ] )
                    end
                end, ( ( tonumber( config[ 'settings' ][ 'geral' ].timer ) or 1 ) * 60000 ), 1)
            else
                outputChatBox( '* System: Você não tem permissão de pegar o armamento neste local.', hitElement, 255, 0, 0, true )
            end
        else
            outputChatBox( '* System: Saia do Veiculo para pegar a(s) armas', hitElement, 255, 0, 0, true )
        end
    end
);



--> delivery

local delivery_marker = createMarker( config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ] - 1, 'cylinder', 1.2, 53, 153, 204, 50 )
local delivery_pickup = createPickup( config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ], 3, config[ 'settings' ][ 'geral' ]['delivery']['marker'].id, 0, 0 )

addCommandHandler(config[ 'settings' ][ 'geral' ][ 'delivery' ].cmd,
    function( player )
        if ( ( isElementWithinMarker( player, delivery_marker ) ) and not isPedInVehicle( player ) ) then
            if ( getPlayerAcl( player, config[ 'settings' ][ 'geral' ][ 'delivery' ].acl ) ) then
                if ( tonumber( getElementData( player, 'item:peca' ) or 0 ) > 0 ) then
                    if ( tables.block[ pickup ] ~= nil and tables.block[ pickup ].bol and tables.block[ pickup ].timer ~= 0 ) then
                        return outputChatBox( '* System: Não foi possivel entregar neste local. Armas desativadas por ('..( tables.block[ pickup ] ~= nil and tables.block[ pickup ].timer or 0 )..' min)', player, 255, 0, 0, true )
                    end
                    tables.amount[ pickup ] = ( ( tonumber( tables.amount[ pickup ] ) or 0 ) + tonumber( getElementData( player, 'item:peca' ) or 0 ) )
                    outputChatBox( '* System: Você entregou ('..( tonumber( getElementData( player, 'item:peca' ) or 0 ) )..') peças de armas com sucesso.', player, 255, 255, 255, true )
                    setElementData( player, 'item:peca', nil )
                else
                    outputChatBox( '* System: Você não tem peças para entregar', player, 255, 0, 0, true )
                end
            else
                outputChatBox( '* System: Você não tem permissão de entregar as peças neste local.', player, 255, 0, 0, true )
            end
        end
    end
);




--> get

addEventHandler('onMarkerHit', marker,
    function( hitElement )
        if ( ( getElementType( hitElement ) == 'player' ) ) then
            local get = tonumber( tables.amount[ pickup ] ) or 0
            if ( tables.block[ pickup ] == nil or tables.block[ pickup ].bol == false ) then
                if ( get > 0 ) then
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '~~~~~~~~~~~~~~~ #3399ccPEÇAS#ffffff ~~~~~~~~~~~~~~~', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '* System: Restam #3399cc[ '..( get )..' ]#ffffff armas', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '~~~~~~~~~~~~~~~ #3399ccPEÇAS#ffffff ~~~~~~~~~~~~~~~', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                else
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '~~~~~~~~~~~~~~~ #3399ccPEÇAS#ffffff ~~~~~~~~~~~~~~~', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '* System: Não a armas aqui, crie mais peças.', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                    outputChatBox( '~~~~~~~~~~~~~~~ #3399ccPEÇAS#ffffff ~~~~~~~~~~~~~~~', player, 255, 255, 255, true )
                    outputChatBox( ' ', player, 255, 255, 255, true )
                end
            else
                outputChatBox( ' ', player, 255, 255, 255, true )
                outputChatBox( '~~~~~~~~~~~~~~~ PEÇAS ~~~~~~~~~~~~~~~', player, 255, 0, 0, true )
                outputChatBox( ' ', player, 255, 255, 255, true )
                outputChatBox( '* System: As armas deste local estão bloqueadas por ('..( tables.block[ pickup ] ~= nil and tables.block[ pickup ].timer or 0 )..' min)', player, 255, 0, 0, true )
                outputChatBox( ' ', player, 255, 255, 255, true )
                outputChatBox( '~~~~~~~~~~~~~~~ PEÇAS ~~~~~~~~~~~~~~~', player, 255, 0, 0, true )
                outputChatBox( ' ', player, 255, 255, 255, true )
            end
        end
    end
);



--> set

addCommandHandler(config[ 'settings' ][ 'geral' ][ 'pecas' ].cmd, 
    function( player, cmd, value )
        if ( getPlayerAcl( player, config[ 'settings' ][ 'geral' ][ 'pecas' ].acl ) ) then
            if ( tonumber( value ) ) then
                if ( tables.amount[ pickup ] ~= nil and tonumber( tables.amount[ pickup ] ) > 0 ) then
                    tables.amount[ pickup ] = ( ( tonumber( tables.amount[ pickup ] ) or 0 ) + value )
                    outputChatBox( '* System: Você acrescentou [ + '..( formatNumber( value, '.' ) )..' ] peça(s) de arma(s) para [ '..( config[ 'settings' ][ 'geral' ].acl )..' ]', player, 53, 153, 204, true )
                else
                    tables.amount[ pickup ] = ( value )
                    outputChatBox( '* System: Você setou [ '..( formatNumber( value, '.' ) )..' ] peça(s) de arma(s) para [ '..( config[ 'settings' ][ 'geral' ].acl )..' ]', player, 53, 153, 204, true )
                end
            else
                outputChatBox( '* System: Utilize /'..( cmd )..' <value>', player, 255, 0, 0, true )
            end
        else
            outputChatBox( '* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true )
        end
    end
);



--> getPlayer

addCommandHandler(config[ 'settings' ][ 'geral' ][ 'info' ].cmd,
    function( player )
        if ( getPlayerAcl( player, config[ 'settings' ][ 'geral' ].acl ) ) then
            local get = tonumber( tables.amount[ pickup ] ) or 0
            outputChatBox( '* System: Atualmente há #3399cc[ '..( formatNumber( get, '.' ) )..' ]#ffffff peças de armas', player, 255, 255, 255, true )
        else
            outputChatBox( '* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true )
        end
    end
);



--> block

addCommandHandler(config[ 'settings' ][ 'geral' ][ 'block' ].cmd, 
    function( player, cmd, time )
        if ( getPlayerAcl( player, config[ 'settings' ][ 'geral' ][ 'block' ].acl ) ) then
            if ( tonumber( time ) ) then
                if ( tables.block[ pickup ] == nil or tables.block[ pickup ].bol == false ) then
                    tables.block[ pickup ] = {
                        bol = true,
                        timer = time
                    }
                    outputChatBox( '* Server: As armas da(e) [ '..( config[ 'settings' ][ 'geral' ].acl )..' ] foram Desativadas por ('..( time )..' min)', root, 53, 153, 204, true )
                    tables.time[ pickup ] = setTimer(function()
                        tables.block[ pickup ] = {
                            bol = false,
                            timer = 0
                        }
                        outputChatBox( '* Server: As armas da(e) [ '..( config[ 'settings' ][ 'geral' ].acl )..' ] foram Ativadas', root, 53, 153, 204, true )
                        if ( isTimer( tables.time[ pickup ] ) ) then
                            killTimer( tables.time[ pickup ] )
                        end
                    end, ( time * 60000 ), 1)
                else
                    tables.block[ pickup ] = {
                        bol = false,
                        timer = 0
                    }
                    if ( isTimer( tables.time[ pickup ] ) ) then
                        killTimer( tables.time[ pickup ] )
                    end
                    outputChatBox( '* Server: As armas da(e) [ '..( config[ 'settings' ][ 'geral' ].acl )..' ] foram Ativadas', root, 53, 153, 204, true )
                end
            else
                outputChatBox( '* System: Utilize /'..( cmd )..' <tempo(Em minutos)>', player, 255, 0, 0, true)
            end
        else
            outputChatBox( '* System: Você não tem permissão de utilizar este comando.', player, 255, 0, 0, true )
        end
    end
);
