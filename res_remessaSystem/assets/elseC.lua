--[[
    ## Author System: elseif
    ## Type: client
    ## Creation Date: 23/04/2022
    ## System: remessaSystem();
--]]



--> text

addEventHandler('onClientRender', root,
    function()
        for i, v in ipairs(config.settings.geral) do
            if ((getDistanceBetweenPoints3D(v.pos[1], v.pos[2], v.pos[3], getElementPosition(getLocalPlayer()))) < 20) then
                local coords = {getScreenFromWorldPosition(v.pos[1], v.pos[2], v.pos[3] + 1)}
                if (coords[1] and coords[2]) then
                    dxDrawText('#FFFFFF» #A7C4F5Mesa (Permissão: '..rgbToHex(tonumber(v.client.rgb[1]), tonumber(v.client.rgb[2]), tonumber(v.client.rgb[3]))..''..(v.client.text)..'#A7C4F5) #FFFFFF«\nUtilize#A7C4F5 » /'..(v.command)..'#FFFFFF\nValor #A7C4F5» $'..formatNumber(tonumber(v.value), '.'), coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
                end
            end
        end
    end
);