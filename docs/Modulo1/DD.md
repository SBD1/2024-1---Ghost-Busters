# DD - Dicionário de Dados

> "Um dicionário de dados é uma coleção de nomes, atributos e definições sobre elementos de dados que estão sendo usados ​​em seu estudo. [...] O objetivo de um dicionário de dados é explicar o que todos os nomes e valores de variáveis ​​em sua planilha realmente significam. Em um dicionário de dados podem ser encontrados dados sobre os nomes das variáveis ​​exatamente como aparecem na planilha, nomes de variáveis ​​curtos (mas legíveis por humanos), o intervalo de valores ou valores aceitos para a variável, descrição da variável e outras informções pertinentes."(Dados Científicos: como construir metadados, descrição, readme, dicionário-de-dados e mais; Agência de Bibliotecas e Coleções Digitais da Universidade de São Paulo)

## Entidade Inventário

#### Descrição: 

| Variável      | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| ------------- | ---------------- | ---------------- | ------------------ | -------------------- | ------- |
| Identificação | id               | SERIAL           | Números inteiros   | Não                  | Sim     |
| Capacidade    | capacidade       | INT              | Números inteiros   | Não                  | Não     |

## Entidade Mundo

#### Descrição: 

| Variável              | Nome da variável | Tipo da variável | Valores permitidos   | Possui valores nulos | É chave |
| --------------------- | ---------------- | ---------------- | -------------------- | -------------------- | ------- |
| Identificação         | id               | SERIAL           | Números inteiros     | Não                  | Sim     |
| Nome                  | nome             | VARCHAR(30)      | Todos os characteres | Não                  | Não     |
| Sala atual do jogador | sala_atual       | VARCHAR(30)      | Todos os characteres | Não                  | Não     |
| Status                | status           | VARCHAR(10)      | Todos os characteres | Não                  | Não     |
| Dificuldade           | dificuldade      | INT              | Números inteiros     | Não                  | Não     |


## Entidade Personagem

#### Descrição: O sala define o ambiente em que os Personagens se encontram.

| Variável         | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ---------------- | ---------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Identificação    | id               | SERIAL           | Números inteiros                       | Não                  | Sim     |
| Nome             | nome             | VARCHAR(30)      | Todos os characteres                   | Não                  | Não     |
| Vida             | vida             | INT              | Números inteiros                       | Não                  | Não     |
| Vida Atual       | vida_atual       | INT              | Números inteiros                       | Não                  | Não     |
| Descrição física | descricao_ficisa | TEXT             | Letras, characterez especiais, números | Não                  | Não     |


## Entidade Jogador

#### Descrição: 

| Variável         | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| ---------------- | ---------------- | ---------------- | ------------------ | -------------------- | ------- |
| Moedas Coletadas | moedas_coletadas | INT              | Números inteiros   | Não                  | Não     |
| Dinheiro         | dinheiro         | INT              | Números inteiros   | Não                  | Não     |
| Atributos        | atributos        | INT              | Números inteiros   | Não                  | Não     |
| Resposta         | resposta         | BOOLEAN          | TRUE, FALSE        | Não                  | Não     |

## Entidade Fantasma

#### Descrição: 

| Variável            | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------- | ---------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Dica                | dica             | TEXT             | Letras, characterez especiais, números | Não                  | Não     |
| Barulho             | barulho          | VARCHAR(20)      | Todos os characteres                   | Não                  | Não     |
| Habiildade especial | habilidade       | TEXT             | Letras, characterez especiais, números | Não                  | Não     |
| Descrição de ataque | descricao_ataque | TEXT             | Letras, characterez especiais, números | Não                  | Não     |
| Dano causado        | daco_causado     | INT              | Números inteiros                       | Não                  | Não     |


## Entidade NPC Contratado 

#### Descrição: 

| Variável            | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------- | ---------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Preço               | preco            | INT              | Números inteiros                       | Não                  | Não     |
| Dano                | dano             | INT              | Números inteiros                       | Não                  | Não     |
| Defesa              | defesa           | INT              | Números inteiros                       | Não                  | Não     |
| Descrição do ataque | descricao_ataque | TEXT             | Letras, characterez especiais, números | Não                  | Não     |


## Entidade NPC Passivo

#### Descrição: 

| Variável | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| -------- | ---------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Diálogo  | dialogo          | TEXT             | Letras, characterez especiais, números | Não                  | Não     |



