--[[
    ## Author System: elseif
    ## Type: server
    ## Creation Date: 23/04/2022
    ## Update: 10/01/2023
    ## System: remessaSystem();
--]]



--> tables create

local tables = {
    usage = {
    };

    timer = {
    };

    markers = {
    };
};



--> markers

for i, v in ipairs( config[ 'settings' ][ 'geral' ][ 'markers' ] ) do
    local marker = createMarker( Vector3( unpack( v.pos ) ), 'cylinder', 1.2, v.client.rgb[ 1 ], v.client.rgb[ 2 ], v.client.rgb[ 3 ], 50)
    local blip = ( v.blip == true and createBlipAttachedTo( marker, v.icon ) or cancelEvent( ) )
    if ( v.blip == true ) then
        setBlipVisibleDistance( marker, 100 )
    end

    tables.markers[ i ] = { k = marker; acl = v.acl; value = v.value; pos = {v.pos[ 1 ], v.pos[ 2 ], v.pos[ 3 ]}; };
end



--> function

addCommandHandler(config[ 'settings' ][ 'geral' ].cmd,
    function( player )
        for i, v in ipairs( config[ 'settings' ][ 'geral' ][ 'markers' ] ) do
            local data = tables.markers[ i ]
            if ( isElementWithinMarker( player, data.k ) ) then
                if ( getPlayerAcl( player, data.acl ) ) then
                    if ( tables.usage[ player ] ) then
                        return outputChatBox('* System: Aguarde, você ja esta construindo uma peça.', player, 255, 0, 0, true)
                    end
                    if ( ( tonumber( getElementData( player, 'item:peca' ) ) or 0 ) >= ( tonumber( config[ 'settings' ][ 'geral' ][ 'pecas' ].max ) or 2 ) ) then
                        return outputChatBox( '* System: Você ja possui o máximo de peças', player, 255, 0, 0, true )
                    end
                    if ( getPlayerMoney( player ) >= tonumber( data.value ) ) then
                        outputChatBox('* System: Aguarde ('..( tonumber( config[ 'settings' ][ 'geral' ][ 'pecas' ].timer ) or 1 )..' min) para terminar de construir uma peça.', player, 255, 255, 255, true)
                        tables.usage[ player ] = true
                        takePlayerMoney( player, tonumber( data.value ) )
                        setElementPosition( data.k, data.pos[ 1 ], data.pos[ 2 ], data.pos[ 3 ] - 999 )
                        setPedAnimation( player, 'CASINO', 'cards_loop', -1, true, false, false, _, _)
                        toggleAllControls( player, false )
                        tables.timer[ player ] = setTimer(function()
                            setElementPosition( data.k, data.pos[ 1 ], data.pos[ 2 ], data.pos[ 3 ] )
                            setPedAnimation( player )
                            toggleAllControls( player, true )
                            tables.usage[ player ] = false
                            setElementData( player, 'item:peca', ( tonumber( getElementData( player, 'item:peca' ) ) or 0 ) + 1 )
                            outputChatBox( '* System: Peça criada com sucesso.', player, 53, 153, 204, true )
                            if ( isTimer( tables.timer[ player ] ) ) then
                                killTimer( tables.timer[ player ] )
                            end
                        end, ( ( tonumber( config[ 'settings' ][ 'geral' ][ 'pecas' ].timer ) or 1 ) * 60000), 1)
                    else
                        outputChatBox( '* System: Você não possui $'..formatNumber( tonumber( v.value ), '.' ), player, 255, 0, 0, true )
                    end
                else
                    outputChatBox( '* System: Você não tem permissão de utilizar o comando neste local.', player, 255, 0, 0, true )
                end
            end
        end
    end
);



--> get

addCommandHandler('pecas',
    function(player)
        local get = tonumber( getElementData( player, 'item:peca' ) ) or 0
        if ( get == 4 ) then
            outputChatBox('* System: Você possui o maximo de peças - #ffffff[ '..formatNumber( tonumber( get ), '.' )..' ]', player, 53, 153, 204, true)
        else
            outputChatBox('* System: Você possui cerca de #ffffff[ '..formatNumber( tonumber( get ), '.' )..' ] #3399cc peças de armas', player, 53, 153, 204, true)
        end
    end
);