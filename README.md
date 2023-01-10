# Sistema de Remessa [MTASA]


## 🚀 Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

- Lua


## 💻 Projeto

- Esse projeto foi construído para facilitar e ajudar os Donos de `Server's` e `Fac's`


## 🤔 Como este resource funciona?

- Ele funciona da seguinte forma, um `player` ira ate um local onde esta o(s) marker do resource `res_remessaSystem` e la, ele irá utilizar um(uns) do(s) marker(s) para criar 1 peça de arma.

- Com esta peça de arma criada, ele irá para alguma `favela/base` entregar esta peça em um determinado marker configurado no resource `res_spawn`.


## 📎 Qual o propósito do resource?

- O propósito do resource é fazer com que os `players` de Fac's trabalhem para ter suas armas e não de "mão beixada(giria)"

- Ou até mesmo os `players` "comum" terem como um "emprego" de contrabando trabalhando para os `players` de Fac's


## 🗿🍷 Caso mais alguma duvida, o arquivo de configuração é este:

- Arquivo de configuração do resource: `res_remessaSystem`
```lua
config = {
    ['settings'] = {
        ['geral'] = {cmd = 'string'; --> Comando geral(Para criar as peças);
        
            ['info'] = {cmd = 'string'}; --> Comando para ver quantas peças de arma "você" tem;
            ['pecas'] = {max = int; timer = int}; --> Quantidade maxima de peças que poderão ser criadas -|- Tempo(em minutos) para criar 1 peça;
            ['markers'] = { 
                      --> Posição do marker -|- Permissão de quem podera usar o marker -|- RGB do marker -|- text3D -|- Valor para começar a criar 1 peça -|- Hablitar ou não o blip -|- ID do blip;
                [index] = {pos = {number, number, number}; acl = 'string'; client = {rgb = {int, int, int}; text = 'string'}; value = int; blip = boolean; icon = int};
                [index] = {pos = {number, number, number}; acl = 'string'; client = {rgb = {int, int, int}; text = 'string'}; value = int; blip = boolean; icon = int};
            };
        };
    };
};
```

- Arquivo de configuração do resource: `res_spawn`
```lua
config = {
    ['settings'] = {
        ['geral'] = {acl = 'string'; --> Permissão geral(de quem podera pegar as peças);
        
            ['pecas'] = {cmd = 'string'; acl = 'string'}; --> Comando para setar as peças -|- Permissão de quem podera setar;
            ['info'] = {cmd = 'string'}; --> Comando para ver quantas peças de arma restam;
            ['block'] = {cmd = 'string'; acl = 'string'}; --> Comando para bloquear as peças -|- Permissão de quem podera bloquear;
            
            ['marker'] = {pos = {number, number, number}; type = 'string'; id = int}; --> Posição do marker das armas -|- Tipo dele -|- ID pickup;
            ['give'] = {weaponsID = {int, int, int, int}; ammu = int}; --> ID da(s) arma(s) que serão setada(s) -|- Quantidade de munição;

            ['delivery'] = {acl = 'string'; cmd = 'string'; --> Permissão de quem podera entregar as peças para a "Permissão Geral" -|- Comando para entregar;
                ['marker'] = {pos = {number, number, number}; id = int}; --> Posição do marker de entregar -|- ID pickup;
            };
        };
    };
};
```


---

Feito com ♥ by drypzz
