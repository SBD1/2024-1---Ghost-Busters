-- Inserções
INSERT INTO mundo (nome, sala_atual, status, dificuldade) 
VALUES 
    ('Mundo Fácil', 'Central Park', 'concluindo', 1),
    ('Mundo Médio', 'Biblioteca', 'concluindo', 2),
    ('Mundo Difícil', 'Rua 1', 'fracassado', 3);

INSERT INTO sala (id, nome, descricao, cardinalidade_norte, cardinalidade_sul, cardinalidade_leste, cardinalidade_oeste, mundo_id) 
VALUES
    (1, 'Central Park', 'Olhando ao seu redor você consegue ver o Central Park, a grama nos seus pês e as árvores ao seu redor te trazem uma certa paz, que logo é quebrada por um barulho vibndo do bueiro do esgoto, vai ser um daqueles dias', 0, 2, 0, 0, 1),
    (2, 'Entrada do Esgoto', 'Ao descer pelo bueiro você consegue ver uma pequena correnteza de água com duas calçadas de concreto cercando-a, o ambiente é escuro, humido e fedido como um banheiro de posto, estar em um ambiente como esse quase faz querer ter feito direito como sua mãe tinha te aconselhado, se você não tivesse o melhor trabalho do mundo. Tem uma pssagem na ENTRADA SUL que parece levar você mais a fundo no esgoto e uma escada de mão na ENTRADA OESTE que te leva ao CENTRAL PARK.', 0, 0, 5, 1, 1),
    (3, 'Encruzilhada do esgoto 1', 'Olhando ao seu redor você consegue identificar algumas entradas perto de você que saem desse esgoto horrível onde você se encontra, você consegue sentir o cheiro de comida vindo da ENTRADA SUL que te faz amar esse país de novo, pela ENTRADA OESTE você consegue ver uma escadaria de pedra e pela ENTRADA OESTE você pode ir até a PORTA DE PEDRA SINISTRA.', 0, 5, 8, 4, 1),
    (4, 'Metrô de Nova York', 'Dentro do metrô você consegue ver que não tem civis presentes, o metrô é sujo, pichado e acima de tudo, assombrado, mais um dia mais um dolar, os trilhos do metrô estão em curto e tem um metrô parado no meio da estação, na ENTRADA LESTE você pode ver a escadaria de volta para o esgoto.', 0, 3, 0, 0, 1),
    (5, 'Porta sinistra do esgoto 1', 'Ao passar pelo esgoto sujo de Nova York você se depara com uma PORTA DE PEDRA SINISTRA a sua frente, a correnteza de água suja termina na ENTRADA NORTE dessa sala estranha, você pode ver outras duas passagens além da PORTA DE PEDRA SINISTRA, uma túnel na ENTRADA OESTE e uma escada na ENTRADA LESTE, se acostume com as letras em caxa alta, vai ser uma longa jornada.', 2, 0, 8, 3, 1),
    (6, 'Biblioteca', 'Subindo a escada você entra em uma biblioteca, o lugar inteiro tem cheiro e poeira, mofo e livro velho, que saudade da vovó, a biblioteca é composta por várias estantes de livros, as estantes são de madeira de carvalho e bambu como estantes. Na sala tem a ENTRADA SUL que leva você até a escada (De volta ao esgoto * Sons de agonia *) e na ENTRADA NORTE você pode ver uma porta que leva até a rua.', 0, 0, 9, 0, 2),
    (8, 'Rua 1', 'Ao seu redor você pode ver uma rua relativamente pouco movimentada, o asfalto preto com as linhas amarelas são anos luz melhores do que o esgoto, seus olhos são imediatamente atraídos pelo restaurante de onde o cheiro de comida estava saindo, na ENTRADA OESTE você pode ver o restaurante e você pode ver o BUEIRO do esgoto na ENTRADA NORTE.', 3, 0, 0, 11, 3),
    (9, 'Acampamento dos Caça Fantasmas', 'Ao seu redor você pode ver uma rua relativamente pouco movimentada, o asfalto preto com as linhas amarelas são anos luz melhores do que o esgoto, seus olhos são imediatamente atraídos pelo restaurante de onde o cheiro de comida estava saindo, na ENTRADA OESTE você pode ver o restaurante e você pode ver o BUEIRO do esgoto na ENTRADA NORTE.', 6, 0, 0, 5, 3),
    (11, 'Restaurante', 'Dentro do restaurante o cheiro de comida é hipinotizante, o lugar está estranhamente vazio e com uma gosma verde ectoplasmática nas paredes de azulejo branco, a vigilâcia sanitária devia fechar esse lugar, quase dá saudade do esgoto, quase.', 0, 8, 0, 0, 8);

