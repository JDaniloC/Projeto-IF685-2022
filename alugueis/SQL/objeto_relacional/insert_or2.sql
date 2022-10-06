-- Drop dos tipos e tabelas
DROP TABLE tb_sala;
/
DROP TYPE tp_sala;
/
DROP TYPE tp_nt_aluguel;
/

-- Criação dos tipos
CREATE OR REPLACE TYPE tp_aluguel AS OBJECT (
  	data_inicio DATE,
  	data_final DATE,
  	luro tp_lucro,
    fiador REF tp_fiador,
    locatario REF tp_locatario
);
/

CREATE OR REPLACE TYPE tp_nt_aluguel AS TABLE OF tp_aluguel;
/

CREATE OR REPLACE TYPE tp_sala AS OBJECT (
    codigo INTEGER,
    area NUMBER(6, 2),
	preco_unit NUMBER(6, 2),
    alugueis tp_nt_aluguel,
    endereco REF tp_endereco,
    dono REF tp_locador,
    administrador REF tp_corretor
);
/

-- Criação das tabelas
CREATE TABLE tb_fiador OF tp_fiador (
    CONSTRAINT fiador_cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT fiador_sexo_check CHECK (sexo IN ('M', 'F')),
    endereco WITH ROWID REFERENCES tb_endereco
);
/

CREATE TABLE tb_locatario OF tp_locatario (
    CONSTRAINT locatario_cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT locatario_sexo_check CHECK (sexo IN ('M', 'F')),
    endereco WITH ROWID REFERENCES tb_endereco
);
/

CREATE TABLE tb_locador OF tp_locador (
    CONSTRAINT locador_cpf_pkey PRIMARY KEY(cpf),
    CONSTRAINT locador_sexo_check CHECK (sexo IN ('M', 'F')),
    endereco WITH ROWID REFERENCES tb_endereco
);
/

CREATE TABLE tb_sala OF tp_sala (
    CONSTRAINT sala_pkey PRIMARY KEY(codigo),
	dono WITH ROWID REFERENCES tb_locador,
    endereco WITH ROWID REFERENCES tb_endereco,
	administrador WITH ROWID REFERENCES tb_corretor
) NESTED TABLE alugueis STORE AS tb_alugueis;
/

-- Fiadores
INSERT INTO tb_fiador VALUES(
	'657.885.490-86', 'Fernanda', 'F',
	TO_DATE('08/08/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('192385-5637')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '16015244')
);
INSERT INTO tb_fiador VALUES(
	'521.907.640-09', 'Bruno', 'M',
	TO_DATE('04/02/1992', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('193233-7193')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30130005')
);
INSERT INTO tb_fiador VALUES(
	'829.491.020-18', 'Rose', 'F',
	TO_DATE('03/05/2001', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('793470-9172')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '62011140')
);
INSERT INTO tb_fiador VALUES (
	'222.816.320-16', 'Matilda', 'F',
	TO_DATE('05/08/2001', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('393286-3330')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')
);
INSERT INTO tb_fiador VALUES (
	'668.011.180-30', 'Marcos', 'M',
	TO_DATE('07/09/1985', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('393375-1232')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765')
);
INSERT INTO tb_fiador VALUES (
	'259.829.110-70', 'Fabiana', 'F',
	TO_DATE('09/11/1994', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('892216-0150')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '79002290')
);
INSERT INTO tb_fiador VALUES (
	'379.840.440-23', 'Roberto', 'M',
	TO_DATE('10/06/1983', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('293458-3845')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '68376315')
);

-- Locatarios
INSERT INTO tb_locatario VALUES(
	'053.428.500-70', 'José Felipe', 'M',
	TO_DATE('07/10/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('692064-4037')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '16015244')
);
INSERT INTO tb_locatario VALUES(
	'146.000.310-16', 'Maria Alice', 'F',
	TO_DATE('10/03/1989', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('993240-3583')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30130005')
);
INSERT INTO tb_locatario VALUES(
	'522.046.960-64', 'Matheus', 'M',
	TO_DATE('06/02/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('893183-7222')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '62011140')
);
INSERT INTO tb_locatario VALUES(
	'738.529.010-81', 'Mariana', 'F',
	TO_DATE('05/06/1993', 'dd/mm/yyyy'),
	tp_array_telefone(
		tp_telefone('833743-5658'),
		tp_telefone('893082-8338')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')
);
INSERT INTO tb_locatario VALUES(
	'103.320.160-05', 'Arthur', 'M',
	TO_DATE('03/12/1988', 'dd/mm/yyyy'), 
	tp_array_telefone(tp_telefone('492714-2661')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '43815300')
);
INSERT INTO tb_locatario VALUES(
	'019.588.030-73', 'Lucas Henrique', 'M',
	TO_DATE('03/08/1999', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('192884-8564')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '79002290')
);
INSERT INTO tb_locatario VALUES(
	'169.161.620-66', 'Virginia', 'F',
	TO_DATE('09/07/1991', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('292896-8620')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '68376315')
);

-- Locadores
INSERT INTO tb_locador VALUES(
	'481.531.180-30', 'Martina', 'F',
	TO_DATE('11/01/1989', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('792476-5710')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '03318000')
);
INSERT INTO tb_locador VALUES(
	'091.665.070-73', 'Guilherme', 'M',
	TO_DATE('08/02/1995', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('492275-6381')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '13216000')
);
INSERT INTO tb_locador VALUES(
	'123.419.870-36', 'Luisa', 'F',
	TO_DATE('06/09/1986', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('492677-9367')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '01045001')
);
INSERT INTO tb_locador VALUES (
	'552.010.750-53', 'Maria Clara', 'F',
	TO_DATE('11/12/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('292825-3635')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042')
);
INSERT INTO tb_locador VALUES (
	'804.759.740-00', 'Maria Flor', 'F', 
	TO_DATE('07/01/1993', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('792117-7403')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765')
);
INSERT INTO tb_locador VALUES (
	'652.730.540-01', 'Isabela', 'F',
	TO_DATE('08/07/1985', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('292233-8576')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '59063340')
);
INSERT INTO tb_locador VALUES (
	'302.292.330-90', 'Levi', 'M',
	TO_DATE('10/08/2003', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('992677-9486')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '66055260')
);

-- Sala 1
INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	0, 100, 100, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2010', 'dd/mm/yyyy'),
		TO_DATE('01/02/2010', 'dd/mm/yyyy'), tp_lucro(30, 70),
		(SELECT REF(t) FROM tb_fiador t WHERE cpf = '222.816.320-16'),
		(SELECT REF(t) FROM tb_locatario t WHERE cpf = '738.529.010-81')
	)), 
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042'),
	(SELECT REF(t) FROM tb_locador t WHERE cpf = '552.010.750-53'),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '654.312.123-66')
);

-- Sala 2
INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	1, 200, 300, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2011', 'dd/mm/yyyy'),
		TO_DATE('01/02/2012', 'dd/mm/yyyy'), tp_lucro(40, 60), 
		(SELECT REF(t) FROM tb_fiador t WHERE cpf = '668.011.180-30'),
		(SELECT REF(t) FROM tb_locatario t WHERE cpf = '103.320.160-05')
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '90480000'),
	(SELECT REF(t) FROM tb_locador t WHERE cpf = '804.759.740-00'),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '970.465.370-03')
);

-- Sala 3
INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	2, 50, 150, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2009', 'dd/mm/yyyy'),
		TO_DATE('01/02/2013', 'dd/mm/yyyy'), tp_lucro(10, 90),  
		(SELECT REF(t) FROM tb_fiador t WHERE cpf = '259.829.110-70'),
		(SELECT REF(t) FROM tb_locatario t WHERE cpf = '019.588.030-73')
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765'),
	(SELECT REF(t) FROM tb_locador t WHERE cpf = '652.730.540-01'),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '261.319.150-32')
);


