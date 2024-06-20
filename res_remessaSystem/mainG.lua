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
            cmd = 'criarpeca'; --> Comando geral(Para criar as peças);
            elementData = 'item:peca'; --> ElementData para ver quantas peças de arma "você" tem;
            
            ['info'] = {
                cmd = 'pecas' --> Comando para ver quantas peças de arma "você" tem;
            };

            ['pecas'] = {
                max = 5; --> Quantidade maxima de peças que poderão ser criadas
                timer = 1 --> Tempo(em minutos) para criar 1 peça
            };

            ['markers'] = {
                [1] = {
                    pos = {-707.45959472656, 962.57458496094, 12.469298362732 - 1}; --> Posição do marker
                    acl = 'Gang'; --> Permissão de quem podera usar o marker
                    client = {rgb = {255, 255, 255}}; --> rgb do marker
                    value = 0; --> Valor para começar a criar 1 peça
                    blip = true; --> Hablitar ou não o blip
                    icon = 6 --> ID do blip
                };

                [2] = {
                    pos = {-707.44360351562, 966.62322998047, 12.47003364563 - 1}; --> Posição do marker
                    acl = 'Gang'; --> Permissão de quem podera usar o marker
                    client = {rgb = {255, 255, 255}}; --> rgb do marker
                    value = 0; --> Valor para começar a criar 1 peça
                    blip = false; --> Hablitar ou não o blip
                    icon = 0 --> ID do blip
                };
            };
        };
    };
};