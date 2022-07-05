CREATE SCHEMA Concessionaria;
USE Concessionaria;

CREATE TABLE Marca(
    marca VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Modelo(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(20),
    modelo VARCHAR(20),

    CONSTRAINT FK_ModeloMarca_MarcaMarca FOREIGN KEY (marca) REFERENCES Marca(marca)
);

CREATE TABLE Veiculo(
    chassi VARCHAR(20) PRIMARY KEY,
    placa VARCHAR(10),
    cor VARCHAR(20),
    anoFabricacao DATE,
    quilometragem INT,
    marcaModelo INT,

    CONSTRAINT FK_VeiculoMarcaModelo_ModeloId FOREIGN KEY (marcaModelo) REFERENCES Modelo (id)
);

CREATE TABLE Pessoa(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(30),
    estadoCivil VARCHAR(10),
    nomeConjuge VARCHAR(30),
    cpfConjuge VARCHAR(11)
);

CREATE TABLE Corretor(
    matricula int PRIMARY KEY,
    nome VARCHAR(30),
    dataAdmissao DATE
);

CREATE TABLE Venda(
    data DATE,
    valor float,
    comissao float,
    cpf VARCHAR(11),
    matricula int,
    chassi VARCHAR(20) PRIMARY KEY,

    CONSTRAINT FK_VendaCpf_PessoaCpf FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    CONSTRAINT FK_VendaMatricula_CorretorMatricula FOREIGN KEY (matricula) REFERENCES Corretor(matricula),
    CONSTRAINT FK_VendaChassi_VeiculoChassi FOREIGN KEY (chassi) REFERENCES Veiculo(chassi)
);

INSERT INTO Marca VALUES ('Fiat');
INSERT INTO Marca VALUES ('Tesla');

INSERT INTO Modelo VALUES ('Fiat','Palio');
INSERT INTO Modelo VALUES ('Tesla','Model A');
