DROP TABLE Aluguel;
DROP TABLE Lucro;
DROP TABLE Avaliacao;
DROP TABLE Sala;
DROP TABLE Fiador;
DROP TABLE Locatario;
DROP TABLE Locador;
DROP TABLE Cliente;
DROP TABLE Corretor;
DROP TABLE Telefone;
DROP TABLE Pessoa;
DROP TABLE Endereco;
DROP SEQUENCE sala_seq;

CREATE TABLE Endereco (
    cep VARCHAR2(8),
    complemento VARCHAR2(12),
    bairro VARCHAR2(40),
    rua VARCHAR2(40),
    cidade VARCHAR2(40),
    estado CHAR(2),
    CONSTRAINT cep_pkey PRIMARY KEY(cep)
);

CREATE TABLE Pessoa (
    cpf VARCHAR2(14),
    nome VARCHAR2(40),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nasc DATE,
    cep_pessoa VARCHAR2(8),
        
    CONSTRAINT cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT cep_pessoa_fkey FOREIGN KEY(cep_pessoa) REFERENCES Endereco(cep)
);

CREATE TABLE Telefone (
    cpf_dono VARCHAR2(14),
    numero VARCHAR2(11),
    
    CONSTRAINT telefone_pkey PRIMARY KEY(cpf_dono, numero),
    CONSTRAINT cpf_dono_fkey FOREIGN KEY(cpf_dono) REFERENCES Pessoa(cpf)
);

CREATE TABLE Corretor (
    cpf_corretor VARCHAR2(14),
    data_admissao DATE,
    salario NUMBER,
    cpf_supervisor VARCHAR2(14),
    
    CONSTRAINT cpf_corretor_pkey PRIMARY KEY(cpf_corretor),
    CONSTRAINT cpf_corretor_fkey FOREIGN KEY(cpf_corretor) REFERENCES Pessoa(cpf),
    CONSTRAINT cpf_supervisor_fkey FOREIGN KEY(cpf_supervisor) REFERENCES Corretor(cpf_corretor)
);

CREATE TABLE Cliente (
    cpf_cliente VARCHAR2(14),

    CONSTRAINT cpf_cliente_pkey PRIMARY KEY(cpf_cliente),
    CONSTRAINT cpf_cliente_fkey FOREIGN KEY(cpf_cliente) REFERENCES Pessoa(cpf)
);

CREATE TABLE Locador (
    cpf_locador VARCHAR2(14),

    CONSTRAINT cpf_locador_pkey PRIMARY KEY(cpf_locador),
    CONSTRAINT cpf_locador_fkey FOREIGN KEY(cpf_locador) REFERENCES Cliente(cpf_cliente)
);

CREATE TABLE Locatario (
    cpf_locatario VARCHAR2(14),

    CONSTRAINT cpf_locatario_pkey PRIMARY KEY(cpf_locatario),
    CONSTRAINT cpf_locatario_fkey FOREIGN KEY(cpf_locatario) REFERENCES Cliente(cpf_cliente)
);

CREATE TABLE Fiador (
    cpf_fiador VARCHAR2(14),

    CONSTRAINT cpf_fiador_pkey PRIMARY KEY(cpf_fiador),
    CONSTRAINT cpf_fiador_fkey FOREIGN KEY(cpf_fiador) REFERENCES Cliente(cpf_cliente)
);

CREATE TABLE Sala (
    	codigo INTEGER,
    	area NUMBER(6, 2),
    	cep_sala VARCHAR(8),
    	cpf_adm VARCHAR2(14),
    	cpf_dono VARCHAR2(14),

    CONSTRAINT sala_pkey PRIMARY KEY(codigo, cpf_dono),
    CONSTRAINT cep_sala_fkey FOREIGN KEY(cep_sala) REFERENCES Endereco(cep),
	CONSTRAINT cpf_adm_fkey FOREIGN KEY(cpf_adm) REFERENCES Corretor(cpf_corretor),
	CONSTRAINT cpf_dono_sala_fkey FOREIGN KEY(cpf_dono) REFERENCES Locador(cpf_locador)
);

CREATE TABLE Avaliacao (
	cpf_corretor VARCHAR2(14),
    cpf_locador VARCHAR2(14),
	codigo_sala INTEGER,
	preco_unit NUMBER(6, 2),

    	CONSTRAINT codigo_sala_avaliacao_fkey FOREIGN KEY(codigo_sala, cpf_locador) REFERENCES Sala(codigo, cpf_dono),
	CONSTRAINT cpf_locador_avaliacao_fkey FOREIGN KEY(cpf_locador) REFERENCES Locador(cpf_locador),
	CONSTRAINT cpf_corretor_avaliacao_fkey FOREIGN KEY(cpf_corretor) REFERENCES Corretor(cpf_corretor),
	CONSTRAINT avaliacao_pkey PRIMARY KEY(codigo_sala, cpf_locador, cpf_corretor)
);

CREATE TABLE Lucro ( 
  	porc_locador NUMBER(6, 2), 
    porc_corretor NUMBER(6, 2), 
 
	CONSTRAINT porc_locador_pkey PRIMARY KEY(porc_locador) 
);

CREATE TABLE Aluguel (
  	cpf_locatario VARCHAR2(14),
  	cpf_dono VARCHAR2(14),
  	cpf_fiador VARCHAR2(14),
  	codigo_sala INTEGER,
  	data_inicio DATE,
  	data_final DATE,
  	porc_locador NUMBER(6, 2),

	CONSTRAINT alguel_pkey PRIMARY KEY(codigo_sala, cpf_locatario, cpf_dono, data_inicio),	
	CONSTRAINT porc_locador_fkey FOREIGN KEY (porc_locador) REFERENCES Lucro(porc_locador),
	CONSTRAINT cpf_dono_aluguel_fkey FOREIGN KEY (cpf_dono) REFERENCES Locador(cpf_locador),
	CONSTRAINT cpf_fiador_aluguel_fkey FOREIGN KEY (cpf_fiador) REFERENCES Fiador(cpf_fiador),
	CONSTRAINT cpf_locatario_aluguel_fkey FOREIGN KEY(cpf_locatario) REFERENCES Locatario(cpf_locatario),
	CONSTRAINT codigo_sala_aluguel_fkey FOREIGN KEY (codigo_sala, cpf_dono) REFERENCES Sala(codigo, cpf_dono)
);

CREATE SEQUENCE sala_seq
  MINVALUE 1 
  START WITH 1 
  INCREMENT BY 1 
  NOCACHE;
