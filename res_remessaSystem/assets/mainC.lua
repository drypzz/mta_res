--[[
 █████╗ ██╗    ██╗   ██╗███████╗███████╗ ██████╗██████╗ 
██╔══██╗██║    ██║   ██║██╔════╝██╔════╝██╔════╝██╔══██╗
███████║██║    ██║   ██║█████╗  ███████╗██║     ██████╔╝
██╔══██║██║    ╚██╗ ██╔╝██╔══╝  ╚════██║██║     ██╔══██╗
██║  ██║███████╗╚████╔╝ ███████╗███████║╚██████╗██║  ██║
╚═╝  ╚═╝╚══════╝ ╚═══╝  ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝
--]]

--[[

github.com/drypzz

--]]


local playersUsing = { };

addEvent('onMarkerUsageUpdate', true)
addEventHandler('onMarkerUsageUpdate', root,
    function(markerIndex, playerName)
        playersUsing[markerIndex] = playerName
    end
);

--> text

addEventHandler('onClientRender', root,
    function()
        for i, v in ipairs(config['settings']['geral']['markers']) do
            if ((getDistanceBetweenPoints3D(v.pos[1], v.pos[2], v.pos[3], getElementPosition(getLocalPlayer()))) < 20) then
                local coords = {getScreenFromWorldPosition(v.pos[1], v.pos[2], v.pos[3] + 1)}
                if (coords[1] and coords[2]) then
                    local playerName = playersUsing[i] and ('#00ff00' .. removeHex(playersUsing[i])) or 'Ninguém'
                    dxDrawText('#ffffffMesa #A7C4F5» [ID: '..i..']\n\n#ffffffUsuário #A7C4F5» '..playerName..'#A7C4F5\n#ffffffUtilize#A7C4F5 » /'..(config['settings']['geral'].cmd)..'#FFFFFF\nValor #A7C4F5» '..((v.value > 0) and '$'..formatNumber(tonumber(v.value), '.')..'' or 'Gratis'), coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
                end
            end
        end
    end
);