## Entidade Item

#### Descrição: 

| Variável                      | Nome da variável | Tipo da variável | Valores permitidos   | Possui valores nulos | É chave |
| ----------------------------- | ---------------- | ---------------- | -------------------- | -------------------- | ------- |
| Nome                          | nome             | VARCHAR(30)      | Todos os characteres | Não                  | Sim     |
| Utilidade                     | utilidade        | VARCHAR(30)      | Todos os characteres | Não                  | Não     |
| Dano                          | dano             | INT              | Números inteiros     | Sim                  | Não     |
| Pontos de Defesa              | pontos_de_defesa | INT              | Números inteiros     | Sim                  | Não     |
| Restauração de pontos de vida | restauracao_vida | INT              | Números inteiros     | Sim                  | Não     |

## Entidade Grupo

#### Descrição: 

| Variável      | Nome da variável | Tipo da variável | Valores permitidos   | Possui valores nulos | É chave |
| ------------- | ---------------- | ---------------- | -------------------- | -------------------- | ------- |
| Identificação | id               | SERIAL           | Números inteiros     | Não                  | Sim     |
| Nome          | nome             | VARCHAR(30)      | Todos os characteres | Não                  | Não     |
| Membro 1      | membro_1         | VARCHAR(30)      | Todos os characteres | Sim                  | Não     |
| Membro 2      | membro_2         | VARCHAR(30)      | Todos os characteres | Sim                  | Não     |
| Membro 3      | membro_3         | VARCHAR(30)      | Todos os characteres | Sim                  | Não     |

## Entidade Objeto Interativo

#### Descrição: 

| Variável  | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| --------- | ---------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Nome      | nome             | VARCHAR(30)      | Todos os characteres                   | Não                  | Sim     |
| Descrição | descricao        | TEXT             | Letras, characterez especiais, números | Não                  | Não     |
| Status    | status           | VARCHAR(20)      | Todos os characteres                   | Não                  | Não     |
| Ação      | acao             | TEXT             | Letras, characterez especiais, números | Não                  | Não     |


## Entidade Sala

#### Descrição: 

| Variável      | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| ------------- | ---------------- | ---------------- | ------------------ | -------------------- | ------- |
| Identificação | id               | SERIAL           | Números inteiros   | Não                  | Sim     |

## Entidade Missão 

#### Descrição: 

| Variável            | Nome da variável    | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------- | ------------------- | ---------------- | -------------------------------------- | -------------------- | ------- |
| Identificação       | id                  | SERIAL           | Números inteiros                       | Não                  | Sim     |
| Nome                | nome                | VARCHAR(30)      | Todos os characteres                   | Não                  | Não     |
| Descrição           | descricao           | TEXT             | Letras, characterez especiais, números | Não                  | Não     |
| Cardinalidade Norte | cardinalidade_norte | INT              | Números inteiros                       | Sim                  | Não     |
| Cardinalidade Leste | cardinalidade_leste | INT              | Números inteiros                       | Sim                  | Não     |
| Cardinalidade Sul   | cardinalidade_sul   | INT              | Números inteiros                       | Sim                  | Não     |
| Cardinalidade Oeste | cardinalidade_oeste | INT              | Números inteiros                       | Sim                  | Não     |




## Histórico de versões

| Versão |    Data    | Descrição                                    | Autor                                          |
| :----: | :--------: | -------------------------------------------- | ---------------------------------------------- |
|  1.0   | 20/07/2024 | Criação do documento DD                      | [Davi Pierre](https://github.com/DaviPierre)   |
|  1.1   | 20/07/2024 | Criação de entidades e atualização           | [Davi Pierre](https://github.com/DaviPierre)   |
|  1.2   | 22/07/2024 | Revisão e atualização do Dicionário de Dados | [Julia Gabriela](https://github.com/JuliaGabP) |
|  1.3   | 08/08/2024 | Atualização da tabela Equipamento            | [Davi Pierre](https://github.com/DaviPierre)   |
|  1.4   | 08/07/2024 | Correção dos tipos das variáveis             | [Julia Gabriela](https://github.com/JuliaGabP) |
|  1.5   | 16/08/2024 | Reboot do Dicionário de Dados                | [Davi Pierre](https://github.com/DaviPierre)   |
|  1.6   | 17/08/2024 | Finalização do Dicionário de Dados           | [Davi Pierre](https://github.com/DaviPierre)   |