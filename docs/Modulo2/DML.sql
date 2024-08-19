BEGIN TRANSACTION;

INSERT INTO mundo (nome, sala_atual, status, dificuldade) VALUES
    ('Mundo 1', 'Central Park', 'Concluindo', 1)
    ('Mundo 2', 'Rua 1', 'Fracassado', 2)
    ('Mundo 3', 'Porta sinistra do esgoto 1', 3)

INSERT INTO sala (id, nome, descricao, cardinalidade_norte, cardinalidade_leste, cardinalidade_sul, cardinalidade_oeste) VALUES
    (1, 'Central Park', 'Olhando ao seu redor você consegue ver o Central Park, a grama nos seus pês e as árvores ao seu redor te trazem uma certa paz, que logo é quebrada por um barulho vibndo do bueiro do esgoto, vai ser um daqueles dias', 0, 2, 0, 0 ),
    (2, 'Entrada do Esgoto', 'Ao descer pelo bueiro você consegue ver uma pequena correnteza de água com duas calçadas de concreto cercando-a, o ambiente é escuro, humido e fedido como um banheiro de posto, estar em um ambiente como esse quase faz querer ter feito direito como sua mãe tinha te aconselhado, se você não tivesse o melhor trabalho do mundo. Tem uma pssagem na ENTRADA SUL que parece levar você mais a fundo no esgoto e uma escada de mão na ENTRADA OESTE que te leva ao CENTRAL PARK.', 0, 0, 5, 1),
    (3, 'Encruzilhada do esgoto 1', 'Olhando ao seu redor você consegue identificar algumas entradas perto de você que saem desse esgoto horrível onde você se encontra, você consegue sentir o cheiro de comida vindo da ENTRADA SUL que te faz amar esse país de novo, pela ENTRADA OESTE você consegue ver uma escadaria de pedra e pela ENTRADA OESTE você pode ir até a PORTA DE PEDRA SINISTRA.', 0, 5, 8, 4),
    (4, 'Metrô de Nova York', 'Dentro do metrô você consegue ver que não tem civis presentes, o metrô é sujo, pichado e acima de tudo, assombrado, mais um dia mais um dolar, os trilhos do metrô estão em curto e tem um metrô parado no meio da estação, na ENTRADA LESTE você pode ver a escadaria de volta para o esgoto.', 0, 3, 0, 0),
    (5, 'Porta sinistra do esgoto 1', 'Ao passar pelo esgoto sujo de Nova York você se depara com uma PORTA DE PEDRA SINISTRA a sua frente, a correnteza de água suja termina na ENTRADA NORTE dessa sala estranha, você pode ver outras duas passagens além da PORTA DE PEDRA SINISTRA, uma túnel na ENTRADA OESTE e uma escada na ENTRADA LESTE, se acostume com as letras em caxa alta, vai ser uma longa jornada.', 2, 0, 8, 3),
    (6, 'Biblioteca', 'Subindo a escada você entra em uma biblioteca, o lugar inteiro tem cheiro e poeira, mofo e livro velho, que saudade da vovó, a biblioteca é composta por várias estantes de livros, as estantes são de madeira de carvalho e bambu como estantes. Na sala tem a ENTRADA SUL que leva você até a escada (De volta ao esgoto * Sons de agonia *) e na ENTRADA NORTE você pode ver uma porta que leva até a rua.', 0, 0, 9, 0),
    (8, 'Rua 1', 'Ao seu redor você pode ver uma rua relativamente pouco movimentada, o asfalto preto com as linhas amarelas são anos luz melhores do que o esgoto, seus olhos são imediatamente atraídos pelo restaurante de onde o cheiro de comida estava saindo, na ENTRADA OESTE você pode ver o restaurante e você pode ver o BUEIRO do esgoto na ENTRADA NORTE.', 3, 0, 0, 11),
    (9, 'Acampamento dos Caça Fantasmas', 'Ao seu redor você pode ver uma rua relativamente pouco movimentada, o asfalto preto com as linhas amarelas são anos luz melhores do que o esgoto, seus olhos são imediatamente atraídos pelo restaurante de onde o cheiro de comida estava saindo, na ENTRADA OESTE você pode ver o restaurante e você pode ver o BUEIRO do esgoto na ENTRADA NORTE.', 6, 0, 0, 5);
    (11, 'Restaurante', 'Dentro do restaurante o cheiro de comida é hipinotizante, o lugar está estranhamente vazio e com uma gosma verde ectoplasmática nas paredes de azulejo branco, a vigilâcia sanitária devia fechar esse lugar, quase dá saudade do esgoto, quase.', 0, 8, 0, 0);


