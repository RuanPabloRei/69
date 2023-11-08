create database bd_69;
use bd_69;

create table cliente(
id_cliente int not null auto_increment,
nome_cliente varchar(100),
cpf varchar(14),
data_nasc int,
email_cli varchar(150),
telefone varchar(14),
primary key(id_cliente)
);

create table loc_atual(
id_locAtual int not null auto_increment,
pais varchar(100),
estado varchar(100),
cidade varchar(100),
rua varchar(100),
primary key (id_locAtual)
);

create table loc_final(
id_locFinal int not null auto_increment,
pais varchar(100),
estado varchar(100),
cidade varchar(100),
rua varchar(100),
primary key (id_locFinal)
);

create table motorista(
id_motorista int not null auto_increment,
nome_motorista varchar(100),
modeloCarro varchar(100),
placaCarro varchar(8),
primary key(id_motorista)
);

create table pedido(
id_pedido int not null auto_increment,
cod_locAtual int,
cod_loc_Final int,
cod_motorista int,
cod_cliente int,
preco float,
primary key(id_pedido)
);

alter table pedido add foreign key (cod_locAtual) references loc_atual(id_locAtual);
alter table pedido add foreign key (cod_locFinal) references loc_final(id_locAtual);
alter table pedido add foreign key (cod_motorista) references motorista(id_locAtual);
alter table pedido add foreign key (cod_cliente) references cliente(id_locAtual);

insert into cliente() values (default, "Gustavo", "444-555-666.56", "2001-05-15", "ribeiro@gmail", "41 95554-5561");
insert into loc_atual() values (default, "Brasil", "Paraná", "Paranaguá", "R.Villela Salmo");
insert into loc_atual() values (default, "Brasil", "Paraná", "Paranaguá", "R.Cordeiro Matias");
insert into motorista() values (default, "Kiwi Militar", "Corsa", "AD5FS85D");
insert into pedido() values (default, '1','1','1','1');

select cliente.nome_cliente, loc_Atual.rua, loc_Final.rua, motorista.nome_motorista, motorista.modeloCarro, motorista.placaCarro
from cliente
inner join cliente on cliente.id_cliente = loc_Atual.id_locAtual;
inner join loc_Atual on loc_Atual.id_locAtual = loc_Final.id_locFinal;
