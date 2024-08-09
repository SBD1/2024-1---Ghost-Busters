BEGIN;

-- Tabela de Mundo
CREATE TABLE mundo (
    id SERIAL PRIMARY KEY,
    dificuldade INT NOT NULL
);

-- Tabela de Lugar
CREATE TABLE lugar (
    id VARCHAR(50) PRIMARY KEY,
    descricao TEXT NOT NULL,
    id_mundo INT NOT NULL
    CONSTRAINT fk_mundo FOREIGN KEY (id_mundo) REFERENCES mundo(id) ON DELETE CASCADE
);

-- Tabela de Personagem
CREATE TABLE personagem (
    nome VARCHAR(30) PRIMARY KEY,
    vida INT NOT NULL,
    caracteristicas TEXT NOT NULL
);

-- Tabela de PC (subtipo de Personagem)
CREATE TABLE pc (
    nome VARCHAR(30) PRIMARY KEY,
    id_lugar INT NOT NULL,
    CONSTRAINT fk_personagem_pc FOREIGN KEY (nome) REFERENCES personagem(nome) ON DELETE CASCADE,
    CONSTRAINT fk_lugar_pc FOREIGN KEY (id_lugar) REFERENCES lugar(id) ON DELETE CASCADE
);

-- Tabela de NPC (subtipo de Personagem)
CREATE TABLE npc (
    nome VARCHAR(30) PRIMARY KEY,
    habilidade TEXT NOT NULL,
    numeracao_fase INT NOT NULL,
    CONSTRAINT fk_personagem_npc FOREIGN KEY (nome) REFERENCES personagem(nome) ON DELETE CASCADE,
    CONSTRAINT fk_fase_npc FOREIGN KEY (numeracao_fase) REFERENCES fase(numeracao) ON DELETE CASCADE
);


-- Tabela de Fase
CREATE TABLE fase (
    numeracao INT PRIMARY KEY,
    id_lugar INT NOT NULL,
    CONSTRAINT fk_lugar_fase FOREIGN KEY (id_lugar) REFERENCES lugar(id) ON DELETE CASCADE
);

-- Tabela de Diálogo
CREATE TABLE dialogo (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    nome_personagem VARCHAR(30) NOT NULL,
    CONSTRAINT fk_personagem FOREIGN KEY (nome_personagem) REFERENCES personagem(nome) ON DELETE CASCADE
);

-- Tabela de Equipamento
CREATE TABLE equipamento (
    nome VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL,
    ataque TEXT NOT NULL,
    dano INT NOT NULL,
    nome_pc VARCHAR(30) NOT NULL,
    CONSTRAINT fk_pc_equipamento FOREIGN KEY (nome_pc) REFERENCES pc(nome) ON DELETE CASCADE
);

-- Tabela de Coisa Ruim
CREATE TABLE coisa_ruim (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    consequencia TEXT NOT NULL,
    numeracao_fase INT NOT NULL,
    CONSTRAINT fk_fase FOREIGN KEY (numeracao_fase) REFERENCES fase(numeracao) ON DELETE CASCADE
);

COMMIT;
