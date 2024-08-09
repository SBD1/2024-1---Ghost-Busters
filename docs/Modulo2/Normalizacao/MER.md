# Modelo Entidade Relacionamento - Normalização
### Antes da Normalização
- Similar ao diagrama entidade relacionamento(DER), o MER mostra as entidades e seus relacionamentos.
- Pode haver atributos multivalorados e relacionamentos complexos.
### Após a Normalização
- O MER deve ser atualizado para refletir as entidades normalizadas.
- Atributos multivalorados devem ser convertidos em novas entidades.
- Relacionamentos complexos podem ser simplificados.

## ENTIDADES
- Mundo
- Lugar
- Coisa ruim
- Diálogo
- Personagem
- PC
- NPC
- Equipamento
- Fase

## ATRIBUTOS
- Mundo:
  - <ins>Id</ins>
  - Dificuldade
- Lugar:
  - <ins>Id</ins>
  - Descrição
- Coisa ruim:
  - <ins>Id</ins>
  - Descrição
  - Consequência
- Diálogo:
  - <ins>Id</ins>
  - Descrição
- Personagem:
  - <ins>Nome</ins>
  - Vida
  - Características
- PC (tipo de personagem)
- NPC (tipo de personagem):
    - Habilidade
- Equipamento:
  - <ins>Nome</ins>
  - Dano
  - Ataque
  - Descrição
- Fase:
  - <ins>Numeração</ins>

## RELACIONAMENTOS

### Lugar está no mundo:
- Lugar está em um e apenas um mundo
- Mundo possui no mínimo um e no máximo vários lugares

### PC está no lugar:
- PC pode estar em um e apenas um lugar
- Lugar pode ser ocupado por no mínimo e no máximo um PC

### PC possui equipamento:
- PC possui no mínimo um equipamento e no máximo vários
- Equipamento pode ser de um e apenas um PC

### PC passa fase:
- PC passa nenhuma ou várias fases
- Fase pode ser passada por um e apenas um PC

### PC mata NPC:
- PC mata nenhum ou vários NPC
- NPC mata nenhum ou um PC

### NPC está na fase:
- NPC pertence a uma única fase
- Fase possui apenas um único NPC

### Personagem fala diálogo:
- Personagem fala nenhum ou vários diálogos
- Diálogo pode ser falado por um único personagem

### Lugar possui fase:
- Lugar possui uma ou várias fases
- Fase é de um e apenas um lugar

### Fase possui coisa ruim:
- Fase possui uma coisa ruim
- Coisa ruim pode ser de uma ou várias fases

| Versão |    Data    | Descrição                     | Autor                                                                                                                 |
| :----: | :--------: | ----------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| 1.0    | 09/08/2024 | Preenchimento do documento MER| [Julia Gabriela](https://github.com/JuliaGabP)                                                                        |
