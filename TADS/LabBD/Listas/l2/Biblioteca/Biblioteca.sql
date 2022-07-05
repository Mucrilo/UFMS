CREATE SCHEMA Biblioteca;
USE Biblioteca;

CREATE TABLE Livro(
    area VARCHAR(30),
    titulo VARCHAR(100),
    autores VARCHAR(200),
    editora VARCHAR(30),
    anoPublicacao int,
    isbn VARCHAR(13) PRIMARY KEY
);

CREATE TABLE Biblioteca(
    isbn VARCHAR(13) PRIMARY KEY,
    exemplares int,

    CONSTRAINT FK_BibliotecaIsbn_LivroIisbn FOREIGN KEY (isbn) REFERENCES Livro(isbn)
);

CREATE TABLE Usuario(
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(60),
    endereco TEXT
);

CREATE TABLE Telefone(
    cpf VARCHAR(11),
    telefone VARCHAR(11),

    CONSTRAINT FK_TelefoneCpf_UsuarioCpf FOREIGN KEY (cpf) REFERENCES Usuario(cpf),
    
    CONSTRAINT PK_Telefone PRIMARY KEY (cpf, telefone)
);

CREATE TABLE Emprestimo(
    isbn VARCHAR(13),
    cpf VARCHAR(11),
    dataEmprestimo DATE,
    dataDevolucao DATE,
    multa FLOAT,

    CONSTRAINT FK_EmprestimoIsbn_LivroIisbn FOREIGN KEY (isbn) REFERENCES Livro(isbn),
    CONSTRAINT FK_EmprestimoCpf_UsuarioCpf FOREIGN KEY (cpf) REFERENCES Usuario(cpf),

    CONSTRAINT PK_Emprestimo PRIMARY KEY (isbn, cpf)
);

INSERT INTO Livro VALUES ('Romance','Estrela Guia','Clarice Van Hoof, Edgar Alan Lol','Vila Nova','2022','4896547235487');
INSERT INTO Livro VALUES ('Aventura','Escada Abaixo','Tim Futon','Trista','2021','6787734554775');
INSERT INTO Livro VALUES ('Ação','Voo Alçado','Clarice Van Hoof, Edgar Alan Lol','BR DA','2012','23247897895');

INSERT INTO Biblioteca VALUES ('4896547235487','3');
INSERT INTO Biblioteca VALUES ('6787734554775','5');
INSERT INTO Biblioteca VALUES ('23247897895','1');

INSERT INTO Usuario VALUES ('421412451','Helena Ramos','Rua Julio de Castilhos, 113');
INSERT INTO Usuario VALUES ('76867867','Tereza Ramos','Tv. Thiago Loureiro, 43');
INSERT INTO Usuario VALUES ('12121213','Carol Portilho','Rua Barão de Maua, 506');

INSERT INTO Telefone VALUES ('12121213','67992942323');
INSERT INTO Telefone VALUES ('12121213','67992942324');
INSERT INTO Telefone VALUES ('76867867','27349734823');

INSERT INTO Emprestimo VALUES ('23247897895','421412451','2022-4-28','2022-5-28','50,00');

