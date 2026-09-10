create database prova_passeios;

-- cria uma tabela chamada 
create table cliente(
id serial primary key,
nome varchar(80) not null,
email varchar(120) not null unique,
cpf char(14) not null unique
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
vagas int not null,
codigo char(5) not null unique
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


--remove  a coluna data_passeio da tabela passeios
alter table passeios drop column data_passeio;

-- adiciona  a coluna data_hora_saida da tabela passeios
alter table passeios add column data_hora_saida timestamp;

alter table reserva add column cliente varchar(50);


-- adiciona  a coluna data_hora_retorno da tabela passeios
alter table passeios add column data_hora_retorno timestamp;

--adiciona registros na tabela cliente
insert into cliente(nome, email, cpf)
values('Mariana Costa', 'mariana@email.com','24999991111'),
('Rafael Martins', 'rafael@email.com', '24999992222'),
('Juliana Alves', 'juliana@email.com', '24999993333'),
('Felipe Rocha', 'felipe@email.com', '24999994444')

insert into reserva(cliente, data_reserva, status)
values ('Mariana', '2026-09-10', 'CONFIRMADA'),
('Rafael', '2026-09-11', 'CONFIRMADA'),
(),
()





