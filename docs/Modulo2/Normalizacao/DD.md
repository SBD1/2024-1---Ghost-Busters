# DD - Dicionário de Dado

Antes da Normalização dicionário de dados descreve as tabelas, colunas, tipos de dados, e restrições baseados no modelo inicial.
<br>
Pode conter descrições de tabelas com dados redundantes e atributos compostos.
<br>
Após a Normalização o dicionário de dados deve ser atualizado para refletir as mudanças nas tabelas e colunas.
<br>
Novas tabelas criadas durante a normalização devem ser documentadas.
<br>
Descrições de tabelas existentes devem ser revisadas para remover redundâncias e atributos compostos.

## Entidade Personagem 

 Definição: A entidade Personagem descreve os atributos e características de todas os possíveis jogadores e dos fantasmas a serem enfrenteados.<br>

| Variável         | Nome da Variável | Tipo da Variável | Descrição                                                                                                               | Valores Permitidos | Possui Valores Nulos | É Chave |
| ---------------- | ---------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação    | id               | SERIAL           | Variável criada para referenciar um personagem específico                                                               |                    | Não                  | Sim     |
| Nome             | nome             | VARCHAR(30)      | Nome pelo qual os outros personagens referem-se a um personagem específico                                              |                    | Não                  | Não     |
| Descrição Física | descricao_fisica | TEXT             | Conjunto de características físicas que descrevem o personagem, como cabelo, cor de pele, textura, etc.                 |                    | Não                  | Não     |
| Força            | forca            | INT              | Atributo que define a capacidade atlética do personagem                                                                 |                    | Não                  | Não     |
| Agilidade        | agilidade        | INT              | Atributo que define os reflexos do personagem, incluindo habilidades acrobáticas, furtivas e de manipulação com as mãos |                    | Não                  | Não     |
| Inteligência     | inteligencia     | INT              | Atributo que define a capacidade de raciocínio e conhecimento investigativo, histórico e tecnológico do personagem      |                    | Não                  | Não     |
| Vida Inicial     | vida_inicial     | INT              | Define a resistência do personagem, indicando quanto de dano ele pode suportar antes de desmaiar ou morrer              |                    | Não                  | Não     |


## Entidade Mundo 

Definição: O mundo é onde todas as informações são salvas

| Variável                    | Nome da Variável     | Tipo da Variável | Descrição                                                                                                                                 | Valores Permitidos | Possui Valores Nulos | É Chave |
| --------------------------- | -------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação               | id                   | SERIAL           | Variável criada para referenciar um mundo específico                                                                                      |                    | Não                  | Sim     |
| Nome                        | nome                 | VARCHAR(30)      | Forma mais simples de se referir ao mundo                                                                                                 |                    | Não                  | Não     |
| Dificuldade                 | dificuldade          | INT              | Define o quão desafiador o mundo será para o jogador                                                                                      |                    | Não                  | Não     |
| Status                      | status               | VARCHAR(20)      | Descrição                                                                                                                                 |                    | Não                  | Não     |
| Identificação do Personagem | id_personagem        | SERIAL           | Variável criada para referenciar um personagem específico                                                                                 |                    | Não                  | Sim     |
| Vida Atual                  | vida_atual           | INT              | Quantidade de dano que o personagem do jogador ainda pode suportar até desmaiar ou morrer                                                 |                    | Não                  | Não     |
| Fase Atual                  | fase_atual           | INT              | Definição                                                                                                                                 |                    | Não                  | Não     |
| Moedas Coletadas            | moedas_coletadas     | INT              | Moedas são itens especiais que alguns fantasmas podem deixar para trás ao morrer; este atributo mantém o número total de moedas coletadas |                    | Não                  | Não     |
| Fantasmas Derrotados        | fantasmas_derrotados | INT              | Este atributo mantém a contagem de quantos fantasmas foram derrotados durante a jornada do personagem do jogador                          |                    | Não                  | Não     |



## Entidade Sala 

Definição: Ambiente onde os personagens podem intereagir com o mundo e com eles mesmos 

| Variável              | Nome da Variável | Tipo da Variável | Descrição                                                                                                                           | Valores Permitidos | Possui Valores Nulos | É Chave |
| --------------------- | ---------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação         | id               | SERIAL           | Variável criada para referenciar uma sala específica                                                                                |                    | Não                  | Sim     |
| Nome                  | nome             | VARCHAR(30)      | Nome da sala que serve como uma definição secundária para o jogador ter uma noção inicial do ambiente ao seu redor                  |                    | Não                  | Não     |
| Descrição             | descricao        | TEXT             | Apresentação detalhada do ambiente ao redor do jogador, incluindo ligações com outras salas e objetos interativos e não interativos |                    | Não                  | Não     |
| Identificação da Fase | id_fase          | INT              | Variável criada para referenciar uma fase específica                                                                                |                    | Não                  | Sim     |
| Ordem                 | ordem            | INT              | Escolhas que o jogador pode tomar dentro de uma sala                                                                                |                    | Não                  | Não     |
| Vida Restaurada       | vida_restaurada  | INT              | Quantidade de vida que pode ser restaurada pelo jogador em uma sala específica                                                      |                    | Sim                  | Não     |


