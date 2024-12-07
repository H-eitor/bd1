--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.8 (Ubuntu 15.8-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE public.tarefas;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: heitordsa
--

CREATE TABLE public.tarefas (
    id character(10),
    atividade character varying,
    id_funcionario character(11),
    setor integer,
    situacao character(1),
    CONSTRAINT setor_valido CHECK ((setor < 32768))
);


ALTER TABLE public.tarefas OWNER TO heitordsa;

--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: heitordsa
--

INSERT INTO public.tarefas (id, atividade, id_funcionario, setor, situacao) VALUES ('2147483646', 'limpar chão do corredor central', '98765432111', 0, 'F');
INSERT INTO public.tarefas (id, atividade, id_funcionario, setor, situacao) VALUES ('2147483647', 'limpar janelas da sala 203', '98765432122', 1, 'F');
INSERT INTO public.tarefas (id, atividade, id_funcionario, setor, situacao) VALUES (NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.tarefas (id, atividade, id_funcionario, setor, situacao) VALUES ('2147483651', 'limpar portas do 1o andar', '32323232911', 32767, 'A');
INSERT INTO public.tarefas (id, atividade, id_funcionario, setor, situacao) VALUES ('2147483652', 'limpar portas do 2o andar', '32323232911', 32766, 'A');


--
-- PostgreSQL database dump complete
--

