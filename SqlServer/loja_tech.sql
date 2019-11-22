use master 
go

drop database loja_tech
go

create database loja_tech
go

use loja_tech
go



create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
	   id_item_vendido int not null,
	   venda_cancel varchar (3)check (venda_cancel = 'SIM')
             
)
GO

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(50) not null,
       ende nvarchar(100),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       tel nvarchar(15),
       email nvarchar(70),
)
GO
create table tb_item_vendido(
       id_item_venda int PRIMARY KEY identity(1,1),
       id_produto int not null,       
       qtde_item int not null,
       pco_vda decimal(8,2) not null
	   
)
GO
create table tb_vendas_canceladas(
       id_venda_canc int PRIMARY KEY identity(1,1),
       id_item_venda int UNIQUE not null,
       
)
GO
create table tb_produtos(
       id_produto int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(50) ,
       preco_unit decimal ,
       qtde_atual int , 
       qtde_minima int,
)
GO


alter table tb_item_vendido
      ADD CONSTRAINT fk_id_produto
      FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
	  go

	  alter table tb_vendas
      ADD CONSTRAINT fk_id_venda
      FOREIGN KEY (id_item_vendido) REFERENCES tb_item_vendido(id_item_venda)
	  go

	  alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_item_vendido
      FOREIGN KEY (id_item_venda) REFERENCES tb_item_vendido(id_item_venda)
	  go

	  alter table tb_clientes
      ADD CONSTRAINT fk_id_cliente
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
	  go
  
insert into tb_produtos values 
		('gabinete', '50.2', '10', '10'),
		('monitor', '150.2', '10', '10'),
		('teclado', '550.2', '10', '10'),
		('mouse', '15.2', '10', '10')

insert into tb_clientes values
       ('Andrey','Rua 1',20,'m','11-99999-9999','email...'),
       ('AnderSON','Rua 2',20,'m','11-99999-9999','email...'),
       ('Vitoria','Rua 3',20,'m','11-99999-9999','email...'),
       ('Carminha','Rua 4',20,'m','11-99999-9999','email...'),
       ('Romana','Rua 5',20,'m','11-99999-9999','email...')
GO

insert into tb_item_vendido values
       (1,10,20.00),
       (2,10,600.00),
       (3,10,250.00)
 GO  
 
 insert into tb_vendas(id_cliente, id_item_vendido) values
       (4,1),
       (1,2),
       (5,3)
 GO     

	  
	 select * from tb_vendas
	 select * from tb_clientes
	 select * from tb_item_vendido	 
	 select * from tb_produtos
	 
	 
select c.nome, v.id_venda, v.id_item_vendido from tb_clientes as c INNER JOIN tb_vendas as v on c.id_cliente = v.id_cliente;
go

select c.nome, v.id_venda, v.id_item_vendido from tb_clientes as c LEFT JOIN tb_vendas as v on c.id_cliente = v.id_cliente where v.id_venda is null;
go

select d.descricao,d.id_produto, v.id_item_venda from tb_produtos as d LEFT JOIN tb_item_vendido as v on d.id_produto = v.id_produto where v.id_produto is null;
go

create trigger triggervendas_cancel on tb_vendas for update as

declare @vd_cancel varchar (3);
declare @vendas varchar (50);

select @vd_cancel = x.venda_cancel from inserted x;
select @vendas = x.id_venda from inserted x;

if(@vd_cancel = 'SIM')
insert into tb_vendas_canceladas (id_item_venda)values (@vendas)
go

update tb_vendas
set venda_cancel = 'SIM' where id_item_vendido = 1
go

select * from tb_vendas
go

select * from tb_vendas_canceladas
go


-- Procidore
create procedure tabela_vendas 
@tbvendas int as select * from tb_vendas where id_item_vendido = @tbvendas
go

execute tabela_vendas 2
go