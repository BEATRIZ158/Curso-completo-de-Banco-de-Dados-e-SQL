/* Cria o banco pedido */

/* Criando a Tabela Cliente */
create table cliente
( codigo_cliente 	integer not null,
  nome_cliente 		varchar(40),
  endereco		varchar(50),
  cidade		varchar(30),
  cep			char(10),
  uf			char(2),
  cnpj			char(16),
  ie 			char(20),
  constraint pk_codigo_cliente primary key (codigo_cliente)
);

/* Criando a Tabela Vendedor*/
create table vendedor 
( codigo_vendedor 	integer not null,
  nome_vendedor 	varchar(40),
  salario_fixo  	numeric(10,2),
  faixa_comissao	char(1),
  constraint pk_codigo_vendedor primary key(codigo_vendedor)
);

/* Criando a Tabela Pedido */
create table pedido
( num_pedido 		integer not null,
  prazo_entrega		smallint not null,
  codigo_cliente	integer not null,
  codigo_vendedor	integer not null,
  constraint pk_num_pedido primary key (num_pedido),
  constraint fk_num_pedio foreign key (codigo_cliente) references cliente,
  constraint fk_codigo_vendedor foreign key (codigo_vendedor) references vendedor
);

/* Criando a Tabela Produto */
create table produto
( codigo_produto 	integer not null,
  unidade		char(3),
  descricao_produto	varchar(30),
  val_unit		numeric(10,2),
  constraint pk_produto primary key (codigo_produto)
);

/* Criando a Tabela Item do Pedido */
create table item_do_pedido
( num_pedido		integer not null,
  codigo_produto 	integer not null,
  quantidade 		numeric(10,2),
  constraint pk_item_pedido primary key (num_pedido,codigo_produto),
  constraint fk_num_pedido foreign key (num_pedido) references pedido,
  constraint fk_codigo_produto foreign key (codigo_produto) references produto
);

/*-- INSERINDO DADOS NAS TABELAS --*/	


/* Inserindo Dados na Tabela Cliente*/

insert into cliente
values (720,'Ana','Rua 17 n. 19','Niterói','24358310','RJ','12113231/0001-34','2134');

insert into cliente
values (870,'Flávio','Av Pres. Vargas 10', 'São Paulo','22763931','SP','22534126/9387-9','4631');

insert into cliente (codigo_cliente,nome_cliente,endereco,cidade,cep,uf,cnpj)
values (110,'Jorge','Rua Caiapo 13','Curitiba','30078500','PR','14512764/9834-9');

