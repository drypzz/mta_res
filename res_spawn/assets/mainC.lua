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


--> vars

local vars = {
    weaponAmount = 0,
    weaponBlocked = false,
    blockTime = 0
};



--> events

addEvent('updateWeaponInfo', true)
addEventHandler('updateWeaponInfo', root,
    function(amount, block, time)
        vars.weaponAmount = amount
        vars.weaponBlocked = block
        vars.blockTime = time
    end
);


--> text

addEventHandler('onClientRender', root,
    function()
        if (getDistanceBetweenPoints3D(config['settings']['geral']['delivery']['marker'].pos[1], config['settings']['geral']['delivery']['marker'].pos[2], config['settings']['geral']['delivery']['marker'].pos[3], getElementPosition(getLocalPlayer())) < 20) then
            local coords = { getScreenFromWorldPosition(config['settings']['geral']['delivery']['marker'].pos[1], config['settings']['geral']['delivery']['marker'].pos[2], config['settings']['geral']['delivery']['marker'].pos[3] + 0.4) }
            if (coords[1] and coords[2]) then
                dxDrawText('#ffffffEntrega #A7C4F5» [ ' .. config['settings']['geral'].acl .. ' ]\n\n#ffffffUtilize#A7C4F5 » /' .. config['settings']['geral']['delivery'].cmd, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
            end
        end

        if (getDistanceBetweenPoints3D(config['settings']['geral']['marker'].pos[1], config['settings']['geral']['marker'].pos[2], config['settings']['geral']['marker'].pos[3], getElementPosition(getLocalPlayer())) < 20) then
            local coords = { getScreenFromWorldPosition(config['settings']['geral']['marker'].pos[1], config['settings']['geral']['marker'].pos[2], config['settings']['geral']['marker'].pos[3] + 0.4) }
            if (coords[1] and coords[2]) then
                local statusText = vars.weaponBlocked and ('#ffffffRemessa #A7C4F5» [ ' .. config['settings']['geral'].acl .. ' ]\n\n#ff0000Bloqueado por (' .. vars.blockTime .. ' min)') or ('#ffffffRemessa #A7C4F5» [ ' .. config['settings']['geral'].acl .. ' ]\n\n#FFFFFFQuantidade #A7C4F5 » ' .. vars.weaponAmount)
                dxDrawText(statusText, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1, 'default-bold', 'center', 'center', false, false, false, true, false)
            end
        end
    end
);