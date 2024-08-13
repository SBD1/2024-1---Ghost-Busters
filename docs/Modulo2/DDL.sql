BEGIN;

CREATE TABLE personagem (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao_fisica TEXT NOT NULL,
    forca INT CHECK (forca >= 0) NOT NULL,
    agilidade INT CHECK (agilidade >= 0) NOT NULL,
    inteligencia INT CHECK (inteligencia >= 0) NOT NULL,
    vida_inicial INT CHECK (vida_inicial > 0) NOT NULL
);

CREATE TABLE mundo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    dificuldade INT CHECK (dificuldade IN (1, 2, 3)) NOT NULL,
    status VARCHAR(20) NOT NULL,
    id_personagem INT REFERENCES personagem(ID) NOT NULL,
    vida_atual INT CHECK (vida_atual > 0) NOT NULL,
    fase_atual INT NOT NULL,
    moedas_coletadas INT DEFAULT 0 NOT NULL,
    fantasmas_derrotados INT DEFAULT 0 NOT NULL
);

CREATE TABLE fase (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    ordem INT NOT NULL,
    id_mundo INT REFERENCES mundo(id) NOT NULL,
    coisa_ruim TEXT
);

CREATE TABLE sala (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    id_fase INT REFERENCES fase(id) NOT NULL,
    ordem INT NOT NULL,
    vida_restaurada INT CHECK (vida_restaurada BETWEEN 4 AND 8)
);

CREATE TABLE arma (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao_fisica TEXT NOT NULL,
    dano_medio INT CHECK (dano_medio > 0) NOT NULL,
    descricao_ataque TEXT NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('forca', 'agilidade', 'inteligencia')) NOT NULL
);

CREATE TABLE personagemarma (
    id SERIAL PRIMARY KEY,
    id_personagem INT REFERENCES personagem(id) NOT NULL,
    id_arma INT REFERENCES arma(id) NOT NULL
);

CREATE TABLE fantasma (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    vida INT CHECK (vida > 0) NOT NULL,
    ataque_especial TEXT NOT NULL,
    barulhos TEXT NOT NULL,
    dropa_moeda BOOLEAN NOT NULL,
    ordem INT NOT NULL,
    dica TEXT NOT NULL,
    id_sala INT REFERENCES sala(id) NOT NULL
);

COMMIT;
