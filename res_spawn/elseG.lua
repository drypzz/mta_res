--[[
    ## Author System: drypzz
    ## Type: config
    ## Creation Date: 20/06/2024
    ## System: weaponsRemessa();
--]]



--> config

config = {
    ['settings'] = {
        ['geral'] = {
            acl = 'Gang'; --> Permissão geral(de quem podera pegar as armas)
            timer = 5; --> Tempo(Em minutos) para pegar as armas novamente

            ['pecas'] = {
                cmd = 'setgang'; --> Comando para setar as peças
                acl = 'Console' --> Permissão de quem podera setar
            };

            ['info'] = {
                cmd = 'pecasgang' --> Comando para ver quantas armas restam;
            };

            ['block'] = {
                cmd = 'blockgang'; --> Comando para bloquear as peças
                acl = 'Console' --> Permissão de quem podera bloquear;
            };
            
            ['marker'] = {
                pos = {-2421.4816894531, -614.78265380859, 132.5625}; --> Posição do marker das armas
                type = 'cylinder'; --> Tipo dele
                id = 30 --> idPickup
            };

            ['give'] = {
                weaponsID = {30, 4, 24, 25}; --> Armas que serão setadas
                ammu = 100 --> Quantidade de munição
            };

            ['delivery'] = {
                acl = 'Everyone'; --> Permissão de quem podera entregar as peças para a "Permissão Geral"
                cmd = 'entregargang'; --> Comando para entregar;
                
                ['marker'] = {
                    pos = {-2413.1772460938, -609.15045166016, 132.58256530762};  --> Posição do marker de entregar
                    id = 1279 --> idPickup
                };
            };
        };
    };
};