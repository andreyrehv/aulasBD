use cadastro;
create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned, #significa sem sinal - vai economizar 1 bit para cada registro utilizado
totaulas int,
ano year default '2019'
)default charset = utf8;

alter table cursos
add column idcursos int first;

alter table cursos
add primary key (idcursos);

desc cursos;

#drop table para apagar a coluna
#drop database apaga o banco de dados






















