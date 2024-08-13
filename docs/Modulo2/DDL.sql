BEGIN;

CREATE TABLE Personagem (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DescricaoFisica TEXT,
    Forca INT CHECK (Forca >= 0),
    Agilidade INT CHECK (Agilidade >= 0),
    Inteligencia INT CHECK (Inteligencia >= 0),
    VidaInicial INT CHECK (VidaInicial > 0)
);

CREATE TABLE Mundo (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Dificuldade INT CHECK (Dificuldade IN (1, 2, 3)),
    Status VARCHAR(20),
    ID_Personagem INT REFERENCES Personagem(ID),
    VidaAtual INT CHECK (VidaAtual > 0),
    FaseAtual INT,
    MoedasColetadas INT DEFAULT 0,
    FantasmasDerrotados INT DEFAULT 0
);

CREATE TABLE Fase (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Ordem INT,
    ID_Mundo INT REFERENCES Mundo(ID),
    CoisaRuim TEXT
);

CREATE TABLE Sala (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    ID_Fase INT REFERENCES Fase(ID),
    Ordem INT,
    VidaRestaurada INT CHECK (VidaRestaurada BETWEEN 4 AND 8)
);

CREATE TABLE Arma (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DescricaoFisica TEXT,
    DanoMedio INT CHECK (DanoMedio > 0),
    DescricaoAtaque TEXT,
    Tipo VARCHAR(20) CHECK (Tipo IN ('Forca', 'Agilidade', 'Inteligencia'))
);

CREATE TABLE PersonagemArma (
    ID SERIAL PRIMARY KEY,
    ID_Personagem INT REFERENCES Personagem(ID),
    ID_Arma INT REFERENCES Arma(ID)
);

CREATE TABLE Fantasma (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Vida INT CHECK (Vida > 0),
    AtaqueEspecial TEXT,
    Barulhos TEXT,
    DropaMoeda BOOLEAN,
    Ordem INT,
    Dica TEXT,
    ID_Sala INT REFERENCES Sala(ID)
);

COMMIT;
