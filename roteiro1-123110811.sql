-- 2

CREATE TABLE automovel (
placa CHAR(7),
dono CHAR(7),
chassi CHAR(17),
marca VARCHAR,
modelo VARCHAR);

CREATE TABLE segurado (
cpf CHAR(11),
nome VARCHAR);


CREATE TABLE perito (
id SERIAL,
nome VARCHAR,
automovel_atual CHAR(7),
id_oficina INT);

CREATE TABLE oficina(
id SERIAL,
nome VARCHAR,
bairro VARCHAR,
cidade VARCHAR,
estado VARCHAR);

CREATE TABLE seguro (
id SERIAL,
dia_da_assinatura date,
comprador CHAR(11),
segurado CHAR(11),
placa CHAR(7));

CREATE TABLE sinistro (
id SERIAL,
automovel CHAR(7),
momento_do_acidente TIMESTAMP,
proprietario CHAR(11),
tipo_de_sinistro VARCHAR,
oficina_de_destino INT);

CREATE TABLE pericia (
id SERIAL,
automovel CHAR(7),
perito INT,
proprietario CHAR(7),
dano VARCHAR);

CREATE TABLE reparo (
id SERIAL,
automovel CHAR(7),
proprietario CHAR(11),
valor NUMERIC,
data_inicio DATE,
data_fim DATE);

-- 3
ALTER TABLE automovel ADD PRIMARY KEY (placa);
ALTER TABLE segurado ADD PRIMARY KEY (cpf);
ALTER TABLE perito ADD PRIMARY KEY (id);
ALTER TABLE oficina ADD PRIMARY KEY (id);
ALTER TABLE seguro ADD PRIMARY KEY (id);
ALTER TABLE sinistro ADD PRIMARY KEY (id);
ALTER TABLE pericia ADD PRIMARY KEY (id);
ALTER TABLE reparo ADD PRIMARY KEY (id);

-- 4
ALTER TABLE perito ADD CONSTRAINT perito_automovel_atual_fkey FOREIGN KEY (automovel_atual) REFERENCES automovel (placa);