INSERT INTO personagem (nome, vida, vida_atual, descricao_fisica, mundo_id, sala_id) 
VALUES
    ('Dr. Peter Venkman', 100, 100, 'Homem alto, magro, cabelo castanho escuro levemente despenteado, olhos castanhos, sorriso sarcástico e confiante. Usa uniforme bege com insígnia dos Ghostbusters no ombro e carrega equipamentos tecnológicos.', 1, 1),
    ('Dr. Raymond “Ray” Stantz', 80, 80, 'Homem de estatura média, corpo robusto, cabelo castanho claro, levemente recuado, olhos azuis, rosto amigável com um sorriso sincero. Usa uniforme bege dos Ghostbusters, com insígnia no ombro e óculos.', 1, 1),
    ('Dr. Egon Spengler', 60, 60, 'Homem alto e magro, cabelo escuro, curto e bem penteado, com um topete marcante. Usa óculos grandes, tem olhos castanhos e expressão séria. Sempre em uniforme bege dos Ghostbusters, com insígnia no ombro.', 1, 1),
    ('Slime', 70, 70, 'Ser fantasmagórico, translúcido e verde com uma textura de gosma no corpo inteiro', 1, 1),
    ('Subway Ghost', 70, 70, 'Um ser espectral com tentáculos saindo de seu rosto azul, translúcido e com textura de ferro', 1, 1),
    ('Bibliotecária', 70, 70, 'Uma mulher velha com pele translúcida de tal forma que seus órgãos ficam visíveis', 1, 1),
    ('Stay Puft', 100, 100, 'Um ser de tamanho enorme branco com textura de marshmalow, seu corpo é pesado com imensas banhas', 1, 1),
    ('Claiton', 45, 45, 'Tatuagens falsas pelo corpo, homem alto, bombado, com uma bandana vermelha e um tapa olho', 1, 1),
    ('Bobina', 100, 100, 'Uma mulher de estatura média, magra, usando um terno preto', 1, 1),
    ('Polícial Shelby', 50, 50, 'Um homem com roupa de policial, bigodão, cabelos castanhos e óculos escuros', 1, 1),
    ('Cleide', 10, 10, 'Uma senhora de cabelos brancos, ossos frágeis e pele irrugada, usa um vestido de bolinha e uma bolsa vermelha', 1, 1),
    ('Mauríio', 10, 10, 'Um garoto com os joelhos ralados e um boné colorido para traz, cabelos castanhos e mochila de escoteiro', 1, 1),
    ('Daitin', 10, 10, 'Um cara levemente acima do peso com roupas estrupiadas, calvo, barbudo, olhos vermelhos', 1, 1);

INSERT INTO atributos (id, forca, agilidade, inteligencia) 
VALUES 
    (1, 0, 10, 5), -- Dr. Peter Venkman
    (2, 10, 5, 0), -- Dr. Raymond “Ray” Stantz
    (3, 5, 0, 10); -- Dr. Egon Spengler

