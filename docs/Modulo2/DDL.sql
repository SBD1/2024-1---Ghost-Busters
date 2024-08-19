BEGIN;

CREATE TABLE mundo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sala_atual VARCHAR(30) NOT NULL,
    status VARCHAR(10) NOT NULL,
    dificuldade INT NOT NULL
);

CREATE TABLE sala (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    cardinalidade_norte INT NOT NULL,
    cardinalidade_sul INT NOT NULL,
    cardinalidade_leste INT NOT NULL,
    cardinalidade_oeste INT NOT NULL,
    mundo_id SERIAL REFERENCES mundo(id)
);

CREATE TABLE personagem (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    vida INT NOT NULL,
    vida_atual INT NOT NULL,
    descricao_fisica TEXT NOT NULL,
    mundo_id SERIAL REFERENCES mundo(id),
    sala_id INT REFERENCES sala(id)
);

CREATE TABLE atributos (
    id INT PRIMARY KEY,
    forca INT NOT NULL,
    agilidade INT NOT NULL,
    inteligencia INT NOT NULL
);

CREATE TABLE item (
    nome VARCHAR(30) PRIMARY KEY,
    peso INT NOT NULL,
    descricao TEXT NOT NULL,
    utilidade VARCHAR(60),
    restauracao_vida INT,
    dano INT,
    pontos_de_defesa INT
);

CREATE TABLE grupo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    membro_1 VARCHAR(30) NOT NULL,
    membro_2 VARCHAR(30),
    membro_3 VARCHAR(30)
);

CREATE TABLE inventario (
    id SERIAL PRIMARY KEY,
    capacidade INT NOT NULL,
    item_nome VARCHAR(30) REFERENCES item(nome)
);

CREATE TABLE objeto_interativo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    status VARCHAR(20) NOT NULL,
    acao TEXT NOT NULL,
    item_nome VARCHAR(30) REFERENCES item(nome)
);

CREATE TABLE missao (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    ordem INT NOT NULL,
    descricao TEXT NOT NULL,
    status VARCHAR(20) NOT NULL,
    obrigatoriedade BOOLEAN NOT NULL,
    sala_id INT REFERENCES sala(id),
    objeto_interativo_id SERIAL REFERENCES objeto_interativo(id)
);

CREATE TABLE jogador (
    personagem_id SERIAL PRIMARY KEY REFERENCES personagem(id),
    moedas_coletadas INT NOT NULL,
    dinheiro INT NOT NULL,
    resposta BOOLEAN NOT NULL,
    inventario_id SERIAL REFERENCES inventario(id),
    grupo_id SERIAL REFERENCES grupo(id),
    atributos_id SERIAL REFERENCES atributos(id),
    item_nome VARCHAR(30) REFERENCES item(nome),
    missao_id SERIAL REFERENCES missao(id)
);

CREATE TABLE fantasma (
    personagem_id SERIAL PRIMARY KEY REFERENCES personagem(id),
    descricao_ataque TEXT NOT NULL,
    habilidade TEXT,
    dica TEXT,
    barulho VARCHAR(20),
    dano_causado INT NOT NULL,
    item_nome VARCHAR(30) REFERENCES item(nome)
);

CREATE TABLE npc_passivo (
    personagem_id SERIAL PRIMARY KEY REFERENCES personagem(id),
    dialogo TEXT NOT NULL,
    missao_id SERIAL REFERENCES missao(id),
    item_nome VARCHAR(30) REFERENCES item(nome)
);

CREATE TABLE npc_contratado (
    personagem_id INT PRIMARY KEY REFERENCES personagem(id),
    dano INT NOT NULL,
    preco INT NOT NULL,
    defesa INT NOT NULL,
    descricao_ataque TEXT NOT NULL,
    situacao BOOLEAN NOT NULL,
    grupo_id SERIAL REFERENCES grupo(id)
);

-- Relacionamentos

CREATE TABLE mundo_sala (
    mundo_id SERIAL REFERENCES mundo(id),
    sala_id INT REFERENCES sala(id),
    PRIMARY KEY (mundo_id, sala_id)
);

CREATE TABLE mundo_personagem (
    mundo_id SERIAL REFERENCES mundo(id),
    personagem_id SERIAL REFERENCES personagem(id),
    PRIMARY KEY (mundo_id, personagem_id)
);

CREATE TABLE jogador_item (
    jogador_id SERIAL REFERENCES jogador(personagem_id),
    item_nome VARCHAR(30) REFERENCES item(nome),
    PRIMARY KEY (jogador_id, item_nome)
);

CREATE TABLE item_inventario (
    item_nome SERIAL REFERENCES item(nome),
    inventario_id SERIAL REFERENCES inventario(id),
    PRIMARY KEY (item_nome, inventario_id)
);

COMMIT;
