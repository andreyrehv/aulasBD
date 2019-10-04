use master 
go

drop database trilha
go

create database trilha
go

use trilha
go



create table trilhaTab(
times varchar(100),
saldo_inicial decimal(10,2),
saldo_final decimal(10,2)
)
go

create table trilhaVenda(
timess varchar(100),
codigo decimal(10,2),
Valor decimal(10,2),
data datetime
)
go


create trigger trigger1 on trilhaTab
for insert
as
declare @cliTime varchar(100);
declare @cliInicial varchar(100);
declare @cliFinal varchar(100);

declare @audit_action varchar(100);

select @cliTime = i.times from inserted i;
select @cliInicial = i.saldo_inicial from inserted i;
select @cliFinal = i.saldo_final from inserted i;

set @audit_action = 'Registro inserido';

insert into trilhaVenda values (@cliTime,@cliInicial, @cliFinal, GETDATE())
go




print 'FIM DA EXECUÇÃO DA TRIGUER'

go
/* Trigger só pode ser inserido 1 de cada vez.*/
insert into trilhaTab values ('Slavia Praga', 1500 , 1400)
insert into trilhaTab values('Real Madrid das Americas', 1000, 200) 
insert into trilhaTab values('Bahia de Monique', 2500 , 320)
insert into trilhaTab values('IBIS', 10 , 9)
go




select * from trilhaTab
go

select * from trilhaVenda
go