INSERT INTO item (nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa) 
VALUES
    ('Twinkie', 1, 'Os Twinkies são bolinhos de esponja amarela recheados com creme de baunilha, ótimos para explicações relacionadas a atividade paranormal', NULL, 10, NULL, NULL),
    ('Pernil', 1, 'Uma delícia de refeição encontrada no restaurante, acho que o Slime deixou um escapar', NULL, 20, NULL, NULL),
    ('A Atlântica mensal', 1, 'É uma revista de cultura e literatura americana, nós já aparecemos nela!!!', NULL, NULL, NULL, NULL),
    ('Galho de uma árvore encantada', 8, 'Um galho feito da madeira de uma árvore encantada, pode ser usada por qualquer pessoa com um mínimo de habilidade', NULL, NULL, 8, NULL),
    ('Mochila de Protóns', 20, 'É o equipamento principal dos caça fantasmas, ferramenta essencial do trabalho', NULL, NULL, 15, NULL),
    ('Taco de baseball ectoplasmático', 15, 'Um taco de baseball comum com ectoplasma do Slime imbuido nele, fazendo dele muito eficiente em acertar entidades sobrenaturais', NULL, NULL, 15, NULL),
    ('Facas xamãs gêmeas', 10, 'Essas facas foram encantadas por uma xamã antiga e são perfeitas para cortar seres ectoplasmáticos em dois', NULL, NULL, 15, NULL),
    ('Uniforme dos caça fantasmas', 10, 'Uma roupa feita com um tecido especial que protege o usuário dos ataques espectrais de criaturas sobrenaturais', NULL, NULL, NULL, 10),
    ('Trapos de caça fantasma', 5, 'Uma roupa improvisada feita para caçar fantasmas mais fracos, deixa o usuário menos vulnerável a ataques de seres paranormais', NULL, NULL, NULL, 5),
    ('Capacete de caçadore de fantasmas', 5, 'Um capacete feito de alumínio e um tecido antectoplasma que faz com que você sinta menos os ataques dos inimigos', NULL, NULL, NULL, 4),
    ('Capacete do Stay Puft', 10, 'Um capacete do amado mascote da industria de doces Stay Puft, mas esse parece ter sido reforçado com uma fibra de chumbo, pode proteger até de radiação', NULL, NULL, NULL, 8),
    ('Amuleto de Tutancamon', 2, 'Um pequeno amuleto com um escaravelho entalhado em seu medalhão, parece te proteger de espiritos malignos', NULL, NULL, NULL, 3),
    ('Papel alumínio', 1, 'Um pequeno rolo de papel alumíno que pode ser importante pra alguém', NULL, NULL, NULL, NULL),
    ('Bolinha do Totó', 1, 'Uma pequena bolinha de borracha vermelha com marcas de mordida e babado', NULL, NULL, NULL, NULL),
    ('Moeda', 1, 'Uma moeda do tamanho de um biscoito, aparenta ser feita de bronze.', NULL, NULL, NULL, NULL),
    ('Dinheiro', 0, 'Aparentam ser alguns dólares comuns.', 'Contratar ajudantes', NULL, NULL, NULL);

INSERT INTO grupo (nome, membro_1, membro_2, membro_3) 
VALUES 
    ('Grupo A', 'Dr. Peter Venkman', 'Claiton', NULL),
    ('Grupo B', 'Dr. Raymond “Ray” Stantz', 'Bobina', 'Policial Shelby'),
    ('Grupo C', 'Dr. Egon Spengler', NULL, NULL);

INSERT INTO inventario (id, capacidade, item_nome) 
VALUES 
    (1, 40, 'Twinkie'),
    (2, 40, 'A Atlântica Mensal'),
    (3, 40, 'Mochila de Protóns');

INSERT INTO objeto_interativo (id, nome, descricao, status, acao, item_nome) 
VALUES 
    (1, 'Porta Trancada', 'Uma porta de pedra com detalhes de fantasma entalhados.', 'trancado', 'A porta se abriu lentamente com um enorme estrondo', 'Mochila de Protóns'),
    (2, 'Alavanca', 'Uma pequena alavanca de madeira com uma base de ferro.', 'acionado', 'weeee are the champions my friends', NULL),
    (3, 'Botão', 'Uma pequena pedra que pode ser apertada para ser acionada.', 'desacionado', 'nada', NULL);

