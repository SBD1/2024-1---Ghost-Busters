# Modelo Entidade Relacionamento - Normalização
### Antes da Normalização
- Similar ao diagrama entidade relacionamento(DER), o MER mostra as entidades e seus relacionamentos.
- Pode haver atributos multivalorados e relacionamentos complexos.
### Após a Normalização
- O MER deve ser atualizado para refletir as entidades normalizadas.
- Atributos multivalorados devem ser convertidos em novas entidades.
- Relacionamentos complexos podem ser simplificados.

## ENTIDADES
- mundo
- fase
- personagem
- arma
- sala
- fantasma

## ATRIBUTOS
- mundo:
  - <ins>id</ins>
  - dificuldade
  - nome
  - status
  - vida_atual
  - fase_atual
  - moedas_coletadas
  - fantasmas_derrotados
- fase:
  - <ins>id</ins>
  - nome
  - ordem
  - descricao
  - coisa_ruim
- personagem:
  - <ins>id</ins>
  - nome
  - forca
  - agilidade
  - inteligencia
  - vida_inicial
  - descricao_fisica
- arma:
  - <ins>id</ins>
  - tipo
  - nome
  - dano_medio
  - descricao_fisica
  - descricao_ataque
- sala:
  - <ins>id</ins>
  - nome
  - ordem
  - descricao
  - vida_restaurada
- fantasma:
  - <ins>id</ins>
  - dica
  - vida
  - nome
  - ordem
  - barulho
  - descricao
  - dropa_moeda
  - ataque_especial
- personagemarma:
  - <ins>id</ins>

## RELACIONAMENTOS

### personagem e mundo:
- personagem pode estar associado a vários mundos
- mundo possui apenas um personagem

### mundo e fase:
- mundo pode ter várias fases
- fase depende de um mundo

### sala e fantasma:
- sala pode ter no máximo um fantasma
- fantasma está no máximo em uma sala

### personagem e arma:
- personagem possui muitas armas
- armas podem ser de vários personagens

### fase e sala:
- fase pode possuir várias salas
- sala pertence a uma fase

| Versão |    Data    | Descrição                                       | Autor                                                                                                         |
| :----: | :--------: | ------------------------------------------------| ------------------------------------------------------------------------------------------------------------- |
| 1.0    | 09/08/2024 | Preenchimento do documento MER                  | [Julia Gabriela](https://github.com/JuliaGabP)                                                                |
| 1.1    | 13/08/2024 | Correção das entidades, atributos e relações MER| [Julia Gabriela](https://github.com/JuliaGabP)                                                                |
