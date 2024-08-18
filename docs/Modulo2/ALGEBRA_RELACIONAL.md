### Entidades

- Mundo(id, nome, sala_atual, status, dificuldade)
- Sala(id, nome, descricao, cardinalidade_norte, cardinalidade_sul, cardinalidade_leste, cardinalidade_oeste, mundo_id)
- Personagem(id, nome, vida, vida_atual, descricao_fisica, mundo_id, sala_id)
- Atributos(id, forca, agilidade, inteligencia)
- Jogador(personagem_id, moedas_coletadas, dinheiro, resposta, inventario_id, grupo_id, atributos_id)
- Fantasma(personagem_id, descricao_ataque, habilidade, dica, barulho, dano_causado)
- Npc_passivo(personagem_id, dialogo, missao_id)
- Npc_contratado(personagem_id, dano, preco, defesa, descricao_ataque, situacao)
- Item(id, nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa)
- Missao(id, nome, ordem, descricao, status, obrigatoriedade, sala_id, objeto_interativo_id)
- Grupo(id, nome, membro_1, membro_2, membro_3)
- Inventario(id, capacidade)
- Objeto_interativo(id, nome, descricao, status, acao)

### Consultas em Álgebra Relacional

1. **Selecionar todos os jogadores e seus atributos:**

    ```plaintext
    π_{personagem_id, moedas_coletadas, dinheiro, resposta, inventario_id, grupo_id, forca, agilidade, inteligencia} (Jogador ⨝_{Jogador.atributos_id = Atributos.id} Atributos)
    ```

2. **Listar todos os itens de um jogador específico (por exemplo, com personagem_id = 1):**

    ```plaintext
    π_{item_id, nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa} (σ_{jogador_id = 1} (Jogador_item ⨝ Item))
    ```

3. **Encontrar todas as missões em uma sala específica (por exemplo, com sala_id = 2):**

    ```plaintext
    π_{id, nome, ordem, descricao, status, obrigatoriedade} (σ_{sala_id = 2} Missao)
    ```

4. **Selecionar todos os personagens que estão em uma sala específica (por exemplo, sala_id = 3):**

    ```plaintext
    π_{id, nome, vida, vida_atual, descricao_fisica} (σ_{sala_id = 3} Personagem)
    ```

5. **Listar todos os NPCs passivos com seus diálogos e missões associadas:**

    ```plaintext
    π_{personagem_id, dialogo, missao_id, nome, descricao} (Npc_passivo ⨝_{Npc_passivo.missao_id = Missao.id} Missao)
    ```

6. **Obter todos os objetos interativos que um jogador específico pode interagir (por exemplo, jogador_id = 1):**

    ```plaintext
    π_{id, nome, descricao, status, acao} (σ_{jogador_id = 1} (Jogador_objeto_interativo ⨝ Objeto_interativo))
    ```

7. **Listar todos os membros de um grupo específico (por exemplo, grupo_id = 1):**

    ```plaintext
    π_{id, nome, membro_1, membro_2, membro_3} (σ_{id = 1} Grupo)
    ```

8. **Listar todas as salas em um mundo específico (por exemplo, mundo_id = 1):**

    ```plaintext
    π_{id, nome, descricao, cardinalidade_norte, cardinalidade_sul, cardinalidade_leste, cardinalidade_oeste} (σ_{mundo_id = 1} Sala)
    ```

9. **Encontrar todas as missões obrigatórias:**

    ```plaintext
    π_{id, nome, ordem, descricao, status} (σ_{obrigatoriedade = TRUE} Missao)
    ```

10. **Obter todas as informações dos jogadores e seus personagens correspondentes:**

    ```plaintext
    π_{personagem_id, moedas_coletadas, dinheiro, resposta, inventario_id, grupo_id, nome, vida, vida_atual, descricao_fisica} (Jogador ⨝_{Jogador.personagem_id = Personagem.id} Personagem)
    ```

## VERSÕES
| Versão |    Data    | Descrição                 | Autor                                                                                                                |
| :----: | :--------: |  -----------------------  | -------------------------------------------------------------------------------------------------------------------- |
| 1.0    |18/08/2024  |Preenchimento do documento| [Julia Gabriela](https://github.com/JuliaGabP)                                                                       |
