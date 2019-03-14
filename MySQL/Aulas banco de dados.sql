create database cadastro
default character set utf8
default collate utf8_general_ci;

create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
)default charset = utf8;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984/01/02', 'M', '78.5', '1.83', 'Brasil');

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria', '1999/12/30', 'F', '55.2', '1.65', 'Portugal');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(DEFAULT, 'Creuza', '1920/05/30', 'F', '50.2', '1.65', DEFAULT);

insert into pessoas values
(default, 'Adalgiza', '1995/02/06', 'F', '54.6', '1.62', 'Irlanda');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Ana', '1975/12/22', 'F', '52.3', '1.45', 'EUA'),
(default, 'Pedro', '2000/07/15', 'M', '69.3', '1.81', default),
(default, 'Maria', '1999/05/30', 'F', '75.6', '1.70', 'Portugal');
 
select * from pessoas;

desc pessoas;

alter table pessoas
add column profissao varchar(10);






















