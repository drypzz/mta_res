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



--> getPos

addCommandHandler('pos',
    function(cmd, type)
        local pos = {getElementPosition(localPlayer)}
        if (type == 'm') then
            outputChatBox('* Posição de marker gerada e copiada com sucesso.', 255, 255, 255)
            setClipboard(pos[1]..', '..pos[2]..', '..(pos[3] - 1))
        else
            outputChatBox('* Posição gerada e copiada com sucesso.', 255, 255, 255)
            setClipboard(pos[1]..', '..pos[2]..', '..pos[3])
        end
    end
);