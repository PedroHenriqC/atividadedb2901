create database db290126;
use db290126;


/*Tabela de produto*/

/*Atividade 1*/
create table tabProduto (
idProduto int not null auto_increment ,
nomeProduto varchar(45),
precoProduto decimal(10,2) not null,

constraint pkidProduto primary key (idProduto));


/*Tabela de cliente*/

/*Atividade 2*/
create table tabClientes (
idCliente int not null auto_increment ,
nomeCliente varchar(45),
cidadeCliente varchar(45),

constraint pkidCliente primary key (idCliente));


/*Atividade 3*/
insert into tabProduto (idProduto,nomeProduto,precoProduto) values (1,"Playstation 4",2100.90);
insert into tabProduto (idProduto,nomeProduto,precoProduto) values (2,"Playstation 1",740.98);
insert into tabProduto (idProduto,nomeProduto,precoProduto) values (3,"Nintendo Switch Oled",2300.90);
insert into tabProduto (idProduto,nomeProduto,precoProduto) values (4,"Xbox 360",852.65);
insert into tabProduto (idProduto,nomeProduto,precoProduto) values (5,"Playstation vr 2",2900.90);



/*Atividade 4*/
insert into tabClientes (idCliente, nomeCliente, cidadeCliente) values (1,"Marcos Oliveira", "Belo-Horizonte");
insert into tabClientes (idCliente, nomeCliente, cidadeCliente) values (2,"Yuri Souza", "Curitiba");
insert into tabClientes (idCliente, nomeCliente, cidadeCliente) values (3,"Gustavo Ferreira", "Gramado");

/*Atividade 5*/
alter table tabProduto add column estoqueProduto int ;


/*Atividade 6*/
update tabProduto
set estoqueProduto = 100
where idProduto between 1 and 5;

/*Atividade 7*/
rename table tabClientes to tabParceiros ;

/*Atividade 8*/
alter table tabProduto rename column nomeProduto to descricaoProduto ;

/*Atividade 9*/
insert into tabProduto (idProduto ,descricaoProduto,estoqueProduto) values (6, "Nitendo 3DS", 100);

/*Atividade 10*/

alter table tabProduto
modify precoProduto decimal(12,4) not null;

/*Atividade 11*/

select *from tabProduto ;

/*Atividade 12*/

select *from tabProduto where precoProduto > 50 ;

/*Atividade 13*/
select *from tabParceiros where cidadeCliente = "Gramado";

/*Atividade 14*/
select *from tabProduto where descricaoProduto like  "a%" ;

/*Atividade 15*/
select *from tabProduto where precoProduto between 10.00 and 100.00 ;

/*Atividade 16*/
select*from tabProduto order by descricaoProduto asc;

/*Atividade 17*/
select distinct cidadeCliente as "Cidades dos Clientes" from tabParceiros;

/*Atividade 18*/
select*from tabProduto where descricaoProduto IN ('Adubo', 'Semente');

/*Atividade 19*/
update tabProduto set precoProduto = precoProduto * 1.10 where idProduto = 1;

/*Atividade 20*/
update tabParceiros set cidadeCliente = 'São Paulo' where idCliente = 5;


/*Atividade 21*/
create table tabVendas (
    idVendas int not null auto_increment ,
    idProduto int,
    idCliente int,
    
    constraint pkidVendas primary key (idVendas),
    constraint fkidProdutoVendas foreign key (idProduto) references tabProduto(idProduto),
    constraint fkidClienteVendas foreign key (idCliente) references tabParceiros(idCliente));


/*Atividade 22*/
insert into tabVendas (idCliente, idProduto) values (1, 2);
insert into tabVendas (idCliente, idProduto) values (3, 1);
insert into tabVendas (idCliente, idProduto) values (2, 3);


/*Atividade 23*/
select p.nomecliente as "nome do cliente", pr.descricaoproduto as "nome do produto" from tabvendas v
inner join tabparceiros p on v.idcliente = p.idcliente inner join tabproduto pr on v.idproduto = pr.idproduto;



/*Atividade 24*/
select p.nomecliente as "Nome do Cliente", pr.descricaoproduto as "Nome do Produto", pr.precoproduto as "Preço do Produto" from tabvendas v
inner join tabparceiros p on v.idcliente = p.idcliente inner join tabproduto pr on v.idproduto = pr.idproduto;


/*Atividade 25*/
/*Apagando o produto 1 na tabela de vendas */
delete from tabvendas
where idproduto = 1;