insert into cliente
values (222,'Lúcia','Rua Itabira 123 Loja 9','Belo 

Horizonte','22124391','MG','28315213/9348-8','2985');

insert into cliente
values (830,'Maurício','Av.Paulista 1236 sl/2345','São Paulo','3012683','SP','32816985/7465-6','9343');

insert into cliente
values (130,'Edmar','Rua da Praia sn/','Salvador','30079300','BA','23463284/234-9','7121');

insert into cliente
values (410,'Rodolfo','Largo da Lapa 27 sobrado','Rio de Janeiro','30078900','RJ','12835128/2346-9','7431');

insert into cliente
values (20,'Beth','Av. Climério n. 45','São Paulo','25679300','SP','32485126/7326-8','9280');

insert into cliente (codigo_cliente,nome_cliente,endereco,cidade,uf,cnpj,ie)
values (157,'Paulo','Tv Moraes c/3','Londrina','PR','32848223/324-2','1923');

insert into cliente (codigo_cliente,nome_cliente,endereco,cidade,cep,uf,cnpj)
values (180,'Lívio','Av. Beira Mar n. 1256','Florianópolis','30077500','SC','12736571/2347-4');

insert into cliente
values (260,'Susana','Rua Lopes Mendes n. 12','Niterói','30046500','RJ','21763571/232-9','2530');

insert into cliente
values (290,'Renato','Rua Meireles n. 123 bl.2 sl.345','São Paulo','30225900','SP','13276571/1231-4','1820');

insert into cliente
values (390,'Sebastião','Rua da Igreja n. 10','Uberaba','30438700','MG','32176547/213-3','9071');

insert into cliente
values (234,'José','Quadra 3 bl. 3 sl. 1003','Brasília','22841650','DF','21763576/1232-3','2931');


/* Inserindo Dados na Tabela Vendedor*/

insert into vendedor values (209,'José',1800.00,'C');

insert into vendedor values (111,'Carlos',2490.00,'A');

insert into vendedor values (11,'João',2780.00,'C');

insert into vendedor values (240,'Antônio',9500.00,'C');

insert into vendedor values (720,'Felipe',4600.00,'A');

insert into vendedor values (213,'Jonas',2300.00,'A');

insert into vendedor values (101,'João',2650.00,'C');

insert into vendedor values (310,'Josias',870.00,'B');

insert into vendedor values (250,'Maurício',2930.00,'C');


/* Inserindo Dados na Tabela Pedido*/

insert into pedido values (121,20,410,209);

insert into pedido values (97,20,720,101);

insert into pedido values (101,15,720,101);

insert into pedido values (137,20,720,720);

insert into pedido values (148,20,720,101);

insert into pedido values (189,15,870,213);

insert into pedido values (104,30,110,101);

insert into pedido values (203,30,830,250);

insert into pedido values (98,20,410,209);

insert into pedido values (143,30,20,111);

insert into pedido values (105,15,180,240);

insert into pedido values (111,20,260,240);

insert into pedido values (103,20,260,11);

insert into pedido values (91,20,260,11);

insert into pedido values (138,20,260,11);

insert into pedido values (108,15,290,310);

insert into pedido values (119,30,390,250);

insert into pedido values (127,10,410,11);



/* Inserindo Dados na Tabela Produto */

insert into produto values (25,'Kg','Queijo',0.97);

insert into produto values (31,'BAR','Chocolate',0.87);

insert into produto values (78,'L','Vinho',2.00);

insert into produto values (22,'M','Linho',0.11);

insert into produto values (30,'SAC','Açúcar',0.30);

insert into produto values (53,'M','Linha',1.80);

insert into produto values (13,'G','Ouro',6.18);

insert into produto values (45,'M','Madeira',0.25);

insert into produto values (87,'M','Cano',1.97);

insert into produto values (77,'M','Papel',1.05);


/* Inserindo Dados na Tabela Item do Pedido */

insert into item_do_pedido values (121,25,10);

insert into item_do_pedido values (121,31,35);

insert into item_do_pedido values (97,77,20);

insert into item_do_pedido values (101,31,9);

insert into item_do_pedido values (101,78,18);

insert into item_do_pedido values (101,13,5);

insert into item_do_pedido values (98,77,5);

insert into item_do_pedido values (148,45,8);

insert into item_do_pedido values (148,31,7);

insert into item_do_pedido values (148,77,3);

insert into item_do_pedido values (148,25,10);

insert into item_do_pedido values (148,78,30);

insert into item_do_pedido values (104,53,32);

insert into item_do_pedido values (203,31,6);

insert into item_do_pedido values (189,78,45);

insert into item_do_pedido values (143,31,20);

insert into item_do_pedido values (143,78,10);

insert into item_do_pedido values (105,78,10);

insert into item_do_pedido values (111,25,10);

insert into item_do_pedido values (111,78,70);

insert into item_do_pedido values (103,53,37);

insert into item_do_pedido values (91,77,40);

insert into item_do_pedido values (138,22,10);

insert into item_do_pedido values (138,77,35);

insert into item_do_pedido values (138,53,18);

insert into item_do_pedido values (108,13,17);

insert into item_do_pedido values (119,77,40);

insert into item_do_pedido values (119,13,6);

insert into item_do_pedido values (119,22,10);

insert into item_do_pedido values (119,53,43);

insert into item_do_pedido values (137,13,8);
