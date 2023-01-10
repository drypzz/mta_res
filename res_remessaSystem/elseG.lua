--[[
    ## Author System: elseif
    ## Type: config
    ## Creation Date: 23/04/2022
    ## Update: 10/01/2023
    ## System: remessaSystem();
--]]



--> config

config = {
    ['settings'] = {
        ['geral'] = {
            cmd = 'createitem'; --> Comando geral(Para criar as peças);
            ['info'] = {cmd = 'pecas'}; --> Comando para ver quantas peças de arma "você" tem;
            ['pecas'] = {max = 4; timer = 5}; --> Quantidade maxima de peças que poderão ser criadas | tempo(em minutos) para criar 1 peça;
            ['markers'] = { --> Posição do marker | permissão de quem podera usar o marker | rgb do marker | text3D | valor para começar a criar 1 peça | hablitar ou não o blip, id do blip;
                [1] = {pos = {-2430.1911621094, -608.23297119141, 131.5625}; acl = 'Everyone'; client = {rgb = {255, 255, 255}; text = 'Todos'}; value = 5000; blip = true; icon = 6};
                [2] = {pos = {-2424.2353515625, -607.65118408203, 131.5625}; acl = 'Admin'; client = {rgb = {255, 255, 255}; text = 'Admin'}; value = 0; blip = false; icon = 0};
            };
        };
    };
};