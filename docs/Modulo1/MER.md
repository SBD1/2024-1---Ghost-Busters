# Modelo Entidade Relacionamento

## ENTIDADES
- mundo
- sala
- personagem
- jogador
- fantasma
- npc_passivo
- npc_contratado
- item
- missao
- grupo
- inventario
- objeto_interativo

## ATRIBUTOS
- mundo:
  - <ins>id</ins>
  - sala_atual
  - nome
  - status
  - dificuldade
- sala:
  - <ins>id</ins>
  - nome
  - descricao
  - cardinalidade_norte
  - cardinalidade_sul
  - cardinalidade_leste
  - cardinalidade_oeste
- personagem:
  - <ins>id</ins>
  - nome
  - vida
  - descricao_fisica
  - vida_atual
- jogador:
  - moedas_coletadas
  - atributos
  - dinheiro
  - resposta
- fantasma:
  - descricao_ataque
  - habilidade
  - dica
  - barulho
  - dano_causado
- npc_passivo:
  - dialogo
- npc_contratado:
  - dano
  - preco
  - defesa
  - descricao_ataque
  - situacao
- item:
  - <ins>nome</ins>
  - peso
  - descricao
  - utilidade
  - restauracao_vida
  - dano
  - pontos_de_defesa
- missao
  - <ins>id</ins>
  - nome
  - ordem
  - descricao
  - status
  - obrigatoriedade
- grupo
  - <ins>id</ins>
  - nome
  - membro_1
  - membro_2
  - membro_3
- inventario
  - <ins>id</ins>
  - capacidade
- objeto_interativo
  - <ins>nome</ins>
  - acao
  - status
  - descricao
## RELACIONAMENTOS
#### mundo-sala
(1,n)------(n,n)
#### mundo-personagem
(0,n)------(1,n)
#### personagem-sala
(0,1)------(1,1)
#### jogador-objeto_interativo
(0,1)------(0,n)
#### jogador-inventario
(1,1)------(1,1)
#### jogador-item
(0,n)------(0,n)
#### jogador-grupo
(1,1)------(1,1)
#### jogador-missao
(1,1)------(0,n)
#### fantasma-item
(1,n)------(1,1)
#### npc_passivo-item
(0,n)------(1,1)
#### npc_passivo-missao
(0,1)------(1,1)
#### npc_contratado-grupo
(0,1)------(0,n)
#### item-objeto_interativo
(0,1)------(0,n)
#### item-inventario
(0,n)------(0,n)
#### missao-sala
(0,1)------(1,1)
#### missao-objeto_interativo
(0,1)------(0,1)
## VERSÕES
| Versão |    Data    | Descrição               | Autor                                                                                                                 |
| :----: | :--------: | ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| 1.0  | 18/07/2024 | Criação do documento MER | [Julia Gabriela](https://github.com/JuliaGabP)                                                                          |
| 1.1  | 19/07/2024 | Atualização do documento MER| [Julia Gabriela](https://github.com/JuliaGabP) | 
| 1.2  | 22/07/2024 | Atualização do documento MER| [Matheus Barros](https://github.com/Ninja-Haiyai) | 
| 1.3  | 22/07/2024 | Atualização do documento MER| [Julia Gabriela](https://github.com/JuliaGabP) | 
| 1.4  | 17/08/2024 | Correção de entidades e atributos| [Julia Gabriela](https://github.com/JuliaGabP) | 
