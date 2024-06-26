# DD - Dicionário de Dados

> "Um dicionário de dados é uma coleção de nomes, atributos e definições sobre elementos de dados que estão sendo usados ​​em seu estudo. [...] O objetivo de um dicionário de dados é explicar o que todos os nomes e valores de variáveis ​​em sua planilha realmente significam. Em um dicionário de dados podem ser encontrados dados sobre os nomes das variáveis ​​exatamente como aparecem na planilha, nomes de variáveis ​​curtos (mas legíveis por humanos), o intervalo de valores ou valores aceitos para a variável, descrição da variável e outras informções pertinentes."(Dados Científicos: como construir metadados, descrição, readme, dicionário-de-dados e mais; Agência de Bibliotecas e Coleções Digitais da Universidade de São Paulo)

## Entidade: Personagem

#### Descrição: A entidade Personagem descreve os atributos e características do personagem do jogador.

| Variável                            | Nome da variável   | Tipo da variável | Descrição                                                     | Valores permitidos | Possui valores nulos | É chave |
|-------------------------------------|--------------------|------------------|---------------------------------------------------------------|--------------------|----------------------|---------|
| Nome do personagem                  | nome               | char[30]         | Um nome que possamos nos referir ao personagem                | a-z, A-Z           | não                  | ---     |
| HP do personagem                    | pontos de vida     | int              | A quantidade de pontos de dano que um personagem pode sofrer  | 001, 999           | sim                  | ---     |
| Habilidade do personagem            | habilidade         | char[150]        | O poder especial que cada personagem pode ter                 | a-z, A-Z           | não                  | ---     |
| Característica física do personagem | caracteristicas    | char[500]        | Uma descrição breve da aparência do personagem                | a-z, A-Z           | não                  | ---     |

## Entidade: Equipamento

#### Descrição: O equipamento são as armas que o caçador vai usar para combater as forças do mal

| Variável                        | Nome da variável | Tipo da variável | Descrição                                                                            |
|---------------------------------|------------------|------------------|--------------------------------------------------------------------------------------|
| Nome do equipamento             | nome             | char[30]         | Um nome que possamos nos referir ao equipamento                                      |
| Função do eqiuipamento          | funcao           | char[150]        | Uma breve descrição de como usar o equipamento adquirido                             |
| Alcance do dano do equipamento  | dano             | int              | Uma fachetária dos possíveis valores da quantidade de dano causada ao HP da Entidade |
| Descrição física do equipamento | descricao        | char[500]        | Uma descrição da aparência do equipamento                                            |













## Histórico de versões

| Versão |    Data    | Descrição               | Autor                                                                                                                 |
| :----: | :--------: | ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 16/09/2023 | Criação do documento DD | [Davi Pierre](https://github.com/DaviPierre)                                                                          |