/*Apagando o produto 1 na tabela de produtos*/
delete from tabproduto
where idproduto = 1;


set sql_safe_updates = 0;

/*Atividade 26*/

delete from tabparceiros where cidadecliente = 'rio de janeiro';


/*Atividade 27*/
select p.nomeCliente as "Cliente", pr.descricaoProduto as "Produto" from tabVendas v 
    inner join tabParceiros p on v.idCliente = p.idCliente inner join tabProduto pr on v.idProduto = pr.idProduto where p.idCliente = 1;


/*Atividade 28*/
alter table tabProduto drop column estoqueProduto;


/*Atividade 29*/
/*criando tabela de teste*/
create table tabTestes (
    idTeste int not null auto_increment,
    descricaoTeste varchar(45),
    constraint pkidTeste primary key (idTeste));

/*excluir tabela de teste*/
drop table tabTestes;

/*Atividade 30*/
select  p.nomeCliente as "Cliente"from tabVendas v 
inner join tabParceiros p on v.idCliente = p.idCliente inner join tabProduto pr 
on v.idProduto = pr.idProduto where pr.descricaoProduto = 'Adubo';



/*Atividade 31*/
insert into tabProduto (descricaoProduto, precoProduto) values ('Controle DualSense PS5', 449.90);
insert into tabProduto (descricaoProduto, precoProduto) values ('Headset Gamer HyperX', 699.90);
insert into tabProduto (descricaoProduto, precoProduto) values ('Teclado Mecânico Gamer RGB', 899.90);



/*Atividade 32*/

select *from tabProduto where precoProduto in (150.00, 200.00);

/*Atividade 33*/
update tabProduto set descricaoProduto = 'Kit de Ferramentas SENAI' where idProduto = 2;

/*Atividade 34*/
/*Adcionando um campo de data de Vendas */
alter table tabVendas add column dataVenda date;

/*Atualizando com uma data na tabela de vendas*/
update tabVendas set dataVenda = '2026-02-10' where idVendas = 1;

/*listando o nome de todos os produtos e o nome dos clientes*/
select pr.descricaoProduto as "Produto", p.nomeCliente as "Cliente"
from tabVendas v inner join tabProduto pr on v.idProduto = pr.idProduto inner join tabParceiros p 
on v.idCliente = p.idCliente where v.dataVenda = curdate();


/*Atividade 35*/
alter table tabProduto add column categoria varchar(45);



/*Atividade 36*/

update tabProduto set categoria = 'Eletrônicos'where precoProduto > 500.00;

/*Atividade 37*/
select * from tabParceiros where cidadeCliente != 'Muriaé';


/*Atividade 38*/
delete from tabVendas where idCliente = 2;


/*Atividade 39*/
alter table tabParceiros rename column cidadeCliente to municipio;


/*Atividade 40*/
select  p.nomeCliente as "Cliente" from tabVendas v inner join tabParceiros p 
on v.idCliente = p.idCliente inner join tabProduto pr on v.idProduto = pr.idProduto where pr.categoria = 'Eletrônicos';


/*Atividade 41*/

create table tabfornecedores (
    idFornecedor int not null auto_increment,
    nomeFornecedor varchar(45),
    cnpjFornecedor varchar(45),
    constraint pkFornecedor primary key (idFornecedor));


/*Atividade 42*/
insert into tabfornecedores (nomeFornecedor, cnpjFornecedor)values('Sony Brasil', '12.345 678 0001 99');
insert into tabfornecedores (nomeFornecedor, cnpjFornecedor)values('Microsoft Brasil', '98.765 432 0001 88');


/*Atividade 43*/
alter table tabProduto add column fornecedor_id int;


/*Atividade 44*/
update tabProduto set fornecedor_id = 1;


/*Atividade 45*/
select p.descricaoProduto as "Produto", f.nomeFornecedor as "Fornecedor"
from tabProduto p inner join tabfornecedores f on p.fornecedor_id = f.idFornecedor;



/*Atividade 46*/

select *from tabParceiros order by nomeCliente desc;


/*Atividade 47*/
update tabProduto set precoProduto = precoProduto - 5.00 where categoria = 'Eletrônicos';


/*Atividade 48*/
delete from tabProduto where categoria is null;


/*Atividade 49*/
drop table tabfornecedores;


/*Atividade 50*/
select c.nomeCliente as "Cliente", p.descricaoProduto as "Produto", p.precoProduto as "Preço"
from tabVendas v inner join tabParceiros c on v.idCliente = c.idCliente inner join tabProduto p on v.idProduto = p.idProduto;



