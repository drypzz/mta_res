--[[
    ## Author System: elseif
    ## Type: config
    ## Creation Date: 10/01/2023
    ## System: weaponsRemessa();
--]]



--> config

config = {
    ['settings'] = {
        ['geral'] = {
            acl = 'Gang'; --> Permissão geral(de quem podera pegar as peças);
            ['pecas'] = {cmd = 'setgang'; acl = 'Console'}; --> Comando para setar as peças e a permissão de quem podera setar;
            ['info'] = {cmd = 'pecasgang'}; --> Comando para ver quantas peças de arma restam;
            ['block'] = {cmd = 'blockgang'; acl = 'Console'}; --> Comando para bloquear as peças e a permissão de quem podera bloquear;
            
            ['marker'] = {pos = {-2421.4816894531, -614.78265380859, 132.5625}; type = 'cylinder'; id = 30}; --> posição do marker das armas, tipo dele, idPickup;
            ['give'] = {weaponsID = {30, 4, 24, 25}; ammu = 100}; --> Armas que serão setadas e a quantidade de munição;

            ['delivery'] = {acl = 'Everyone'; cmd = 'entregargang'; --> Permissão de quem podera entregar as peças para a "Permissão Geral" e o comando para entregar;
                ['marker'] = {pos = {-2409.9982910156, -603.19970703125, 132.58192443848}; id = 1279}; --> posição do marker de entregar, idPickup;
            };
        };
    };
};