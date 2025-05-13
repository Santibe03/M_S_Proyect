DROP DATABASE IF EXISTS Tecshop;
CREATE DATABASE Tecshop;
USE Tecshop;

create table Producto(
	codigo int(10) primary key auto_increment ,
	nombre varchar(100),
	precio double,
	codigo_fabricante int(10)
);

create table Fabricante(
	codigo int(10) primary key auto_increment,
    nombre varchar(100)
);


alter table Producto 
add constraint fk_codigo_fabricante foreign key (codigo_fabricante) references Fabricante (codigo);