--View para listar todas as missões de um mundo específico
CREATE VIEW view_missoes_mundo AS
SELECT m.id AS missao_id, m.nome AS nome_missao, m.descricao, m.status, m.obrigatoriedade, s.nome AS nome_sala, w.nome AS nome_mundo
FROM missao m
JOIN sala s ON m.sala_id = s.id
JOIN mundo w ON s.mundo_id = w.id;

--View para listar personagens com suas respectivas salas e mundos
CREATE VIEW view_personagens_localizacao AS
SELECT p.id AS personagem_id, p.nome AS nome_personagem, p.vida, p.vida_atual, p.descricao_fisica, s.nome AS nome_sala, w.nome AS nome_mundo
FROM personagem p
JOIN sala s ON p.sala_id = s.id
JOIN mundo w ON s.mundo_id = w.id;

--View para listar os detalhes dos itens em posse de jogadores
CREATE VIEW view_itens_jogadores AS
SELECT j.personagem_id, j.nome AS nome_jogador, i.nome AS nome_item, i.peso, i.descricao, i.utilidade, i.restauracao_vida, i.dano, i.pontos_de_defesa
FROM jogador j
JOIN item i ON j.item_nome = i.nome;

--View para listar os fantasmas com suas respectivas habilidades e ataques
CREATE VIEW view_fantasmas_ataques AS
SELECT f.personagem_id, p.nome AS nome_fantasma, f.descricao_ataque, f.habilidade, f.dica, f.barulho, f.dano_causado, i.nome AS item_associado
FROM fantasma f
JOIN personagem p ON f.personagem_id = p.id
LEFT JOIN item i ON f.item_nome = i.nome;

--View para listar as salas de um mundo com suas conexões cardinais
CREATE VIEW view_salas_mundo AS
SELECT s.id AS sala_id, s.nome AS nome_sala, s.descricao, s.cardinalidade_norte, s.cardinalidade_sul, s.cardinalidade_leste, s.cardinalidade_oeste, w.nome AS nome_mundo
FROM sala s
JOIN mundo w ON s.mundo_id = w.id;

--View para listar o inventário completo de cada jogador
CREATE VIEW view_inventario_jogador AS
SELECT j.personagem_id, j.nome AS nome_jogador, inv.capacidade, i.nome AS nome_item, i.descricao
FROM jogador j
JOIN inventario inv ON j.inventario_id = inv.id
JOIN item i ON inv.item_nome = i.nome;

--View para listar todos os NPCs passivos e as missões relacionadas
CREATE VIEW view_npc_passivos_missoes AS
SELECT n.personagem_id, p.nome AS nome_npc, n.dialogo, m.nome AS nome_missao, m.descricao AS descricao_missao
FROM npc_passivo n
JOIN personagem p ON n.personagem_id = p.id
LEFT JOIN missao m ON n.missao_id = m.id;

--View para listar os membros dos grupos de jogadores
CREATE VIEW view_grupos_jogadores AS
SELECT g.id AS grupo_id, g.nome AS nome_grupo, g.membro_1, g.membro_2, g.membro_3
FROM grupo g;

--View para mostrar todos os detalhes dos personagens, incluindo informações sobre o mundo e a sala onde estão localizados
CREATE VIEW vw_personagem_detalhes AS
SELECT p.id AS personagem_id, 
       p.nome AS personagem_nome, 
       p.vida, 
       p.vida_atual, 
       p.descricao_fisica, 
       m.nome AS mundo_nome, 
       s.nome AS sala_nome
FROM personagem p
JOIN mundo m ON p.mundo_id = m.id
JOIN sala s ON p.sala_id = s.id;

--View para listar todos os itens com suas respectivas utilidades e restauramento de vida
CREATE VIEW vw_itens_detalhes AS
SELECT nome AS item_nome, 
       descricao, 
       utilidade, 
       restauracao_vida
FROM item;

--View para exibir todas as missões, suas salas associadas e seus objetos interativos
CREATE VIEW vw_missoes_detalhes AS
SELECT m.id AS missao_id, 
       m.nome AS missao_nome, 
       m.descricao AS missao_descricao, 
       s.nome AS sala_nome, 
       oi.nome AS objeto_interativo_nome
FROM missao m
LEFT JOIN sala s ON m.sala_id = s.id
LEFT JOIN objeto_interativo oi ON m.objeto_interativo_id = oi.id;

--View para visualizar o inventário dos jogadores e os itens que possuem
CREATE VIEW vw_inventario_jogador AS
SELECT j.personagem_id AS jogador_id, 
       p.nome AS jogador_nome, 
       i.nome AS item_nome, 
       i.descricao AS item_descricao
FROM jogador j
JOIN inventario i ON j.inventario_id = i.id
JOIN item i ON i.nome = i.item_nome;

--View para mostrar todas as missões obrigatórias
CREATE VIEW vw_missoes_obrigatorias AS
SELECT m.id AS missao_id, 
       m.nome AS missao_nome, 
       m.descricao AS missao_descricao
FROM missao m
WHERE m.obrigatoriedade = TRUE;

--View para listar todos os NPCs passivos e suas missões associadas
CREATE VIEW vw_npcs_passivos_missoes AS
SELECT np.personagem_id AS npc_id, 
       np.dialogo AS npc_dialogo, 
       m.nome AS missao_nome
FROM npc_passivo np
LEFT JOIN missao m ON np.missao_id = m.id;

--View para mostrar todos os jogadores, incluindo o grupo ao qual pertencem
CREATE VIEW vw_jogadores_grupos AS
SELECT j.personagem_id AS jogador_id, 
       p.nome AS jogador_nome, 
       g.nome AS grupo_nome
FROM jogador j
JOIN grupo g ON j.grupo_id = g.id
JOIN personagem p ON j.personagem_id = p.id;

--View para visualizar os fantasmas e suas características, incluindo o item que podem carregar
CREATE VIEW vw_fantasmas_detalhes AS
SELECT f.personagem_id AS fantasma_id, 
       p.nome AS fantasma_nome, 
       f.descricao_ataque, 
       f.habilidade, 
       f.dica, 
       f.barulho, 
       f.dano_causado, 
       i.nome AS item_nome
FROM fantasma f
JOIN personagem p ON f.personagem_id = p.id
LEFT JOIN item i ON f.item_nome = i.nome;

--View para listar todos os itens em todos os inventários
CREATE VIEW vw_itens_inventarios AS
SELECT i.nome AS item_nome, 
       i.descricao AS item_descricao, 
       inv.id AS inventario_id
FROM item i
JOIN item_inventario ii ON i.nome = ii.item_nome
JOIN inventario inv ON ii.inventario_id = inv.id;
