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

| Variável         | Nome da variável | Tipo da variável | Descrição                                                                                                                         | Valores permitidos   | Possui valores nulos | É chave |
| ---------------- | ---------------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------- | -------------------- | ------- |
| Identificação    | id               | SERIAL           | Uma variável criada para podermos nos referir a um personagem específico                                                          | 0 - 999999999        | Não                  | Sim     |
| Nome             | nome             | VARCHAR(30)      | O nome será a forma que os outros personagens vão se referir a um personagem específico                                           | Todos os characteres | Não                  | Não     |
| Descrição Física | descricao_fisica | TEXT             | Um pequeno conjunto de características criadas para descrever um personagem, cabelo, cor de pele, textura, etc                    | Todos os characteres | Não                  | Não     |
| Força            | forca            | INT              | Atributo do personagem que define sua capacidade atlética                                                                         | 0 - 18               | Não                  | Não     |
| Agilidade        | agilidade        | INT              | Atributo do personagem que define seus refléxos, suas habiliadades acrobátias, furtivas e enganação com as mãos                   | 0 - 18               | Não                  | Não     |
| Inteligência     | inteligencia     | INT              | Atributo do personagem que define sua capacidade de raciocínio e conhecimento investigatico, histórico e tecnológico              | 0 - 18               | Não                  | Não     |
| Vida Inicial     | vida_inicial     | INT              | Define o quão difícil de matar é um personagem, apresentando quanto de dano o personagem consegue aguentar sem desmaiar ou morrer | 0 - 18               | Não                  | Não     |

## Entidade Mundo 

Definição: O mundo é onde todas as informações são salvas

| Variável                    | Nome da variável     | Tipo da variável | Descrição                                                                                                                                       | Valores permitidos        | Possui valores nulos | É chave |
| --------------------------- | -------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- | -------------------- | ------- |
| Identificação               | id                   | SERIAL           | Uma variável criada para podermos nos referir a um mundo específico                                                                             | 0 - 999999999             | Não                  | Sim     |
| Nome                        | nome                 | VARCHAR(30)      | O nome é a forma mais simples de se referir ao mundo                                                                                            | Todos os characteres      | Não                  | Não     |
| Dificuldade                 | dificuldade          | INT              | Define o quão desafiador o mundo será para o jogador                                                                                            | 1, 2, 3                   | Não                  | Não     |
| Status                      | status               | VARCHAR(20)      | DESCRIÇÃO                                                                                                                                       | Todos os characteres      | Não                  | Não     |
| Identificação do personagem | id_personagem        | SERIAL           | Uma variável criada para podermos nos referir a um personagem específico                                                                        | 0 - 999999999             | Não                  | Sim     |
| Vida atual                  | vida_atual           | INT              | Demonstra a quantidade de dano que o personagem do jogador ainda consegue aguentar até desmaiar ou morrer                                       | Inteiros maiores que zero | Não                  | Não     |
| Fase atual                  | fase_atual           | INT              | DEFINIÇÃO                                                                                                                                       | 0 - 100                   | Não                  | Não     |
| Moedas Coletadas            | moedas_coletadas     | INT              | Moedas são itens especiais que alguns fantasmas podem deixar pra trás quando morrem, esse atributo mantem o número de moedas coletadas no total | 0 - 3                     | Não                  | Não     |
| Fantasmas Derrotados        | fantasmas_derrotados | INT              | Esse atributo mantem a conta de quantos fantasmas foram derrotados durante a jornada do personagem do jogador                                   | 0 - 5                     | Não                  | Não     |


## Entidade Sala 

Definição: Ambiente onde os personagens podem intereagir com o mundo e com eles mesmos 

| Variável              | Nome da variável | Tipo da variável | Descrição                                                                                                                                       | Valores permitidos   | Possui valores nulos | É chave |
| --------------------- | ---------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- | -------------------- | ------- |
| Identificação         | id               | SERIAL           | Uma variável criada para podermos nos referir a uma sala específica                                                                             | 0 - 999999999        | Não                  | Sim     |
| Nome                  | nome             | VARCHAR(30)      | O nome da sala é uma definição secundária para o jogador ter uma noção inicial do ambiente ao seu redor                                         | Todos os characteres | Não                  | Não     |
| Descrição             | descricao        | TEXT             | A descrição é uma apresentação detalhada do ambinete ao redor do jogador, com ligações com outras salas e objetos interativos e não interativos | Todos os characteres | Não                  | Não     |
| Identificação da Fase | id_fase          | INT              | Uma variável criada para podermos nos referir a uma fase específica                                                                             | 0 - 999999999        | Não                  | Sim     |
| Ordem                 | ordem            | INT              | Escolhas que o jogador pode tomar dentro de uma sala                                                                                            | Números inteiros     | Não                  | Não     |
| Vida Restaurada       | vida_restaurada  | INT              | Quantidade de vida que pode ser restaurada pelo jogador em uma sala específica                                                                  | 4 - 8                | Sim                  | Não     |

## Entidade Fase 

Definição: É um conjunto de salas.

| Variável      | Nome da variável | Tipo da variável | Descrição                                                           | Valores permitidos   | Possui valores nulos | É chave |
| ------------- | ---------------- | ---------------- | ------------------------------------------------------------------- | -------------------- | -------------------- | ------- |
| Identificação | id               | SERIAL           | Uma variável criada para podermos nos referir a uma fase específica | 0 - 999999999        | Não                  | Sim     |
| Nome          | nome             | VARCHAR(30)      | É a forma com que a fase será referida para o jogador               | Todos os characteres | Não                  | Não     |
| Descrição     | descricao        | TEXT             | É uma apresentação detalhada da fase para o jogador                 | Todos os characteres | Não                  | Não     |
| Ordem         | ordem            | INT              | DESCRIÇÃO                                                           | Números inteiros     | Não                  | Não     |








## Histórico de versões

| Versão | Data       | Descrição                                            | Autor                                        |
| ------ | ---------- | ---------------------------------------------------- | -------------------------------------------- |
| 1.0    | 14/08/2024 | Criação da página e das entidades Personagem, Mundo, Sala e Fase(incompleta) | [Davi Pierre](https://github.com/DaviPierre) |