INSERT INTO personagem (nome, vida, vida_atual, descricao_fisica) VALUES
    ('Dr. Peter Venkman', 100, 100, 'Homem alto, magro, cabelo castanho escuro levemente despenteado, olhos castanhos, sorriso sarcástico e confiante. Usa uniforme bege com insígnia dos Ghostbusters no ombro e carrega equipamentos tecnológicos.', ),
    ('Dr. Raymond “Ray” Stantz', 80, 80, 'Homem de estatura média, corpo robusto, cabelo castanho claro, levemente recuado, olhos azuis, rosto amigável com um sorriso sincero. Usa uniforme bege dos Ghostbusters, com insígnia no ombro e óculos.'),
    ('Dr. Egon Spengler', 60, 60, 'Homem alto e magro, cabelo escuro, curto e bem penteado, com um topete marcante. Usa óculos grandes, tem olhos castanhos e expressão séria. Sempre em uniforme bege dos Ghostbusters, com insígnia no ombro.');

INSERT INTO atributos (id, forca, agilidade, inteligencia) VALUES
    (101,7, 5, 8),
    (102, 4, 9, 6),
    (103, 10, 3, 7);


INSERT INTO item (nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa) VALUES
    ('Twinkie', 1,'Os Twinkies são bolinhos de esponja amarela recheados com creme de baunilha, ótimos para explicações relacionadas a atividade paranormal',NULL,10,NULL,NULL),
    ('A Atlântica mensal', 1,'É uma revista de cultura e literatura americana, nós já aparecemos nela!!!',NULL,NULL,NULL,NULL),
    ('Mochila de Protóns', 20,'É o equipamento principal dos caça fantasmas, ferramenta essencial do trabalho',NULL,NULL,10,NULL),
    

INSERT INTO grupo (nome, membro_1, membro_2, membro_3) VALUES
    ('Ghostbusters Original', 'Peter Venkman', 'Ray Stantz', 'Egon Spengler'),
    ('Investigadores Paranormais', 'Peter Venkman', 'Egon Spengler', NULL),
    ('Equipe Científica', 'Egon Spengler', 'Ray Stantz', NULL);

INSERT INTO inventario (capacidade) VALUES
    (40);

INSERT INTO objeto_interativo (nome, descricao, status, acao) VALUES
    ('Porta trancada', 'Uma porta de pedra com detalhes de fantasma entalhados', 'Trancada', 'Destrancar a porta usando a chave'),
    ('Alavanca', 'uma pequena alavanca de madeira com uma base de ferro', 'Desacionada', 'Acionar a alavanca'),
    ('Botão', 'Uma pequena pedra que pode ser apertada para ser acionada', 'Acionado', 'Apertar o botáo');


INSERT INTO missao (nome, ordem, descricao, status, obrigatoriedade) VALUES
    ('Cace Fantasmas', 1 , 'Nova York está infestada de atividade sobrenatural, cabe a mim resolver isso, devo exterminar o máximo  de fantasmsas, vou procurar a origem do evento', 'incompleta', 'TRUE'),
    ('Derrote Stay Puft', 2 , 'Reunimos as moedas que estavam com os fantasmas mais fortes e abrimos o caminho, Stay Puft foi liberado, devemos derrota-lo', 'incompleta', 'TRUE'),
    ('Salve Cleide', NULL , 'Uma senhora está sendo atacada por criaturas paranormais, devo salva-la', 'incompleta', 'FALSE');


INSERT INTO jogador (moedas_coletadas, dinheiro, resposta) VALUES
    (3, 100, TRUE),
    (2, 50, FALSE),
    (3, 90, TRUE);
    
INSERT INTO fantasma (descricao_ataque, habilidade, dica, barulho, dano_causado) VALUES 
    ('O Slime cospe ectoplasma em você.', 'O Slime atravessa uma parede e volta com uma televisão tubão', 'VAI LER UM LIVRO SEU SUINO DESCULTURADO', ' ALSJDNAOEFNAWLDNAOVEN SLIME ATRAVESSA LASJHAOLJAWLJ', 15)
    ('O Fantasma do Metrô te assusta com seus tentáculos', 'Te atropela te jogando contra a parede', 'SE VOCÊ ME ACHOU RUIM IMAGINA O GRANDÃO', 'TCHU TCHUUUUUUUUUUUUUUUUUUUUUUUUUUUU', 15)
    ('O Stay Puft te ataca pisoteando os pés perto de você', 'Invoca os seus maiores medos, te atormentando', 'TOCA NA MINHA ALAVANCA E EU MATO VOCÊ', 30)

INSERT INTO npc_contratado (dano, preco, defesa, descricao_ataque, situacao) VALUES
    (5, 50 , NULL , 'Ele entra em pânico e utiliza de maneira errônea o equipamento, porém ainda assim, de alguma maneira, acerta causando dano considerável', 'FALSE'),
    (10, 150 , 5 , 'Com certa maestria ele dispara a mochila de protóns com sucesso', 'FALSE'),
    (15, 200 , 10 , 'Com um reposicionamento veloz e agressivo, ele consegue acertar diretamente nos pontos fracos do fantasma', 'FALSE');







COMMIT;