## Entidade Fase 

Definição: É um conjunto de salas.

| Variável               | Nome da Variável | Tipo da Variável | Descrição                                                           | Valores Permitidos | Possui Valores Nulos | É Chave |
| ---------------------- | ---------------- | ---------------- | ------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação          | id               | SERIAL           | Variável criada para referenciar uma fase específica                |                    | Não                  | Sim     |
| Nome                   | nome             | VARCHAR(30)      | Nome pelo qual a fase será referida para o jogador                  |                    | Não                  | Não     |
| Descrição              | descricao        | TEXT             | Apresentação detalhada da fase para o jogador                       |                    | Não                  | Não     |
| Ordem                  | ordem            | INT              | Descrição                                                           |                    | Não                  | Não     |
| Identificação do Mundo | id_mundo         | INT              | Variável criada para referenciar um mundo específico                |                    | Não                  | Sim     |
| Coisa Ruim             | coisa_ruim       | TEXT             | Consequência que o jogador sofrerá ao ser derrotado por um fantasma |                    | Não                  | Não     |


## Entidade Arnma 

Definição: São os equipamentos que o jogador vai utilizar para poder derrotar os fantasmas

| Variável            | Nome da variável | Tipo da variável | Descrição                                                                                    | Valores permitidos | Possui valores nulos | É chave |
| ------------------- | ---------------- | ---------------- | -------------------------------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação       | id               | SERIAL           | Uma variável criada para podermos nos referir a uma arma específica                          |                    | Não                  | Sim     |
| Nome                | nome             | VARCHAR(30)      | É a forma com que a arma será referida para o jogador                                        |                    | Não                  | Não     |
| Descrição física    | descricao_fisica | TEXT             | Irá descrever para o jogador a aparência física da arma, ou seja, textura, cor, formato, etc |                    | Não                  | Não     |
| Dano médio          | dano_medio       | INT              | Apresentará a quantidade de vida que será removida do monstro ao atacar com a arma           |                    | Não                  | Não     |
| Descrição do ataque | desricao_ataque  | TEXT             | Descreve o que acontece ao atacar com uma arma                                               |                    | Não                  | Não     |
| Tipo da arma        | tipo             | VARCHAR(20)      | Diz qual o atributo base para se usar a arma                                                 |                    | Não                  | Não     |

## Entidade Fantasma 

| Variável         | Nome da Variável | Tipo da Variável | Descrição                                                                                            | Valores Permitidos | Possui Valores Nulos | É Chave |
| ---------------- | ---------------- | ---------------- | ---------------------------------------------------------------------------------------------------- | ------------------ | -------------------- | ------- |
| Identificação    | id               | SERIAL           | Variável criada para referenciar um fantasma específico                                              |                    | Não                  | Sim     |
| Nome             | nome             | VARCHAR(30)      | Nome pelo qual o fantasma será referido para o jogador                                               |                    | Não                  | Não     |
| Descrição Física | descricao_fisica | TEXT             | Descreve a aparência física do fantasma, incluindo textura, cor, formato, etc.                       |                    | Não                  | Não     |
| Vida             | vida             | INT              | Define a resistência do fantasma, indicando quanto de dano ele pode suportar antes de ser exorcizado |                    | Não                  | Não     |
| Ataque Especial  | ataque_especial  | TEXT             | Descreve como é o ataque especial do fantasma                                                        |                    | Não                  | Não     |
| Barulhos         | barulhos         | TEXT             | Descreve os sons produzidos pelos fantasmas antes de encontrarem o jogador                           |                    | Não                  | Não     |
| Dropa uma Moeda  | dropa_moeda      | BOOLEAN          | Variável criada para definir se um fantasma carrega consigo uma moeda ou não                         |                    | Não                  | Não     |
| Ordem            | ordem            | INT              | Descrição                                                                                            |                    | Não                  | Não     |
| Dica             | dica             | TEXT             | Descrição                                                                                            |                    | Não                  | Não     |






## Histórico de versões

| Versão | Data       | Descrição                                                                               | Autor                                        |
| ------ | ---------- | --------------------------------------------------------------------------------------- | -------------------------------------------- |
| 1.0    | 14/08/2024 | Criação da página e das entidades Personagem, Mundo, Sala e Fase (incompleta)           | [Davi Pierre](https://github.com/DaviPierre) |
| 1.1    | 15/08/2024 | Completação da tabela Entidade Fase e criação das tabelas das entidades Arma e Fantasma | [Davi Pierre](https://github.com/DaviPierre) |
