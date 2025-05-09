drop database if exists cinema;
create database cinema;
use cinema;

create table filme (
    id_filme int primary key auto_increment,
    titulo varchar(150) not null,
    duracao_minutos int not null,
    genero varchar(50),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

create table sessao (
    id_sessao int primary key auto_increment,
    id_filme int not null,
    data_sessao date not null,
    horario time not null,
    sala varchar(20) not null,
    capacidade_maxima int not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (id_filme) references filme(id_filme) on delete cascade
);

create table ingresso (
    id_ingresso int primary key auto_increment,
    id_sessao int not null,
    nome_cliente varchar(100) not null,
    valor_pago decimal(6,2) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (id_sessao) references sessao(id_sessao) on delete cascade
);
