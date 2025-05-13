DROP DATABASE IF EXISTS Tecshop;
CREATE DATABASE Tecshop;
USE Tecshop

create table Producto(
	cod int(10) primary key auto_increment ,
	nom varchar(100),
	precio double,
	cod_f int(10)
);

create table Fabricante(
	cod int(10) primary key auto_increment,
    nombre varchar(100)
);


alter table Producto 
add constraint fk_cod_f foreign key (cod_f) references Fabricante (cod);