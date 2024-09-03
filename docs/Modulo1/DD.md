# DD - Dicionário de Dados

> "Um dicionário de dados é uma coleção de nomes, atributos e definições sobre elementos de dados que estão sendo usados em seu estudo. [...] O objetivo de um dicionário de dados é explicar o que todos os nomes e valores de variáveis em sua planilha realmente significam. Em um dicionário de dados podem ser encontrados dados sobre os nomes das variáveis exatamente como aparecem na planilha, nomes de variáveis curtos (mas legíveis por humanos), o intervalo de valores ou valores aceitos para a variável, descrição da variável e outras informções pertinentes."(Dados Científicos: como construir metadados, descrição, readme, dicionário-de-dados e mais; Agência de Bibliotecas e Coleções Digitais da Universidade de São Paulo)

## Entidade inventario

#### Descrição: Conjunto de Itens coletado pelo Jogador.

| Variável       | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| --------------- | ----------------- | ----------------- | ------------------ | -------------------- | -------- |
| Identificação | id                | SERIAL            | Números inteiros  | Não                 | Sim      |
| Capacidade      | capacidade        | INT               | Números inteiros  | Não                 | Não     |

## Entidade mundo

#### Descrição: Save de todas as consequências das ações do Jogador.

| Variável             | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| --------------------- | ----------------- | ----------------- | ------------------ | -------------------- | -------- |
| Identificação       | id                | SERIAL            | Números inteiros  | Não                 | Sim      |
| Nome                  | nome              | VARCHAR(30)       | Caracteres         | Não                 | Não     |
| Sala atual do jogador | sala_atual        | VARCHAR(30)       | Caracteres         | Não                 | Não     |
| Status                | status            | VARCHAR(10)       | Caracteres         | Não                 | Não     |
| Dificuldade           | dificuldade       | INT               | Números inteiros  | Não                 | Não     |

## Entidade personagem

#### Descrição: Conjunto de entidades humanoides e espirituais do jogo.

| Variável           | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Identificação     | id                | SERIAL            | Números inteiros                      | Não                 | Sim      |
| Nome                | nome              | VARCHAR(30)       | Caracteres                             | Não                 | Não     |
| Vida                | vida              | INT               | Números inteiros                      | Não                 | Não     |
| Vida Atual          | vida_atual        | INT               | Números inteiros                      | Não                 | Não     |
| Descrição física | descricao_fisisa  | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |

## Entidade jogador

#### Descrição: Personagem que será controlado pelo jogador.

| Variável        | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| ---------------- | ----------------- | ----------------- | ------------------ | -------------------- | -------- |
| Moedas Coletadas | moedas_coletadas  | INT               | Números inteiros  | Não                 | Não     |
| Atributos        | atributos         | INT               | Números inteiros  | Não                 | Não     |
| Resposta         | resposta          | BOOLEAN           | TRUE, FALSE        | Não                 | Não     |

## Entidade fantasma

#### Descrição: Personagem que antagonisa o Jogador.

| Variável             | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| --------------------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Dica                  | dica              | TEXT              | Letras, caracteres especiais, números | Sim                  | Não     |
| Barulho               | barulho           | VARCHAR(20)       | Caracteres                             | Sim                  | Não     |
| Habiildade especial   | habilidade        | TEXT              | Letras, caracteres especiais, números | Sim                  | Não     |
| Descrição de ataque | descricao_ataque  | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |
| Dano causado          | dano_causado      | INT               | Números inteiros                      | Não                 | Não     |

## Entidade npc_contratado

#### Descrição: Personagem que o Jogador pode chamar para seu grupo por um preço.

| Variável             | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| --------------------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Preço                | preco             | INT               | Números inteiros                      | Não                 | Não     |
| Dano                  | dano              | INT               | Números inteiros                      | Não                 | Não     |
| Defesa                | defesa            | INT               | Números inteiros                      | Não                 | Não     |
| Descrição do ataque | descricao_ataque  | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |
| Situação | situacao | BOOLEAN | TRUE, FALSE | Não | Não | 

## Entidade npc_passivo

#### Descrição: Personagem que entrega missões secundárias para o Jogador.

| Variável | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| --------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Diálogo  | dialogo           | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |

## Entidade item

#### Descrição: Objetos que serão coletados pelo jogador a fim de facilitar sua jornada.

