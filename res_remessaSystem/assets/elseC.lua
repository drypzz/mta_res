--[[
    ## Author System: elseif
    ## Type: client
    ## Creation Date: 23/04/2022
    ## Update: 10/01/2023
    ## System: remessaSystem();
--]]


--> text

addEventHandler('onClientRender', root,
    function()
        for i, v in ipairs(config['settings']['geral']['markers']) do
            if ((getDistanceBetweenPoints3D(v.pos[1], v.pos[2], v.pos[3], getElementPosition(getLocalPlayer()))) < 20) then
                local coords = {getScreenFromWorldPosition(v.pos[1], v.pos[2], v.pos[3] + 1)}
                if (coords[1] and coords[2]) then
                    dxDrawText('#ffffffMesa #A7C4F5» [ID: '..i..']\n\n#ffffffPermissão #A7C4F5» '..(v.client.text)..'#A7C4F5\n#ffffffUtilize#A7C4F5 » /'..(config['settings']['geral'].cmd)..'#FFFFFF\nValor #A7C4F5» '..((v.value > 0) and '$'..formatNumber(tonumber(v.value), '.')..'' or 'Gratis'), coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
                end
            end
        end
    end
);