-- Sala 4
INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	3, 350, 75, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2012', 'dd/mm/yyyy'),
		TO_DATE('01/02/2015', 'dd/mm/yyyy'), tp_lucro(40, 60),  
		(SELECT REF(t) FROM tb_fiador t WHERE cpf = '379.840.440-23'),
		(SELECT REF(t) FROM tb_locatario t WHERE cpf = '169.161.620-66')
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '51020280'),
	(SELECT REF(t) FROM tb_locador t WHERE cpf = '302.292.330-90'),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '140.067.983-45')
);

-- Sala 5
INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    456,
    64,
    120,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/09/2022', 'dd/mm/yyyy'),
            TO_DATE('22/09/2022', 'dd/mm/yyyy'),
            tp_lucro(
                45,
                55
            ),
            (SELECT REF(F) from tb_fiador F WHERE cpf = '657.885.490-86'),
            (SELECT REF(L) from tb_locatario L WHERE cpf = '053.428.500-70')
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '62011140'),
    (SELECT REF(L) FROM tb_locador L WHERE cpf = '481.531.180-30'),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '948.695.710-05')
);

-- Sala 6
INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    460,
    40,
    60,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/07/2022', 'dd/mm/yyyy'),
            TO_DATE('22/09/2022', 'dd/mm/yyyy'),
            tp_lucro(
                65,
                45
            ),
            (SELECT REF(F) from tb_fiador F WHERE cpf = '521.907.640-09'),
            (SELECT REF(L) from tb_locatario L WHERE cpf = '146.000.310-16')
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '16015244'),
    (SELECT REF(L) FROM tb_locador L WHERE cpf = '091.665.070-73'),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '602.312.980-30')
);

-- Sala 7
INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    455,
    100,
    200,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/01/2022', 'dd/mm/yyyy'),
            TO_DATE('22/04/2022', 'dd/mm/yyyy'),
            tp_lucro(
                50,
                50
            ),
            (SELECT REF(F) from tb_fiador F WHERE cpf = '829.491.020-18'),
            (SELECT REF(L) from tb_locatario L WHERE cpf = '522.046.960-64')
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '14401150'),
    (SELECT REF(L) FROM tb_locador L WHERE cpf = '123.419.870-36'),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '970.465.370-03')
);