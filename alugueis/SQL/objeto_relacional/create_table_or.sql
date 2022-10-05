CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cep VARCHAR(50),
    complemento VARCHAR2(50),
    bairro VARCHAR2(50),
    rua VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(2), -- SIGLA DO ESTADO EX.: PE
    FINAL MAP MEMBER FUNCTION get_cep RETURN VARCHAR
);
/
ALTER TYPE tp_endereco
ADD ATTRIBUTE numero NUMBER CASCADE;
/

ALTER TYPE tp_endereco
DROP ATTRIBUTE numero INVALIDATE;
/

CREATE OR REPLACE TYPE BODY tp_endereco AS
    FINAL MAP MEMBER FUNCTION get_cep RETURN VARCHAR IS
        cep VARCHAR(50) := cep;
    BEGIN
        RETURN cep;
    END;
END;
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR2(11) -- Exemplo: 81988556633
);
/

CREATE OR REPLACE TYPE tp_array_telefone AS VARRAY(3) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    cpf VARCHAR2(14),
    nome VARCHAR2(40),
    sexo VARCHAR2(1),
    data_nasc DATE,
    telefone tp_array_telefone,
    endereco REF tp_endereco,
    MEMBER PROCEDURE imprimir_informacoes
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE imprimir_informacoes(SELF IN OUT NOCOPY tp_pessoa) IS
        BEGIN
            dbms_output.put_line('CPF: ' || cpf);
            dbms_output.put_line('Nome: ' || nome);
            dbms_output.put_line('Sexo: ' || sexo);
            dbms_output.put_line('Data nascimento: ' || data_nasc);
            dbms_output.put_line('Telefone primário: ' || telefone(0));
        END;
END;
/
CREATE OR REPLACE TYPE tp_corretor UNDER tp_pessoa (
    data_admissao DATE,
    salario NUMBER,
    cpf_supervisor REF tp_corretor,
    CONSTRUCTOR FUNCTION tp_corretor (corretor tp_corretor) RETURN SELF AS RESULT,
    MEMBER FUNCTION get_salario RETURN NUMBER,
    ORDER MEMBER FUNCTION compara_salario RETURN NUMBER,
    OVERRIDING MEMBER PROCEDURE imprimir_informacoes
);
/

CREATE OR REPLACE TYPE BODY tp_corretor AS
    CONSTRUCTOR FUNCTION tp_corretor (corretor tp_corretor) RETURN SELF AS RESULT IS
        BEGIN
            CPF := corretor.CPF;
            nome := corretor.nome;
            sexo := corretor.sexo;
            data_nasc := corretor.data_nasc;
            telefone := corretor.telefone;
            endereco := corretor.endereco;
            RETURN;
        END;
    ORDER MEMBER FUNCTION compara_salario (SELF IN OUT NOCOPY tp_endereco, e tp_endereco) RETURN NUMBER IS
        BEGIN
            IF SELF.salario < e.salario THEN 
                RETURN -1;
            ELSIF SELF.salario > e.salario THEN 
                RETURN 1;
            ELSE 
                RETURN 0;
            END IF;
        END;
    MEMBER FUNCTION get_salario RETURN NUMBER IS
        BEGIN
            RETURN salario
        END;
    OVERRIDING MEMBER PROCEDURE imprimir_informacoes IS
        BEGIN
            dbms_output.put_line('CPF: ' || cpf);
            dbms_output.put_line('Nome: ' || nome);
            dbms_output.put_line('Sexo: ' || sexo);
            dbms_output.put_line('Data nascimento: ' || data_nasc);
            dbms_output.put_line('Telefone primário: ' || telefone(0));
            dbms_output.put_line('CPF: ' || cpf);
            dbms_output.put_line('Nome: ' || nome);
            dbms_output.put_line('Sexo: ' || sexo);
END;
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    cpf_cliente VARCHAR(14)
);
/

CREATE OR REPLACE TYPE tp_locador UNDER tp_pessoa(
    cpf_locador VARCHAR(14)
);
/

CREATE OR REPLACE TYPE tp_locatario UNDER tp_pessoa(
    cpf_locatario VARCHAR(14)
);
/

CREATE OR REPLACE TYPE tp_fiador UNDER tp_pessoa(
    cpf_fiador VARCHAR(14)
);
/

CREATE OR REPLACE TYPE tp_sala AS OBJECT(
    codigo INTEGER,
    area NUMBER(6, 2),
    endereco_sala REF tp_endereco,
    cpf_adm REF tp_corretor,
    cpf_dono REF tp_locador
);
/


