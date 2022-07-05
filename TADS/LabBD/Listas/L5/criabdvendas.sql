
CREATE SCHEMA vendas;

SET search_path = vendas;

create table vendedor(
   codigo serial primary key,
   nome varchar(50) not null,
   ctps varchar(20) not null,
   situacao char(1) not null default 'A'
);

create table cliente(
   codigo serial primary key,
   nome varchar(50) not null,
   telefone char(10) not null
);

create table venda(
   codigo serial primary key,
   data date not null default current_date,
   codcliente int not null,
   codvendedor int not null,
   valor numeric(12, 2) not null,
   foreign key(codcliente) references cliente(codigo),
   foreign key(codvendedor) references vendedor(codigo)
);

insert into cliente(nome, telefone) values('Fulano', '1111111111');
insert into cliente(nome, telefone) values('Beltrano', '2222222222');
insert into cliente(nome, telefone) values('Sicrano', '3333333333');
insert into vendedor(nome, ctps, situacao) values('Jose', '1111', 'A');
insert into vendedor(nome, ctps, situacao) values('Maria', '2222', 'I');
insert into vendedor(nome, ctps, situacao) values('Ana', '3333', 'A');
insert into vendedor(nome, ctps, situacao) values('Henrique', '4444', 'I');
insert into vendedor(nome, ctps, situacao) values('Pedro', '5555', 'I');
insert into venda(data, codcliente, codvendedor, valor) values('2011-09-06', 1, 1, 200);
insert into venda(data, codcliente, codvendedor, valor) values('2012-06-09', 2, 2, 100);
insert into venda(data, codcliente, codvendedor, valor) values('2013-02-01', 3, 1, 1200);
insert into venda(data, codcliente, codvendedor, valor) values('2010-05-30', 2, 3, 1700);
insert into venda(data, codcliente, codvendedor, valor) values('2012-02-01', 1, 4, 1900);
insert into venda(data, codcliente, codvendedor, valor) values('2010-01-13', 1, 4, 500);
insert into venda(data, codcliente, codvendedor, valor) values('2013-03-01', 2, 1, 700);
insert into venda(data, codcliente, codvendedor, valor) values('2011-03-14', 1, 2, 350);
insert into venda(data, codcliente, codvendedor, valor) values('2012-03-22', 3, 1, 900);
insert into venda(data, codcliente, codvendedor, valor) values('2010-03-01', 1, 3, 5000);
insert into venda(data, codcliente, codvendedor, valor) values('2014-11-03', 3, 1, 1000);
insert into venda(data, codcliente, codvendedor, valor) values('2010-06-01', 1, 3, 2000);
insert into venda(data, codcliente, codvendedor, valor) values('2012-04-26', 1, 1, 3000);
insert into venda(data, codcliente, codvendedor, valor) values('2010-08-28', 1, 4, 4000);
