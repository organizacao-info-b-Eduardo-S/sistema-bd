create database prova_passeios;

-- cria uma tabela chamada 
create table cliente(
id serial primary key,
nome varchar(80) not null,
email varchar(120) not null unique
);

-- seleciona a tabela cliente
select * from cliente;

--cria uma tabela chamada 'reserva'
create table reserva(
id serial primary key,
data_reserva date not null,
status varchar(20) not null,
cliente_id int,
foreign key(cliente_id) references cliente(id)
);

-- selecione a tabela reserva
select * from reserva;

-- cria uma tabela chamada 'passeios'
create table passeios(
id serial primary key,
nome varchar(100) not null,
data_passeio date not null,
duracao_horas int not null,
vagas int not null
);

--seleciona a tabela passeios
select * from passeios;

-- cria um tabela chamada 'reserva_passeios'
create table reserva_passeios(
reserva_id int,
passeios_id int,
primary key(reserva_id, passeios_id),
foreign key(reserva_id) references reserva(id),
foreign key(passeios_id) references passeios(id)
);

--seleciona a tabela reserva_passeios
select * from reserva_passeios;

--adiciona a coluna telefone na tabela cliente
alter table cliente add column telefone varchar(20);

--consulta a tabela cliente
select * from cliente;


--remove  a coluna data_passeio da tabela passeios
alter table passeios drop column data_passeio;

--seleciona a tabela passeios
select * from passeios;

-- adiciona  a coluna data_hora_saida da tabela passeios
alter table passeios add column data_hora_saida timestamp;

--seleciona a tabela passeios
select * from passeios;

-- adiciona  a coluna data_hora_retorno da tabela passeios
alter table passeios add column data_hora_retorno timestamp;

--seleciona a tabela passeios
select * from passeios;

alter table passeios column type vagas check(vagas<0);

--seleciona a tabela passeios
select * from passeios;

--adiciona registros na tabela cliente
insert into cliente(nome, email, telefone)
values('Mariana Costa', 'mariana@email.com','24999991111'),
('Rafael Martins', 'rafael@email.com', '24999992222'),
('Juliana Alves', 'juliana@email.com', '24999993333'),
('Felipe Rocha', 'felipe@email.com', '24999994444');

--consulta a tabela cliente
select * from cliente;

--adiciona registros na tabela reserva
insert into reserva(cliente_id, data_reserva, status)
values (1, '2026-09-10', 'CONFIRMADA'),
(2, '2026-09-11', 'CONFIRMADA'),
(1, '2026-09-12', 'PENDENTE'),
(3, '2026-09-13', 'CONFIRMADA'),
(4, '2026-09-14', 'PENDENTE');

-- consulta a tabela reserva
select * from reserva;

--adiciona registros na tabela passeios
insert into passeios(nome, data_hora_saida, data_hora_retorno, duracao_horas, vagas)
values('Tour Histórico Imperial', '2026-10-10 08:00:00', '2026-10-10 13:00:00', 5, 30),
('Trilha do Vale', '2026-10-15 07:00:00', '2026-10-15 16:00:00', 9, 20),
('Circuito Cervejeiro', '2026-10-18 10:00:00', '2026-10-18 18:00:00', 8, 25),
('Passeio Serra e Mirantes', '2026-10-25 06:30:00', '2026-10-25 18:30:00', 12, 18)

-- consulta a tabela passeios
select * from passeios;


--adiciona registros na tabela reserva_passeios
insert into reserva_passeios(reserva_id, passeios_id)
values(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, 2),
(3, 4),
(4, 1),
(4, 3),
(4, 4),
(5, 3),
(5, 4);

-- consulta a tabela reserva_passeios
select * from reserva_passeios;

--atualiza a coluna telefone da tabela cliente nos registros com id 1 e nome de Mariana
update cliente set telefone='24988881111' where nome='Mariana Costa' and email='mariana@email.com';

-- consulta a tabela cliente
select * from cliente;

--atualiza a coluna status da tabela reserva nos registros aonde tem id 3 e o id de cliente como 1
update reserva set status='CONFIRMADA' where id=3 and cliente_id=1;

-- consulta a tabela reserva
select * from reserva;

--altera a coluna vagas na tabela passeios nos registros onde possui nome de passeios serra e mirantes e id 4
update passeios set vagas=22 where nome='Passeio Serra e Mirantes' and id=4;

-- consulta a tabela passeios
select * from passeios;

--altera a coluna duracao_horas da tabela passeios nos registros com nome de circuito cervejeiro e id 3
update passeios set duracao_horas=9 where nome='Circuito Cervejeiro' and id=3;

-- consulta a tabela passeios
select * from passeios;

-- consulta a tabela reserva_passeios
select * from reserva_passeios;

--deleta o registro de reserva_passeios com reserva de id 4 e passeio de id 3
delete from reserva_passeios where reserva_id=4 and passeios_id=3;

-- consulta a tabela reserva_passeios
select * from reserva_passeios;

--consulta as colunas id, nome, emaile e telefone e seus registros da tabela cliente
select id, nome, email, telefone from cliente;

--consulta todos os registros de reserva com id igual ou maior que 3
select * from reserva where id>=3;

--conta a quantidade de registros da tabela reserva com status de confirmada
select count(*) from reserva where status='CONFIRMADA';

--seleciona nome do cliente, id da reserva e seus status
select c.nome, r.id, r.status
from reserva r
inner join cliente c on r.cliente_id=c.id;

--seleciona o nome do cliente, o id do passeio, seus status, o nome de passeio e a datade saída e retorno
select c.nome, r.id, r.status, p.nome, p.data_hora_saida, p.data_hora_retorno
from cliente c
inner join passeios p on reserva_passeios.passeios_id=p.id
inner join reserva_passeios rp on reserva.id=rp.reserva_id
inner join reserva r on c.id=r.cliente_id;

--seleciona o nome do cliente, o id do passeio, seus status, o nome de passeio e a datade saída e retorno com 
select c.nome, r.id, r.status, p.nome, p.data_hora_saida, p.data_hora_retorno
from cliente c
inner join passeios p on reserva_passeios.passeios_id=p.id
inner join reserva_passeios rp on reserva.id=rp.reserva_id
inner join reserva r on c.id=r.cliente_id;