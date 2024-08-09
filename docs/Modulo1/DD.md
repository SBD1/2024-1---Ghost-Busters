# DD - Dicionário de Dados

> "Um dicionário de dados é uma coleção de nomes, atributos e definições sobre elementos de dados que estão sendo usados ​​em seu estudo. [...] O objetivo de um dicionário de dados é explicar o que todos os nomes e valores de variáveis ​​em sua planilha realmente significam. Em um dicionário de dados podem ser encontrados dados sobre os nomes das variáveis ​​exatamente como aparecem na planilha, nomes de variáveis ​​curtos (mas legíveis por humanos), o intervalo de valores ou valores aceitos para a variável, descrição da variável e outras informções pertinentes."(Dados Científicos: como construir metadados, descrição, readme, dicionário-de-dados e mais; Agência de Bibliotecas e Coleções Digitais da Universidade de São Paulo)

## Entidade Coisa Ruim

#### Descrição: A Coisa Ruim define as consequências causadas ao seu personagem caso ele perca uma batalha.

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Id_cr | id_cr | SERIAL | A identificação da coisa ruim é o seu código numérico| 00-99 | Não | Sim |
| Descrição | descricao | TEXT | A descrição é um pequeno diálogo descrevendo o que acontece com o PC | a-z, A-Z | Não | Não |
| Consequência | consequencia | TEXT | A consequência é o que de fato acontece com o PC | a-z, A-Z | Não | Não |

## Entidade Diálogo

#### Descrição: O Diálogo é uma interação entre um NPC e o PC que ocorrerá no decorrer do jogo.

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Id_dial | id_dial | SERIAL | A identificação do diálogo é o seu código numérico| 000-999 | Não | Sim |
| Descrição | descricao | TEXT | A descrição do Dialogo é uma string que será apresentado ao Jogador no momento de interação com um NPC | a-z, A-Z | Não | Não |

## Entidade Lugar 

#### Descrição: O lugar define o ambiente em que os Personagens se encontram.

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Id_lugar | id_lugar | VARCHAR[50] | A identificação da coisa ruim é o seu nome|a-z, A-Z | Não | Sim |
| Descrição | descricao | TEXT | A Descrição apresenta toda a ambientação do lugar, ou seja, tudo que o PC pode ver | a-z, A-Z | Não | Não |


## Entidade Mundo

#### Descrição: A entidade Mundo descreve o mapa que será gerado onde acordo com a dificuldade.

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Id_mundo | id_mundo | SERIAL | Identificação do mundo que está sendo criado | 001-999 | Não | Sim |
| Dificuldade | dificuldade | INT | Identifica qual a dificulade do mundo definindo a vida e o dano dos NPCs | 001-003 | Não | Não |

## Entidade: Personagem

#### Descrição: A entidade Personagem descreve os atributos e características do personagem do jogador.

| Variável                            | Nome da variável   | Tipo da variável | Descrição                                                     | Valores permitidos | Possui valores nulos |É chave |
|-------------------------------------|--------------------|------------------|---------------------------------------------------------------|--------------------|----------------------|-----|
| Nome                  | nome               | VARCHAR[30]         | Um nome que possamos nos referir ao personagem                | a-z, A-Z           | Não                  | Sim |
| Vida                  | vida               | INT              | A quantidade de pontos de dano que um personagem pode sofrer  | 001, 999           | Não                  | Não |
| Característica        | caracteristicas    | TEXT       | Uma descrição breve da aparência do personagem                | a-z, A-Z           | Não                  | Não |

## Entidade Playable Character (PC)

#### Descrição: O PC é o personagem que o jogador vai poder controlar durante o jogo, o personagem principal.

## Entidade Non-Playable Character (NPC)

#### Descrição: O NPC são os personagens que o PC vai ter que enfrentar para poder terminar a aventura

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Habilidade | habilidade | TEXT | Descreve um poder especial que os NPCs podem ter | a-z, A-Z | Não | Sim |

## Entidade: Equipamento

#### Descrição: O equipamento são as armas que o caçador vai usar para combater as forças do mal

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Nome_equi                       | nome             | VARCHAR[30]         | Um nome que possamos nos referir ao equipamento               | a-z, A-Z           | Não  | Sim |     
| Ataque                          | ataque           | TEXT        | Uma breve descrição de como usar o equipamento adquirido      | a-z, A-Z                 | Não            | Não |
| Dano  | dano             | INT              | Uma fachetária dos possíveis valores da quantidade de dano causada ao HP da Entidade    | a-z, A-Z |  Não             | Não |
| Descrição | descricao        | TEXT        | Uma descrição da aparência do equipamento                                           | a-z, A-Z |  Não             | Não |

## Entidade Fase

#### Descrição: A Fase é como um degrau a ser superado para que se possa chegar ao próximo até que se chegue a glória.

| Variável  |  Nome da variável  |  Tipo da variável  |  Descrição  |  Valores permitidos  |  Possui valores nulos  |  É chave |
| --- | --- | --- | --- | --- | --- | ---|
| Numeração | numeracao | SERIAL | A númeração define em qual fase o PC se encontra, adaptando os lugares que o PC pode acessar de acordo | 01-09 | Não | Sim |

## Histórico de versões

| Versão |    Data    | Descrição               | Autor                                                                                                                 |
| :----: | :--------: | ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| 1.0 | 20/07/2024 | Criação do documento DD                      | [Davi Pierre](https://github.com/DaviPierre)                                                        |
| 1.1 | 20/07/2024 | Criação de entidades e atualização           | [Davi Pierre](https://github.com/DaviPierre)                                                        | 
| 1.2 | 22/07/2024 | Revisão e atualização do Dicionário de Dados | [Julia Gabriela](https://github.com/JuliaGabP)                                                      |
| 1.3 | 08/08/2024 | Atualização da tabela Equipamento            | [Davi Pierre](https://github.com/DaviPierre)                                                        |
| 1.4 | 08/07/2024 | Correção dos tipos das variáveis             | [Julia Gabriela](https://github.com/JuliaGabP)                                                      |
