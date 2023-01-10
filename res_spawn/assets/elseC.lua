--[[
    ## Author System: elseif
    ## Type: client
    ## Creation Date: 09/01/2023
    ## System: weaponsRemessa();
--]]


--> text

addEventHandler('onClientRender', root,
    function()
        if ((getDistanceBetweenPoints3D(config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ], getElementPosition(getLocalPlayer()))) < 20) then
            local coords = {getScreenFromWorldPosition(config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 1 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 2 ], config[ 'settings' ][ 'geral' ][ 'delivery' ][ 'marker' ].pos[ 3 ] + 0.4)}
            if (coords[1] and coords[2]) then
                dxDrawText('#ffffffEntrega #A7C4F5» [ '..(config['settings']['geral'].acl)..' ]\n\n#ffffffUtilize#A7C4F5 » /'..(config['settings']['geral']['delivery'].cmd), coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
            end
        end
    end
);