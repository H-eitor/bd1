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

ALTER TABLE ONLY public.tarefas DROP CONSTRAINT tarefas_func_resp_cpf_fkey;
ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_superior_cpf_fkey;
ALTER TABLE ONLY public.tarefas DROP CONSTRAINT id_unico;
ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
DROP TABLE public.tarefas;
DROP TABLE public.funcionario;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: heitordsa
--

CREATE TABLE public.funcionario (
    cpf character(11) NOT NULL,
    data_nasc character(10) NOT NULL,
    nome character varying NOT NULL,
    funcao character varying(11) NOT NULL,
    nivel character(1) NOT NULL,
    superior_cpf character(11),
    CONSTRAINT funcionario_check CHECK ((((funcao)::text = 'SUP_LIMPEZA'::text) OR (((funcao)::text = 'LIMPEZA'::text) AND (superior_cpf IS NOT NULL)))),
    CONSTRAINT funcionario_nivel_check CHECK ((nivel = ANY (ARRAY['J'::bpchar, 'P'::bpchar, 'S'::bpchar])))
);


ALTER TABLE public.funcionario OWNER TO heitordsa;

--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: heitordsa
--

CREATE TABLE public.tarefas (
    id character(10) NOT NULL,
    descricao character varying NOT NULL,
    func_resp_cpf character(11),
    prioridade smallint NOT NULL,
    status character(1) NOT NULL,
    CONSTRAINT tarefa_chk_func_valido CHECK (((func_resp_cpf IS NOT NULL) OR (status = 'P'::bpchar))),
    CONSTRAINT tarefa_chk_status_valido CHECK ((status = ANY (ARRAY['P'::bpchar, 'E'::bpchar, 'C'::bpchar]))),
    CONSTRAINT tarefas_chk_prioridade_valida CHECK (((prioridade >= 0) AND (prioridade <= 5)))
);


ALTER TABLE public.tarefas OWNER TO heitordsa;

--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: heitordsa
--

INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678911', '1980-05-07', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678912', '1980-03-08', 'Jose da Silva', 'LIMPEZA', 'J', '12345678911');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678914', '1989-01-20', 'Rooney Sanchez', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678915', '1998-04-21', 'Veronica Alvarado', 'SUP_LIMPEZA', 'P', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678917', '1970-08-21', 'Kieran Eaton', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678918', '1986-05-13', 'Lara Reilly', 'SUP_LIMPEZA', 'P', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678920', '1904-09-17', 'Virginia Delgado', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678921', '1985-10-19', 'Jacqueline Holman', 'SUP_LIMPEZA', 'P', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678922', '1991-08-18', 'Joan Haney', 'LIMPEZA', 'J', '12345678920');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678923', '1982-12-02', 'Arthur Griffin', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678916', '1994-08-22', 'Clark Best', 'LIMPEZA', 'J', '12345678920');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678919', '1976-09-11', 'Gary Trujillo', 'LIMPEZA', 'J', '12345678920');
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432111', '1980-02-21', 'Xyla Ramirez', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO public.funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('98765432122', '1987-11-03', 'Nina Howard', 'SUP_LIMPEZA', 'S', NULL);


--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: heitordsa
--

INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES ('2147483646', 'limpar chão do corredor central', '98765432111', 0, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES ('2147483660', 'limpar portas do 1o andar', NULL, 2, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES ('2147483647', 'limpar janelas da sala 203', '98765432122', 1, 'E');


--
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: heitordsa
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);


--
-- Name: tarefas id_unico; Type: CONSTRAINT; Schema: public; Owner: heitordsa
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT id_unico UNIQUE (id);


--
-- Name: funcionario funcionario_superior_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heitordsa
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_superior_cpf_fkey FOREIGN KEY (superior_cpf) REFERENCES public.funcionario(cpf);


--
-- Name: tarefas tarefas_func_resp_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: heitordsa
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT tarefas_func_resp_cpf_fkey FOREIGN KEY (func_resp_cpf) REFERENCES public.funcionario(cpf) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

