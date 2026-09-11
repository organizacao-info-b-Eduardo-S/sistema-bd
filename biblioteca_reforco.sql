create database biblioteca_reforco;
-- cria o banco de dados biblioteca_reforco
create table leitor(
id serial primary key,
nome varchar(80) not null,
email varchar(120)
);
--cria o banco de dados leito
r
select * from leitor;
--consulta a tabela leitor

create table livro(
id serial primary key,
titulo varchar(100) not null,
autor varchar(80) not null
);
--cria a tabela livro

select *from livro;
--consulta a tabela livro

create table emprestimo(
data_emprestimo date not null,
leitor_id int,
livro_id int,
foreign key(leitor_id) references leitor(id),
foreign key(livro_id) references livro(id)
);
--cria a tabela emprestimo

select * from emprestimo;
--consulta a tabela emprestimo

alter table leitor add column telefone varchar(20);
--adiciona a coluna telefone na tabela leitor

select * from leitor;
--consulta a tabela leitor

alter table livro alter column titulo type varchar(150);
--altera a coluna titulo da tabela livro

select * from livro;
--consulta a tabela livro

alter table emprestimo add column status varchar(20);
--adicona a coluna status na tabela emprestimo

select * from  emprestimo;
--consulta a tabela emprestimo

alter table livro add column observacao varchar(100);
--adiciona a coluna observacao na tabela livro

select * from livro;
--consulta a tabela livro

alter table livro drop column observacao;
--exclui a coluna observacao da tabela livro

select * from livro;
--consulta a tabela livro

insert into leitor(nome, email, telefone)
values('Ana Souza', 'ana@email.com', '24999990001'),
('Bruno Lima', 'bruno@email.com', '24999990002'),
('Carla Silva', 'carla@email.com', '24999990003')
--insere registros na tabela leitor

select * from leitor;
--consulta a tabela leitor

insert into livro(titulo, autor)
values('Banco de Dados', 'Carlos Almeida'),
('Introdução ao Java', 'Maria Santos'),
('Git e GitHub', 'Paulo Oliveira')
--insere registros na tabela livro

select * from livro;
--consulta a tabela livro

insert into emprestimo(leitor_id, livro_id, data_emprestimo, status)
values(1, 1, '2026-09-01', 'ATIVO'),
(1, 3, '2026-09-02', 'ATIVO'),
(2, 2, '2026-09-03', 'DEVOLVIDO'),
(3, 1, '2026-09-04', 'ATIVO'),
(3, 3, '2026-09-05', 'DEVOLVIDO')
--insere registros na tabela emprestimo

select * from emprestimo;
--consulta a tabela emprestimo

update leitor set telefone='24988880001' where nome='Ana Souza';
--atualiza a coluna telefone no registro com nome de ana souza na tabela leitor

select * from leitor;
--consulta a tabela leitor

update livro set autor='Paulo Souza' where titulo='Git e GitHub';
--atualiza a coluna de autor onde no registro possui o titulo de git e github na tabela livro

select * from livro;
--consulta a tabela livro

update emprestimo set status='ATIVO' where leitor_id=2;
--atualiza a coluna de status no registro aonde o leitor tem id 2

select * from emprestimo;
--consulta a tabela emprestimo

delete from emprestimo where leitor_id=3 and livro_id=3;
-- deleta o registro de empreestimo com leitor e livro de id 3

select * from emprestimo;
--consulta a tabela emprestimo

select * from leitor;
--consulta a tabela leitor

select nome, email, telefone from leitor;
-- consulta as colunas nome, email e telefone de leitor

select * from livro where id>=2;
--consulta os registros de livro com id 2

select * from emprestimo where status='ATIVO';
-- consulta os registros de emprestimo com com status ativo

select count(*) from leitor;
-- a quantidade de leitores 

select count(*) from emprestimo where status='ATIVO';
--conta a quantidade de emprestimos com status de ativo

select le.nome, e.data_emprestimo, e.status
from leitor le
inner join emprestimo e on le.id= e.leitor_id;
--seleciona os leitores, as datas de seus emprestimos e seus status

select le.nome, li.titulo, e.data_emprestimo, e.status
from leitor le
inner join emprestimo e on le.id = e.leitor_id
inner join livro li on li.id = e.livro_id;
-- seleciona os leitores, os titulos dos livros, as datas dos emprestimos e seus status

select le.nome, e
from leitor le
inner join emprestimo e on le.id=e.leitor_id
group by le.nome, e
order by count(e), le.nome desc;
--seleciona a quantidade de emprestimos e seus leitores

select le.nome, li.titulo, e.data_emprestimo, e.status
from leitor le
inner join emprestimo e on le.id = e.leitor_id
inner join livro li on li.id = e.livro_id where status='ATIVO';
--seleciona os leitores, as datas de seus emprestimos e seus status onde estão ativos

d


