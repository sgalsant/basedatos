drop database if exists banco;

create database banco default character set utf8mb4 collate utf8mb4_0900_ai_ci;

use banco;

create table titulares (
	nif char(8) primary key,
    nombre varchar(20) not null
);

create table cuentas (
	iban char(10) primary key,
    nif char(8) not null,
    deposito decimal(6, 2) not null default 0,
    foreign key (nif) references titulares(nif)
);

insert into titulares (nif, nombre) values
        ("11111111", "titular1"),
        ("22222222", "titular2");
        
insert into cuentas (iban, nif, deposito) values
		("AAAAAAAA", "11111111", 1000.00),
        ("BBBBBBBB", "22222222", 2000.00);
        
        
        