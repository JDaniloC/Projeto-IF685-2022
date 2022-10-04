CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cep VARCHAR(50),
    complemento VARCHAR2(50),
    bairro VARCHAR2(50),
    rua VARCHAR2(50),
    cidade VARCHAR2(50),
    estados VARCHAR2(2) -- SIGLA DO ESTADO EX.: PE
);
/
CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    telefone VARCHAR2(11) -- Exemplo: 81988556633
);
/
CREATE OR REPLACE TYPE lt_telefone AS TABLE OF tp_telefone;
/
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    cpf VARCHAR2(14),
    nome VARCHAR2(40),
    sexo VARCHAR2(1),
    data_nasc DATE,
    cep_pessoa VARCHAR2(8),
    telefone lt_telefone
    -- todos os tipos que herdam de pessoa, precisam de endereco?
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE tp_corretor UNDER tp_pessoa(
    data_admissao DATE,
    salario NUMBER NOT NULL,
    cpf_supervisor VARCHAR2(14),
    endereco_corretor tp_endereco
    MEMBER FUNCTION get_salario RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE BODY tp_corretor AS
    MEMBER FUNCTION get_salario RETURN NUMBER IS
    BEGIN
      RETURN salario
    END;
/
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    endereco_cliente tp_endereco
    -- criar função 
);
/
CREATE OR REPLACE TYPE tp_locador UNDER tp_pessoa(
    -- criar função
);
/
CREATE OR REPLACE TYPE tp_locatario UNDER tp_pessoa(
    -- criar função
);
/
CREATE OR REPLACE TYPE tp_fiador UNDER tp_pessoa(
    -- criar função
);
CREATE OR REPLACE TYPE tp_sala AS OBJECT(
    codigo INTEGER,
    area NUMBER(6, 2),
    endereco_sala tp_endereco,
    cpf_adm VARCHAR2(14),
    cpf_dono VARCHAR2(14)
);
/

