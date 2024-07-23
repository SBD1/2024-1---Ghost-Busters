# Modelo Entidade Relacionamento

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
  - <ins>Id_mundo</ins>
  - Dificuldade
- Lugar:
  - <ins>Id_lugar</ins>
  - Descrição
- Coisa ruim:
  - <ins>Id_cr</ins>
  - Descrição
  - Consequência
- Diálogo:
  - <ins>Id_dial</ins>
  - Descrição
- Personagem:
  - <ins>Nome</ins>
  - Vida
  - Características
- PC
- NPC:
  - Habilidade
- Equipamento:
  - <ins>Nome_equi</ins>
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

