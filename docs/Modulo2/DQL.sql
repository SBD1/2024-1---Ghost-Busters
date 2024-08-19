-- Selecionar todos os registros da tabela mundo
SELECT * FROM mundo;

-- Selecionar todos os registros da tabela sala
SELECT * FROM sala;

-- Selecionar todos os registros da tabela personagem
SELECT * FROM personagem;

-- Selecionar todos os registros da tabela atributos
SELECT * FROM atributos;

-- Selecionar todos os registros da tabela item
SELECT * FROM item;

-- Selecionar todos os registros da tabela grupo
SELECT * FROM grupo;

-- Selecionar todos os registros da tabela inventario
SELECT * FROM inventario;

-- Selecionar todos os registros da tabela inventario_item
SELECT * FROM inventario_item;

-- Selecionar todos os registros da tabela objeto_interativo
SELECT * FROM objeto_interativo;

-- Selecionar todos os registros da tabela missao
SELECT * FROM missao;

-- Selecionar todos os registros da tabela jogador
SELECT * FROM jogador;

-- Selecionar todos os registros da tabela fantasma
SELECT * FROM fantasma;

-- Selecionar todos os registros da tabela npc_passivo
SELECT * FROM npc_passivo;

-- Selecionar todos os registros da tabela npc_contratado
SELECT * FROM npc_contratado;

-- Selecionar todos os registros da tabela mundo_sala
SELECT * FROM mundo_sala;

-- Selecionar todos os registros da tabela mundo_personagem
SELECT * FROM mundo_personagem;

-- Selecionar todos os registros da tabela jogador_item
SELECT * FROM jogador_item;

-- Selecionar todos os registros da tabela item_inventario
SELECT * FROM item_inventario;


--Selecionar todos os personagens de um mundo específico (Substitua X pelo ID do mundo desejado):
SELECT * 
FROM personagem 
WHERE mundo_id = X;  

--Selecionar todos os itens em um inventário específico (Substitua X pelo ID do inventário desejado):
SELECT item.* 
FROM item
JOIN inventario_item ON item.id = inventario_item.item_id
WHERE inventario_item.inventario_id = X;  

--Selecionar todas as missões associadas a uma determinada sala (Substitua X pelo ID da sala desejada):
SELECT * 
FROM missao 
WHERE sala_id = X;  

--Selecionar todos os jogadores com um item específico(Substitua 'X' pelo nome do item desejado):
SELECT jogador.* 
FROM jogador
JOIN jogador_item ON jogador.personagem_id = jogador_item.jogador_id
JOIN item ON jogador_item.item_id = item.id
WHERE item.nome = 'X';  

--Selecionar todos os NPCs passivos com uma missão específica(Substitua 'Salvar a Princesa' pelo nome da missão desejada):
SELECT npc_passivo.* 
FROM npc_passivo
JOIN missao ON npc_passivo.missao_id = missao.id
WHERE missao.nome = 'X';  

--Selecionar todos os grupos que contêm um NPC contratado específico (Substitua X pelo ID do NPC contratado desejado):
SELECT grupo.* 
FROM grupo
JOIN npc_contratado ON grupo.id = npc_contratado.grupo_id
WHERE npc_contratado.personagem_id = X;  

--Selecionar todos os mundos com dificuldade maior que 1:
SELECT * 
FROM mundo 
WHERE dificuldade > 1;

--Selecionar todas as salas em um mundo específico (Substitua X pelo ID do mundo desejado):
SELECT * 
FROM sala 
WHERE mundo_id = X; 

--Selecionar todos os personagens com vida maior que 30:
SELECT * 
FROM personagem 
WHERE vida > 30;

--Selecionar todos os personagens em uma sala específica (Substitua X pelo ID da sala desejada):
SELECT * 
FROM personagem 
WHERE sala_id = X;  

--Selecionar atributos de um personagem específico (Substitua X pelo ID do personagem desejado):
SELECT * 
FROM atributos 
WHERE id = X;  

--Selecionar todos os itens de um tipo específico(Substitua 'X' pelo tipo de item desejado):
SELECT * 
FROM item 
WHERE tipo = 'X';  

--Selecionar todos os membros de um grupo específico (Substitua X pelo ID do grupo desejado):
SELECT * 
FROM grupo 
WHERE id = X;  

--Selecionar todos os itens em um inventário específico (Substitua X pelo ID do inventário desejado):
SELECT item.* 
FROM item
JOIN inventario_item ON item.id = inventario_item.item_id
WHERE inventario_item.inventario_id = X;  

--Selecionar todas as ações de um objeto interativo específico (Substitua X pelo ID do objeto interativo desejado):
SELECT acao 
FROM objeto_interativo 
WHERE id = X; 

--Selecionar todas as missões obrigatórias:
SELECT * 
FROM missao 
WHERE obrigatoriedade = TRUE;

--Selecionar todas as missões associadas a uma determinada sala (Substitua X pelo ID da sala desejada):
SELECT * 
FROM missao 
WHERE sala_id = X;  

--Selecionar todas as missões associadas a um determinado objeto interativo (Substitua X pelo ID do objeto interativo desejado):
SELECT * 
FROM missao 
WHERE objeto_interativo_id = X;  

--Selecionar jogadores com mais de 1 moeda coletada:
SELECT * 
FROM jogador 
WHERE moedas_coletadas > 1;

--Selecionar todos os itens de um jogador específico (Substitua X pelo ID do jogador desejado):
SELECT item.* 
FROM item
JOIN jogador_item ON item.id = jogador_item.item_id
WHERE jogador_item.jogador_id = X;  

--Selecionar todos os fantasmas com dano causado maior que 5:
SELECT * 
FROM fantasma 
WHERE dano_causado > 5;

--Selecionar todos os NPCs passivos com uma missão específica (Substitua X pelo ID da missão desejada):
SELECT npc_passivo.* 
FROM npc_passivo
JOIN missao ON npc_passivo.missao_id = missao.id
WHERE missao.id = X;  

--Selecionar todos os NPCs contratados com preço menor que 50:
SELECT * 
FROM npc_contratado 
WHERE preco < 50;

--Selecionar nomes e dificuldades de todos os mundos:
SELECT nome, dificuldade 
FROM mundo;

--Selecionar nomes e descrições de todas as salas:
SELECT nome, descricao 
FROM sala;

--Selecionar nomes e vida atual de todos os personagens:
SELECT nome, vida_atual 
FROM personagem;

--Selecionar força, agilidade e inteligência dos atributos de um personagem específico (Substitua X pelo ID do personagem desejado):
SELECT forca, agilidade, inteligencia 
FROM atributos 
WHERE id = X;  

--Selecionar nomes e pesos de todos os itens:
SELECT nome, peso 
FROM item;

--Selecionar nomes dos membros de um grupo específico(Substitua X pelo ID do grupo desejado):
SELECT nome, membro_1, membro_2, membro_3 
FROM grupo 
WHERE id = X;  

--Selecionar nomes e descrições de todos os objetos interativos:
SELECT nome, descricao 
FROM objeto_interativo;

--Selecionar nomes e status de todas as missões:
SELECT nome, status 
FROM missao;

--Selecionar moedas coletadas e dinheiro de todos os jogadores:
SELECT moedas_coletadas, dinheiro 
FROM jogador;

--Selecionar descrições de ataque e dano causado de todos os fantasmas:
SELECT descricao_ataque, dano_causado 
FROM fantasma;
