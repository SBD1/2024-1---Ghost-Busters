BEGIN;

-- Tabela Personagem
CREATE TABLE personagem (
    nome VARCHAR(30) PRIMARY KEY,
    vida INT NOT NULL,
    caracteristicas TEXT NOT NULL,
    tipo VARCHAR(3) CHECK (tipo IN ('PC', 'NPC'))
);

-- Tabela de Habilidade para NPCs
CREATE TABLE habilidade_npc (
    nome VARCHAR(30) PRIMARY KEY,
    habilidade TEXT NOT NULL,
    CONSTRAINT fk_personagem_habilidade FOREIGN KEY (nome) REFERENCES personagem(nome) ON DELETE CASCADE
);

-- Tabela Diálogo
CREATE TABLE dialogo (
    id_dial SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    nome_personagem VARCHAR(30) NOT NULL,
    CONSTRAINT fk_personagem_dialogo FOREIGN KEY (nome_personagem) REFERENCES personagem(nome) ON DELETE CASCADE
);

-- Tabela Equipamento
CREATE TABLE equipamento (
    nome_equi VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL,
    ataque TEXT NOT NULL,
    dano INT NOT NULL,
    nome_personagem VARCHAR(30) NOT NULL,
    CONSTRAINT fk_personagem_equipamento FOREIGN KEY (nome_personagem) REFERENCES personagem(nome) ON DELETE CASCADE
);

-- Tabela Lugar
CREATE TABLE lugar (
    id_lugar VARCHAR(50) PRIMARY KEY,
    descricao TEXT NOT NULL
);

-- Tabela Fase
CREATE TABLE fase (
    numeracao SERIAL PRIMARY KEY,
    id_mundo INT NOT NULL,
    CONSTRAINT fk_mundo_fase FOREIGN KEY (id_mundo) REFERENCES mundo(id_mundo) ON DELETE CASCADE
);

-- Tabela Mundo
CREATE TABLE mundo (
    id_mundo SERIAL PRIMARY KEY,
    dificuldade INT NOT NULL
);

-- Tabela Coisa Ruim
CREATE TABLE coisa_ruim (
    id_cr SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    consequencia TEXT NOT NULL,
    numeracao_fase INT NOT NULL,
    CONSTRAINT fk_fase_coisa_ruim FOREIGN KEY (numeracao_fase) REFERENCES fase(numeracao) ON DELETE CASCADE
);
