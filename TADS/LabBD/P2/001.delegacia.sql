CREATE SCHEMA delegacia;

SET search_path = delegacia;

CREATE TABLE vitima(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    datanasc DATE,

    CONSTRAINT vitima_nome_unique UNIQUE(nome)
);

CREATE TABLE telefone_operadora(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,

    CONSTRAINT telefone_operadora_nome_unique UNIQUE(nome)
);

CREATE TABLE telefone(
    codigo SERIAL PRIMARY KEY,
    vitima_codigo INTEGER,
    telefone_operadora_codigo INTEGER,
    ddd VARCHAR(3) NOT NULL,
    numero VARCHAR(9) NOT NULL,
    tipo VARCHAR(15) NOT NULL DEFAULT '_RESIDENCIAL_' CHECK(tipo IN ('_RESIDENCIAL_','_COMERCIAL_','_RECADO_','_CELULAR_')),
    
    CONSTRAINT telefone_telefone_operadora_fk FOREIGN KEY (telefone_operadora_codigo) REFERENCES telefone_operadora(codigo) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT telefone_vitima_fk FOREIGN KEY (vitima_codigo) REFERENCES vitima(codigo) ON UPDATE CASCADE ON DELETE RESTRICT

);

CREATE TABLE tipo_ocorrencia(
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT tipo_ocorrencia_unique UNIQUE(nome)
);

CREATE TABLE bo(
    codigo SERIAL PRIMARY KEY,
    vitima_codigo INTEGER,
    tipo_ocorrencia_codigo INTEGER,
    local_cidade VARCHAR(30),
    local_estado VARCHAR(2),
    data_ocorrencia TIMESTAMP,
    descricao TEXT,

    CONSTRAINT bo_tipo_ocorrencia_fk FOREIGN KEY (tipo_ocorrencia_codigo) REFERENCES tipo_ocorrencia(codigo) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT bo_vitima_fk FOREIGN KEY (vitima_codigo) REFERENCES vitima(codigo) ON UPDATE CASCADE ON DELETE RESTRICT
);