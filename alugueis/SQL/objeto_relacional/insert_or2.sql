-- locadores

INSERT INTO tb_locador VALUES('481.531.180-30', 'Martina', 'F', TO_DATE('11/01/1989', 'dd/mm/yyyy'), tp_array_telefone('792476-5710'),'03318000');


INSERT INTO tb_locador VALUES('091.665.070-73', 'Guilherme', 'M', TO_DATE('08/02/1995', 'dd/mm/yyyy'), tp_array_telefone('492275-6381'),'13216000');


INSERT INTO tb_locador VALUES('123.419.870-36', 'Luisa', 'F', TO_DATE('06/09/1986', 'dd/mm/yyyy'), tp_array_telefone('492677-9367'),'01045001');

INSERT INTO tb_locador VALUES (
	'552.010.750-53', 'Maria Clara', 'F',
	TO_DATE('11/12/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('292825-3635')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042')
);

-- Fiadores

INSERT INTO tb_fiador VALUES('657.885.490-86', 'Fernanda', 'F', TO_DATE('08/08/1987', 'dd/mm/yyyy'), tp_array_telefone('192385-5637'),'16015244');

INSERT INTO tb_fiador VALUES('521.907.640-09', 'Bruno', 'M', TO_DATE('04/02/1992', 'dd/mm/yyyy'), tp_array_telefone('193233-7193'),'30130005');

INSERT INTO tb_fiador VALUES('829.491.020-18', 'Rose', 'F', TO_DATE('03/05/2001', 'dd/mm/yyyy'), tp_array_telefone('793470-9172'),'62011140');

INSERT INTO tb_fiador VALUES (
	'222.816.320-16', 'Matilda', 'F',
	TO_DATE('05/08/2001', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('393286-3330')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')
);

-- Locatarios

INSERT INTO tb_locatario VALUES('053.428.500-70', 'José Felipe', 'M', TO_DATE('07/10/1987', 'dd/mm/yyyy'), tp_array_telefone('692064-4037'),'16015244');

INSERT INTO tb_locatario VALUES('146.000.310-16', 'Maria Alice', 'F', TO_DATE('10/03/1989', 'dd/mm/yyyy'), tp_array_telefone('993240-3583'),'30130005');

INSERT INTO tb_locatario VALUES('522.046.960-64', 'Matheus', 'M', TO_DATE('06/02/1987', 'dd/mm/yyyy'), tp_array_telefone('893183-7222'),'62011140');

INSERT INTO tb_locatario VALUES(
	'738.529.010-81', 'Mariana', 'F',
	TO_DATE('05/06/1993', 'dd/mm/yyyy'),
	tp_array_telefone(
		tp_telefone('833743-5658'),
		tp_telefone('893082-8338')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')
);

INSERT INTO tb_sala (
	codigo, dono, area, alugueis,
	preco_unit, endereco, administrador
) VALUES (
	0, 100, 100, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2010', 'dd/mm/yyyy'),
		TO_DATE('01/02/2010', 'dd/mm/yyyy'), tp_lucro(30, 70),
		(SELECT REF(t) FROM tb_locador t WHERE cpf = '222.816.320-16'),
		(SELECT REF(t) FROM tb_locador t WHERE cpf = '738.529.010-81'),
	)), 
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042'),
	(SELECT REF(t) FROM tb_locador t WHERE cpf = '552.010.750-53'),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '654.312.123-66')
);

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