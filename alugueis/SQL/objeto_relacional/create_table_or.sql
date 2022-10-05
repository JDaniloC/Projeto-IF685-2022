-- Criação dos tipos

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
    numero VARCHAR2(11) -- Exemplo: 81988556633
);
/

CREATE OR REPLACE TYPE tp_array_telefone AS VARRAY(3) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    cpf VARCHAR2(14),
    nome VARCHAR2(40),
    sexo VARCHAR2(1),
    data_nasc DATE,
    telefones tp_array_telefone,
    endereco REF tp_endereco,
    MEMBER PROCEDURE imprimir_informacoes,
    ORDER MEMBER FUNCTION compara_idade (
        SELF IN OUT NOCOPY tp_pessoa, e tp_pessoa
    ) RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE imprimir_informacoes(SELF IN OUT NOCOPY tp_pessoa) IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf);
            DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
            DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
            DBMS_OUTPUT.PUT_LINE('Data nascimento: ' || data_nasc);
            DBMS_OUTPUT.PUT_LINE('Telefone primário: ' || telefone(0));
        END;
    
    ORDER MEMBER FUNCTION compara_idade (
        SELF IN OUT NOCOPY tp_pessoa, e tp_pessoa
    ) RETURN NUMBER IS
        BEGIN
            IF SELF.idade < e.idade THEN 
                RETURN -1;
            ELSIF SELF.idade > e.idade THEN 
                RETURN 1;
            ELSE 
                RETURN 0;
            END IF;
        END;
END;
/

CREATE OR REPLACE TYPE tp_corretor UNDER tp_pessoa (
    data_admissao DATE,
    salario NUMBER,
    supervisor REF tp_corretor,
    CONSTRUCTOR FUNCTION tp_corretor (corretor tp_corretor) RETURN SELF AS RESULT,
    MEMBER FUNCTION get_salario RETURN NUMBER, 
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
            data_admissao := corretor.data_admissao;
            salario := corretor.salario;
            supervisor := corretor.supervisor;
            RETURN;
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
            dbms_output.put_line('salario: ' || salario);
            dbms_output.put_line('Data nascimento: ' || data_nasc);
            dbms_output.put_line('Data admissão: ' || data_admissao);
            dbms_output.put_line('Telefone primário: ' || telefone(0));
            dbms_output.put_line('CPF do supervisor ' || VALUE(supervisor).cpf);
END;
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa() NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_locador UNDER tp_cliente();
/
CREATE OR REPLACE TYPE tp_locatario UNDER tp_cliente();
/
CREATE OR REPLACE TYPE tp_fiador UNDER tp_cliente();
/

CREATE OR REPLACE TYPE tp_lucro AS OBJECT(
    porc_locador NUMBER(6, 2), 
    porc_corretor NUMBER(6, 2) 
);
/

CREATE OR REPLACE TYPE tp_aluguel AS OBJECT(
  	data_inicio DATE,
  	data_final DATE,
  	luro tp_lucro,
    fiador tp_fiador,
    locatario tp_locatario
);
/

CREATE OR REPLACE TYPE tp_nt_aluguel AS TABLE OF tp_aluguel;
/

CREATE OR REPLACE TYPE tp_sala AS OBJECT(
    codigo INTEGER,
    dono tp_locador,
    area NUMBER(6, 2),
    alugueis tp_nt_aluguel,
	preco_unit NUMBER(6, 2),
    endereco REF tp_endereco,
    administrador tp_corretor
);
/

-- Criação das tabelas

CREATE TABLE tb_endereco OF tp_endereco (
    CONSTRAINT cep_pkey PRIMARY KEY(cep)
);
/

CREATE TABLE tb_corretor OF tp_corretor (
    CONSTRAINT cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT sexo_check CHECK (sexo IN ('M', 'F')),
    endereco WITH ROWID REFERENCES tb_endereco,
    supervisor SCOPE IS tb_corretor
);
/

CREATE TABLE tb_sala OF tp_sala (
    CONSTRAINT sala_pkey PRIMARY KEY(codigo),
    endereco WITH ROWID REFERENCES tb_endereco
) NESTED TABLE alugueis STORE AS tb_alugueis;
/

-- Inserções e consultas
INSERT INTO tb_endereco VALUES (tp_endereco(
    '55123456', 'A', 'Bairro Leal', 'Rua 9',
    'Vitória de todos os santos', 'PE'
));
/

INSERT INTO tb_corretor VALUES (
    '12345678910', 'George Matias', 'M',
    TO_DATE('10/02/2000', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('81912345678'),
        tp_telefone('81998765432')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '55123456'),
    TO_DATE('10/02/2000', 'dd/mm/yyyy'), 0, NULL
);
/

SELECT VALUE(t).cpf AS cpf_corretor FROM tb_corretor t;
/