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
                    pos = {-2427.51171875, -597.37384033203, 132.37074279785 - 1}; --> Posição do marker
                    acl = 'Gang'; --> Permissão de quem podera usar o marker
                    client = {rgb = {255, 255, 255}}; --> rgb do marker
                    value = 0; --> Valor para começar a criar 1 peça
                    blip = true; --> Hablitar ou não o blip
                    icon = 6 --> ID do blip
                };

                [2] = {
                    pos = {-2430.8823242188, -599.73004150391, 132.37924194336 - 1}; --> Posição do marker
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