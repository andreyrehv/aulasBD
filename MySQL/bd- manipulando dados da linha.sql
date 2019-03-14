insert into cursos values
('1', 'HTML4', 'Cursos de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Cursos de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução a Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazre Kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmicas e ganhar inscritos', '5', '2', '2018');

select * from cursos;

update cursos #atualize
set nome = 'HTML5' #configurar
where idcursos = '1'; #onde

update cursos
set nome = 'PHP', ano = '2015'
where idcursos = '4';
 
 update cursos
 set nome = 'Java', carga = '40', ano = '2015'
 where idcursos = '5'
 limit 1; #Limita a um registro a alteração
 
 #Apagando registros
 delete from cursos
 where idcursos = '8';

delete from cursos
where ano = '2018'
limit 2;

#Limpar a tabela inteira
truncate cursos;





















