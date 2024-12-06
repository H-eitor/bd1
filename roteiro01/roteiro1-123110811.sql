-- 1 & 2

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
ALTER TABLE perito ADD CONSTRAINT perito_id_oficina_fkey FOREIGN KEY (id_oficina) REFERENCES oficina (id);
ALTER TABLE seguro ADD CONSTRAINT seguro_segurado_fkey FOREIGN KEY (segurado) REFERENCES segurado (cpf);
ALTER TABLE seguro ADD CONSTRAINT seguro_placa_fkey FOREIGN KEY (placa) REFERENCES automovel (placa);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_automovel_fkey FOREIGN KEY (automovel) REFERENCES automovel (placa);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_proprietario_fkey FOREIGN KEY (proprietario) REFERENCES segurado (cpf);
ALTER TABLE pericia ADD CONSTRAINT pericia_perito_fkey FOREIGN KEY (perito) REFERENCES perito (id);
ALTER TABLE pericia ADD CONSTRAINT pericia_automovel_fkey FOREIGN KEY (automovel) REFERENCES automovel (placa);
ALTER TABLE pericia ADD CONSTRAINT pericia_proprietario_fkey FOREIGN KEY (proprietario) REFERENCES segurado (cpf);
ALTER TABLE reparo ADD CONSTRAINT reparo_automovel_fkey FOREIGN KEY (automovel) REFERENCES automovel (placa);
ALTER TABLE reparo ADD CONSTRAINT reparo_proprietario_fkey FOREIGN KEY (proprietario) REFERENCES segurado (cpf);

-- 5 & 6
DROP TABLE reparo;
DROP TABLE pericia;
DROP TABLE sinistro;
DROP TABLE seguro;
DROP TABLE perito;
DROP TABLE oficina;
DROP TABLE segurado;
DROP TABLE automovel;

-- 7 & 8

CREATE TABLE automovel (
placa CHAR(7) PRIMARY KEY,
dono CHAR(7),
chassi CHAR(17),
marca VARCHAR,
modelo VARCHAR);

CREATE TABLE segurado (
cpf CHAR(11) PRIMARY KEY,
nome VARCHAR);

CREATE TABLE oficina(
id SERIAL PRIMARY KEY,
nome VARCHAR,
bairro VARCHAR,
cidade VARCHAR,
estado VARCHAR);

CREATE TABLE perito (
id SERIAL PRIMARY KEY,
nome VARCHAR,
automovel_atual CHAR(7) REFERENCES automovel (placa),
id_oficina INT REFERENCES oficina (id));

CREATE TABLE seguro (
id SERIAL PRIMARY KEY,
dia_da_assinatura date,
comprador CHAR(11),
segurado CHAR(11) REFERENCES segurado (cpf),
placa CHAR(7) REFERENCES automovel (placa));

CREATE TABLE sinistro (
id SERIAL PRIMARY KEY,
automovel CHAR(7) REFERENCES automovel (placa),
momento_do_acidente TIMESTAMP,
proprietario CHAR(11) REFERENCES segurado (cpf),
tipo_de_sinistro VARCHAR,
oficina_de_destino INT REFERENCES oficina (id));

CREATE TABLE pericia (
id SERIAL PRIMARY KEY,
automovel CHAR(7) REFERENCES automovel (placa),
perito INT REFERENCES perito (id),
proprietario CHAR(7) REFERENCES segurado (cpf),
dano VARCHAR);

CREATE TABLE reparo (
id SERIAL PRIMARY KEY,
automovel CHAR(7) REFERENCES automovel (placa),
proprietario CHAR(11) REFERENCES segurado (cpf),
valor NUMERIC,
data_inicio DATE,
data_fim DATE);

-- 9
DROP TABLE reparo;
DROP TABLE pericia;
DROP TABLE sinistro;
DROP TABLE seguro;
DROP TABLE perito;
DROP TABLE oficina;
DROP TABLE segurado;
DROP TABLE automovel;