CREATE TABLE farmacias(
    id serial PRIMARY KEY,
    nome varchar,
    bairro varchar UNIQUE,
    cidade varchar,
    estado varchar, 
    sede boolean,
    --CONSTRAINT farmacias_chk_sede_valida CHECK ()
);

CREATE TABLE funcionarios(
    cpf char(11) PRIMARY KEY,
    nome varchar,
    firma int REFERENCES farmacias(id),
    CONSTRAINT funcionarios_chk_cargo_valido CHECK (cargo in ('farmacêutico','vendedor','entregador','caixa','administrador')) 
);

CREATE TABLE medicamentos(
    id serial PRIMARY KEY,
    nome varchar,
    valor numeric,
);

CREATE TABLE vendas();

CREATE TABLE entregas();

CREATE TABLE clientes(
    cpf char(11) PRIMARY KEY,
    nome varchar,
    data_nasc timestamp,
    cadastrado boolean,
    CONSTRAINT clientes_chk_cadastrado_valido CHECK (cadastrado = false OR (age(data_nasc) > 17))
);

CREATE TABLE enderecos(
    cep char(8),
    proprietario char(11) REFERENCES clientes(cpf),
    categoria varchar,
    bairro varchar,
    cidade varchar,
    estado varchar,
    CONSTRAINT enderecos_chk_categoria_valido CHECK (cargo in ('residência','trabalho','outro')) 
);