| Variável                       | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------------------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Nome                            | nome              | VARCHAR(30)       | Caracteres                             | Não                 | Sim      |
| Utilidade                       | utilidade         | VARCHAR(60)       | Caracteres                             | Sim                  | Não     |
| Dano                            | dano              | INT               | Números inteiros                      | Sim                  | Não     |
| Pontos de Defesa                | pontos_de_defesa  | INT               | Números inteiros                      | Sim                  | Não     |
| Restauração de pontos de vida | restauracao_vida  | INT               | Números inteiros                      | Sim                  | Não     |
| Tipo                            | tipo              | ENUM              | "dano", "defesa", "vida", "utilidade"  | Não                 | Não     |
| Peso                            | peso              | INT               | Números inteiros                      | Não                 | Não     |
| Descrição                     | descricao         | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |

## Entidade grupo

#### Descrição: Conjunto de Jogador e Npcs Contratados que são todos controlados pelo jogador.

| Variável       | Nome da variável | Tipo da variável | Valores permitidos | Possui valores nulos | É chave |
| --------------- | ----------------- | ----------------- | ------------------ | -------------------- | -------- |
| Identificação | id                | SERIAL            | Números inteiros  | Não                 | Sim      |
| Nome            | nome              | VARCHAR(30)       | Caracteres         | Não                 | Não     |
| Membro 1        | membro_1          | VARCHAR(30)       | Caracteres         | Não                 | Não     |
| Membro 2        | membro_2          | VARCHAR(30)       | Caracteres         | Sim                  | Não     |
| Membro 3        | membro_3          | VARCHAR(30)       | Caracteres         | Sim                  | Não     |

## Entidade objeto_interativo

#### Descrição: Objetos que o Jogador pode realizar ações com eles.

| Variável   | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ----------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Nome        | nome              | VARCHAR(30)       | Caracteres                             | Não                 | Sim      |
| Descrição | descricao         | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |
| Status      | status            | VARCHAR(20)       | Caracteres                             | Não                 | Não     |
| Ação      | acao              | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |

## Entidade sala

#### Descrição: Ambiente em que os Persoangens convivem e podem interagir.

| Variável           | Nome da variável   | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ------------------- | ------------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Identificação     | id                  | INT            | Números inteiros                      | Não                 | Sim      |
| Nome                | nome                | VARCHAR(30)       | Caracteres                             | Não                 | Não     |
| Descrição         | descricao           | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |
| Cardinalidade Norte | cardinalidade_norte | INT               | Números inteiros                      | Não                  | Não     |
| Cardinalidade Leste | cardinalidade_leste | INT               | Números inteiros                      | Não                  | Não     |
| Cardinalidade Sul   | cardinalidade_sul   | INT               | Números inteiros                      | Não                  | Não     |
| Cardinalidade Oeste | cardinalidade_oeste | INT               | Números inteiros                      | Não                  | Não     |

## Entidade missao

#### Descrição: Tarefas a serem cumpridas pelo jogador.

| Variável        | Nome da variável | Tipo da variável | Valores permitidos                     | Possui valores nulos | É chave |
| ---------------- | ----------------- | ----------------- | -------------------------------------- | -------------------- | -------- |
| Identificação  | id                | INT            | Números inteiros                      | Não                 | Sim      |
| Nome             | nome              | VARCHAR(30)       | Caracteres                             | Não                 | Não     |
| Ordem            | ordem             | INT               | Números inteiros                      | Nâo                 | Não     |
| Descrição      | descricao         | TEXT              | Letras, caracteres especiais, números | Não                 | Não     |
| Obrigatóriedade | obrigatoriedade   | BOOLEAN           | TRUE, FALSE        | Não                 | Não     |
| Status           | status            | VARCHAR(20)       | Caracteres                             | Não                 | Não     |

## Histórico de versões

| Versão |    Data    | Descrição                                      | Autor                                       |
| :-----: | :--------: | ------------------------------------------------ | ------------------------------------------- |
|   1.0   | 20/07/2024 | Criação do documento DD                        | [Davi Pierre](https://github.com/DaviPierre)   |
|   1.1   | 20/07/2024 | Criação de entidades e atualização           | [Davi Pierre](https://github.com/DaviPierre)   |
|   1.2   | 22/07/2024 | Revisão e atualização do Dicionário de Dados | [Julia Gabriela](https://github.com/JuliaGabP) |
|   1.3   | 08/08/2024 | Atualização da tabela Equipamento              | [Davi Pierre](https://github.com/DaviPierre)   |
|   1.4   | 08/07/2024 | Correção dos tipos das variáveis              | [Julia Gabriela](https://github.com/JuliaGabP) |
|   1.5   | 16/08/2024 | Reboot do Dicionário de Dados                   | [Davi Pierre](https://github.com/DaviPierre)   |
|   1.6   | 17/08/2024 | Finalização do Dicionário de Dados            | [Davi Pierre](https://github.com/DaviPierre)   |
