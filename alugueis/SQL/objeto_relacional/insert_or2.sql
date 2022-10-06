INSERT INTO tb_locador VALUES (
	'552.010.750-53', 'Maria Clara', 'F',
	TO_DATE('11/12/1987', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('292825-3635')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042')
);

INSERT INTO tb_fiador VALUES (
	'222.816.320-16', 'Matilda', 'F',
	TO_DATE('05/08/2001', 'dd/mm/yyyy'),
	tp_array_telefone(tp_telefone('393286-3330')),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')
);

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