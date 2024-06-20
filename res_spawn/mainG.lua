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



--> config

config = {
    ['settings'] = {
        ['geral'] = {
            acl = 'Gang'; --> Permissão geral(de quem podera pegar as armas)
            timer = 1; --> Tempo(Em minutos) para pegar as armas novamente

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
                pos = {-708.72229003906, 948.58099365234, 12.471940994263}; --> Posição do marker das armas
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
                    pos = {-715.91241455078, 948.29089355469, 12.199818611145};  --> Posição do marker de entregar
                    id = 1279 --> idPickup
                };
            };
        };
    };
};