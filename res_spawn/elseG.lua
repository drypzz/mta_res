--[[
    ## Author System: elseif
    ## Type: config
    ## Creation Date: 10/01/2023
    ## System: weaponsRemessa();
--]]



--> config

config = {
    ['settings'] = {
        ['geral'] = {acl = 'Gang'; timer = 5; --> Permissão geral(de quem podera pegar as armas) -|- Tempo(Em minutos) para pegar as armas novamente
            ['pecas'] = {cmd = 'setgang'; acl = 'Console'}; --> Comando para setar as peças -|- Permissão de quem podera setar;
            ['info'] = {cmd = 'pecasgang'}; --> Comando para ver quantas armas restam;
            ['block'] = {cmd = 'blockgang'; acl = 'Console'}; --> Comando para bloquear as peças -|- Permissão de quem podera bloquear;
            
            ['marker'] = {pos = {-2421.4816894531, -614.78265380859, 132.5625}; type = 'cylinder'; id = 30}; --> Posição do marker das armas -|- Tipo dele -|- idPickup;
            ['give'] = {weaponsID = {30, 4, 24, 25}; ammu = 100}; --> Armas que serão setadas -|- Quantidade de munição;

            ['delivery'] = {acl = 'Everyone'; cmd = 'entregargang'; --> Permissão de quem podera entregar as peças para a "Permissão Geral" -|- Comando para entregar;
                ['marker'] = {pos = {-2413.1772460938, -609.15045166016, 132.58256530762}; id = 1279}; --> Posição do marker de entregar -|- idPickup;
            };
        };
    };
};