CREATE OR REPLACE TYPE tp_avaliacao AS OBJECT(
	codigo_sala INTEGER,
	preco_unit NUMBER(6, 2),
    cpf_corretor REF tp_corretor,
    cpf_locador REF tp_locador
);
/

CREATE OR REPLACE TYPE tp_lucro AS OBJECT(
    porc_locador NUMBER(6, 2), 
    porc_corretor NUMBER(6, 2) 
);
/

CREATE OR REPLACE TYPE tp_aluguel AS OBJECT(
  	data_inicio DATE,
  	data_final DATE,
    cpf_dono REF tp_locador,
    cpf_fiador REF tp_fiador,
    cpf_locatario REF tp_locatario,
  	porc_locador REF tp_lucro,
    codigo_sala REF tp_sala,
);
/

-- 1. CREATE OR REPLACE TYPE ✅
-- 2. CREATE OR REPLACE TYPE BODY ✅
-- 3. MEMBER PROCEDURE -> Joao
-- 4. MEMBER FUNCTION ✅
-- 5. ORDER MEMBER FUNCTION ✅
-- 6. MAP MEMBER FUNCTION ✅
-- 7. CONSTRUCTOR FUNCTION -> Joao
-- 8. OVERRIDING MEMBER -> Joao
-- 9. FINAL MEMBER ✅
-- 10. NOT INSTANTIABLE TYPE/MEMBER ✅
-- 11. HERANÇA DE TIPOS (UNDER/NOT FINAL) ✅
-- 12. ALTER TYPE ✅
-- 13. CREATE TABLE OF ✅
-- 14. WITH ROWID REFERENCES ✅
-- 15. REF ✅
-- 16. SCOPE IS ✅
-- 17. INSERT INTO
-- 18. VALUE
-- 19. VARRAY ✅
-- 20. NESTED TABLE

CREATE TABLE tb_endereco OF tp_endereco (
    CONSTRAINT cep_pkey PRIMARY KEY(cep)
);
/

CREATE TABLE tb_pessoa OF tp_pessoa (
    CONSTRAINT cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT sexo_check CHECK (sexo IN ('M', 'F')),
    endereco WITH ROWID REFERENCES tb_endereco
);
/

CREATE TABLE tb_telefone OF tp_telefone (
    CONSTRAINT telefone_pkey PRIMARY KEY(cpf_dono, codigo)
);
/

CREATE TABLE tb_corretor OF tp_corretor (
    CONSTRAINT cpf_corretor_pkey PRIMARY KEY(cpf),
    cpf_supervisor SCOPE IS tb_corretor
);
/

CREATE TABLE tb_cliente OF tp_cliente (
    CONSTRAINT cpf_cliente_pkey PRIMARY KEY(cpf)
);
/

CREATE TABLE tb_locador OF tp_locador (
    CONSTRAINT cpf_locador_pkey PRIMARY KEY(cpf)
);
/

CREATE TABLE tb_locatario OF tp_locatario (
    CONSTRAINT cpf_locatario_pkey PRIMARY KEY(cpf)
);
/

CREATE TABLE tb_fiador OF tp_fiador (
    CONSTRAINT cpf_fiador_pkey PRIMARY KEY(cpf)
);
/

CREATE TABLE tb_sala OF tp_sala (
    CONSTRAINT sala_pkey PRIMARY KEY(codigo, cpf_dono),
    endereco WITH ROWID REFERENCES tb_endereco,
    cpf_dono WITH ROWID REFERENCES tb_locador,
    cpf_adm WITH ROWID REFERENCES tb_corretor
);
/

CREATE TABLE tb_avaliacao OF tp_avaliacao (
	CONSTRAINT avaliacao_pkey PRIMARY KEY(codigo_sala, cpf_locador, cpf_corretor),
    cpf_corretor WITH ROWID REFERENCES tb_corretor,
    cpf_locador WITH ROWID REFERENCES tb_locador
);
/

CREATE TABLE tb_lucro OF tp_lucro ( 
	CONSTRAINT porc_locador_pkey PRIMARY KEY(porc_locador) 
);
/

CREATE TABLE tb_aluguel OF tp_aluguel (
	CONSTRAINT alguel_pkey PRIMARY KEY(codigo_sala, cpf_locatario, cpf_dono, data_inicio),
    cpf_dono WITH ROWID REFERENCES tb_locador
    cpf_fiador WITH ROWID REFERENCES tb_fiador,
    cpf_locatario WITH ROWID REFERENCES tb_locatario,
    proc_locador WITH ROWID REFERENCES tb_lucro,
  	codigo_sala WITH ROWID REFERENCES tb_sala
);