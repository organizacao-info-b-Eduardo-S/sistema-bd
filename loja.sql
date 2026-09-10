create database loja;

create table cliente(
id serial primary key,
nome varchar(80) not null,
codigo char(10) not null unique
);

create table pedido(
id serial primary key,
entrega date not null,
cliente_id int,
foreign key(cliente_id) references cliente(id)
);

create table produtoo(
id serial primary key,
codigo_entrega char(5) not null unique,
tipo text not null
);

create table pedido_produtoo(
pedido_id int,
produtoo_id int,
primary key(pedido_id, produtoo_id),
foreign key(pedido_id) references pedido(id),
foreign key(produtoo_id) references produtoo(id)
);

alter table cliente add column telefone varchar(9) not null unique;

insert into cliente(nome, codigo, telefone)
values('roberto', '1234567890', '1234'),
('terena', '9876543210', '555');

insert into pedido(entrega)
values('2026-07-05'),
('2027-02-01');

insert into produtoo(codigo_entrega, tipo)
values('VJ45A', 'celular'),
('RK87T', 'computador');

insert into pedido_produtoo(pedido_id, produtoo_id)
values(1, 2),
(2, 1)

update cliente set codigo='0000000000' where nome='roberto' and telefone='1234';
update pedido set entrega='2027-05-05' where id=2 and cliente_id=1;
update produtoo set tipo='jbl' where id=1 and codigo_entrega='RK87T';

delete from cliente where nome='terena' and id=2;

select telefone from cliente;
select entrega from pedido where id>=2;
select tipo from produtoo where id=1 and codigo_entrega='RK87T';

select c.nome, ped.cliente_id, pp.produtoo_id, prod.codigo_entrega
from cliente c
inner join pedido ped on c.id=ped.cliente_id
inner join pedido_produtoo pp on ped.id=pp.pedido_id
inner join produtoo prod on pp.produtoo_id=prod.id
where c.id=2 and ped.id=2;

select c.codigo, c.nome, pp.produtoo_id
from cliente c
inner join pedido ped on c.id=ped.cliente_id
inner join pedido_produtoo pp on ped.id=pp.pedido_id
where c.id=2 and ped.id=2;

select c.id, ped.id
from cliente c
inner join pedido ped on c.id=ped.cliente_id
where c.id=1 and ped.id=2
group by c.id, ped.id
order by ped.entrega desc;