INSERT INTO missao (id, nome, ordem, descricao, status, obrigatoriedade, sala_id, objeto_interativo_id) 
VALUES 
    (1, 'Cace Fantasmas', 1, 'Nova York está infestada de atividade sobrenatural, cabe a mim resolver isso, devo exterminar o máximo de fantasmas.', 'incompleta', TRUE, 1, NULL),
    (2, 'Derrote Stay Puft', 2, 'Reunimos as moedas que estavam com os fantasmas mais fortes e abrimos o caminho, Stay Puft foi liberado, devemos derrotá-lo.', 'incompleta', TRUE, 2, NULL),
    (3, 'Salve Cleide', NULL, 'Uma senhora está sendo atacada por criaturas paranormais, devo salvá-la.', 'incompleta', FALSE, NULL, NULL),
    (4, 'Pobre Gatinho', NULL, 'O gatinho de uma senhora está sendo assombrado, ajude ela a salvar o gatinho.', 'incompleta', FALSE, NULL, NULL),
    (5, 'Maluco do chapeu aluminio', NULL, 'O maluco local está a procura de aluminio para fazer um novo chapeu ant Stay Puft.', 'incompleta', FALSE, NULL, NULL),
    (6, 'Pobre Doguinho', NULL, 'Um fantasma slimer roubou a bolinha favorita do Totó, pegue ela de volta.', 'incompleta', FALSE, NULL, NULL);

INSERT INTO jogador (personagem_id, moedas_coletadas, dinheiro, resposta, inventario_id, grupo_id, atributos_id, item_nome, missao_id) 
VALUES 
    (1, 0, 100, TRUE, 1, 1, 1, 'Twinkie', 1),
    (2, 1, 150, FALSE, 2, 2, 2, 'A Atlântica Mensal', 2),
    (3, 2, 200, TRUE, 3, 3, 3, 'Mochila de Protóns', 3);

INSERT INTO fantasma (personagem_id, descricao_ataque, habilidade, dica, barulho, dano_causado, item_nome) 
VALUES 
    (1, 'O Slime cospe ectoplasma em você.', 'O Slime atravessa uma parede e volta com uma televisão tubão', 'VAI LER UM LIVRO SEU SUINO DESCULTURADO', ' ALSJDNAOEFNAWLDNAOVEN SLIME ATRAVESSA LASJHAOLJAWLJ', 15, NULL),
    (2, 'O Fantasma do Metrô te assusta com seus tentáculos', 'Te atropela te jogando contra a parede', 'NÃO DÁ PRA PENSAR DE ESTOMAGO VAZIO', 'TCHU TCHUUUUUUUUUUUUUUUUUUUUUUUUUUUU', 15, NULL),
    (3, 'A Bibliotecária arremessa livros em você a distância', 'A Bibliotecária te ataca com vozes das histórias antigas', 'ISSO É IGAUL AO ASSASSINATO NO EXPRESSO DO ORIENTE', NULL),
    (4, 'O Stay Puft te ataca pisoteando os pés perto de você', 'Invoca os seus maiores medos, te atormentando', 'TOCA NA MINHA ALAVANCA E EU MATO VOCÊ', 30, NULL);

-- Atualizar Status de um Mundo
UPDATE mundo 
SET status = 'concluído' 
WHERE id = 1;

-- Atualizar Dificuldade de um Mundo
UPDATE mundo 
SET dificuldade = 2 
WHERE id = 2;

-- Atualizar Sala Atual de um Mundo
UPDATE mundo 
SET sala_atual = 'Biblioteca' 
WHERE id = 3;

-- Excluir um Mundo Específico
DELETE FROM mundo 
WHERE id = 1;

-- Excluir Mundos com Status "fracassado"
DELETE FROM mundo 
WHERE status = 'fracassado';

-- Excluir Todos os Itens com Peso Maior que 10
DELETE FROM item 
WHERE peso > 10;

COMMIT;