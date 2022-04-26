--[[
    ## Author System: elseif
    ## Type: client
    ## Creation Date: 23/04/2022
    ## System: remessaSystem();
--]]



--> text

addEventHandler('onClientRender', root,
    function()
        for i, v in ipairs(config.settings.markers) do
            if ((getDistanceBetweenPoints3D(v.pos[1], v.pos[2], v.pos[3], getElementPosition(getLocalPlayer()))) < 40) then
                local coords = {getScreenFromWorldPosition(v.pos[1], v.pos[2], v.pos[3] + 0.4)}
                if (coords[1] and coords[2]) then
                    dxDrawText('#FFFFFF» #A7C4F5Mesa '..(v.acl)..' #FFFFFF«\nUtilize#A7C4F5 » #0080FF/'..(config.settings.commandName)..'#FFFFFF\nValor #A7C4F5» #0080FF$'..formatNumber(tonumber(v.value)), coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
                end
            end
        end
    end
);