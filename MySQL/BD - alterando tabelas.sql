desc pessoas;
alter table pessoas
add column profissao varchar(10);

alter table pessoas
drop column profissao;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
add codigo int first;

#modify - modifica a coluna q vc quer
alter table pessoas
modify column profissao varchar(20) not null default '';	

#change - muda o nome da coluna
alter table pessoas
change	column profissao prof varchar(20)not null;

#rename to - para mudar o nome da tabela
alter table pessoas
rename to Pessoas_Fisicas;






















