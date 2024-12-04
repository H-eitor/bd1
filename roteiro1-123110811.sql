-- 2

CREATE TABLE automovel (
placa char(7),
chassi char(17),
marca varchar,
modelo varchar);

CREATE TABLE segurado (
nome varchar,
cpf char(11));

CREATE TABLE perito (
nome varchar,
id int,
automovel_atual char(7),
id_oficina int);

CREATE TABLE oficina(
id int,
nome varchar,
bairro varchar,
cidade varchar,
estado varchar);

CREATE TABLE seguro (
dia_da_assinatura date,
comprador char(11),
segurado char(11),
placa char(7));

CREATE TABLE sinistro (
automovel char(7),
momento_do_acidente timestamp,
proprietario char(11),
tipo_de_sinistro varchar,
oficina_de_destino int);

CREATE TABLE pericia (
id int,
automovel char(7),
perito int,
proprietario char(7),
dano varchar);

CREATE TABLE reparo (
id int,
automovel char(7),
proprietario char(11),
valor numeric,
data_inicio date,
data_fim date);

-- 3
ALTER TABLE automovel ADD PRIMARY KEY (placa);
ALTER TABLE segurado ADD PRIMARY KEY (cpf);
ALTER TABLE perito ADD PRIMARY KEY (id);
ALTER TABLE oficina ADD PRIMARY KEY (id);
ALTER TABLE pericia ADD PRIMARY KEY (id);
ALTER TABLE reparo ADD PRIMARY KEY (id);
