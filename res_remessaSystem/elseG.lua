--[[
    ## Author System: elseif
    ## Type: config
    ## Creation Date: 23/04/2022
    ## System: remessaSystem();
--]]



--> config

config = {
    settings = {
        geral = {
            [1] = {
                pos = {-2430.1911621094, -608.23297119141, 131.5625};
                acl = 'Everyone';
                client = {rgb = {255, 255, 255}; text = 'Todos'};
                command = 'createitem';
                value = 0;
                blip = true;
                icon = 6;
            };

            [2] = {
                pos = {-2424.2353515625, -607.65118408203, 131.5625};
                acl = 'Admin';
                client = {rgb = {255, 255, 255};
                text = 'Administração'};
                command = 'createitem'; 
                value = 0;
                blip = false;
                icon = 0;
            };

            [3] = {
                pos = {-2419.3630371094, -610.9609375, 131.5625};
                acl = 'Console';
                client = {rgb = {255, 0, 0}; text = 'Necessaria'};
                command = 'createitem';
                value = 0;
                blip = false;
                icon = 0;
            };
        };
    };
};