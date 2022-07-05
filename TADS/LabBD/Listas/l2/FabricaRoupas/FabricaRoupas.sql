CREATE SCHEMA FabricaRoupas;
USE FabricaRoupas;

CREATE TABLE MaquinaCostura(
    id SERIAL PRIMARY KEY,
    fabricante VARCHAR(20)
);

CREATE TABLE TipoCostura(
    tipo VARCHAR(20) PRIMARY KEY
);

CREATE TABLE PodeRealizar(
    id BIGINT UNSIGNED,
    tipo VARCHAR(20),

    CONSTRAINT FK_PodeRealizarId_MaquinaCosturaId FOREIGN KEY (id) REFERENCES MaquinaCostura(id),
    CONSTRAINT FK_PodeRealizarTipo_TipoCosturaTipo FOREIGN KEY (tipo) REFERENCES TipoCostura(tipo),
    
    CONSTRAINT PK_PodeRealizar PRIMARY KEY (id, tipo)
);

CREATE TABLE Funcionario(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(60)
);

CREATE TABLE Costureira(
    cpf VARCHAR(11) PRIMARY KEY,
    salarioMinimo FLOAT,
    acumuladoVendas FLOAT,

    CONSTRAINT FK_ConsureiraCpf_FuncionarioCpf FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE HabilidadesCostureira(
    cpf VARCHAR(11),
    tipoCostura VARCHAR(20),

    CONSTRAINT FK_HabilidadesCostureiraCpf_CostureiraCpf FOREIGN KEY (cpf) REFERENCES Costureira(cpf),
    CONSTRAINT FK_HabilidadesCostureiraTipoCostura_TipoCosturaTipo FOREIGN KEY (tipoCostura) REFERENCES TipoCostura(tipo),

    CONSTRAINT PK_HabilidadesCostureira PRIMARY KEY(cpf, tipoCostura)
);

CREATE TABLE Supervisora(
    cpf VARCHAR(11),

    CONSTRAINT FK_SupervisoraCpf_FuncionarioCpf FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE Supervisao(
    supervisora VARCHAR(11),
    costureira VARCHAR(11),

    CONSTRAINT FK_SupervisaoSupervisora_SupervisoraCpf FOREIGN KEY (supervisora) REFERENCES Supervisora(cpf),
    CONSTRAINT FK_SupervisaoCostureira_CostureiraCpf FOREIGN KEY (costureira) REFERENCES Costureira(cpf),

    CONSTRAINT PK_Supervisao PRIMARY KEY(supervisora, costureira)
);

CREATE TABLE Manutencao(
    id BIGINT UNSIGNED PRIMARY KEY,
    supervisora VARCHAR(11),

    CONSTRAINT FK_ManutencaoId_MaquinaCosturaId FOREIGN KEY (id) REFERENCES MaquinaCostura(id),
    CONSTRAINT FK_ManutencaoSupervisora_SupervisoraCpf FOREIGN KEY (supervisora) REFERENCES Supervisora(cpf)
);