-- Endereços 

INSERT INTO tb_endereco VALUES (tp_endereco('04302021', 'APTO',
    'Parque Imperial', 'Rua Paracatu', 'São Paulo', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('20040002', 'CASA',
    'Centro', 'Avenida Rio Branco', 'Rio de Janeiro', 'RJ'));
INSERT INTO tb_endereco VALUES (tp_endereco('75802095', 'CASA',
    'Vila Jardim Rio Claro', 'Avenida Tocantins', 'Jataí', 'GO'));
INSERT INTO tb_endereco VALUES (tp_endereco('03962040', 'APTO',
    'Cidade São Mateus', 'Rua Maria Luísa do Val Penteado', 'São Paulo', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('14401150', 'APTO',
    'Cidade Nova', 'Rua Frederico Moura', 'Franca', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('64000290', 'APTO',
    'Centro', 'Rua Arlindo Nogueira', 'Teresina', 'PI'));
INSERT INTO tb_endereco VALUES (tp_endereco('76900032', 'CASA',
    'Centro', 'Travessa da CDL', 'Ji-Paraná', 'RO'));
INSERT INTO tb_endereco VALUES (tp_endereco('28035042', 'CASA',
    'Centro', 'Rua Tenente-Coronel Cardoso', 'Campos dos Goytacazes', 'RJ'));
INSERT INTO tb_endereco VALUES (tp_endereco('96204040', 'EMPRESARIAL',
    'Zona Portuária', 'Avenida Almirante Maximiano Fonseca', 'Rio Grande', 'RS'));
INSERT INTO tb_endereco VALUES (tp_endereco('06709015', 'EMPRESARIAL',
    'Lageadinho', 'Rodovia Raposo Tavares', 'Cotia', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('66055260', 'APTO',
    'Nazaré', 'Avenida Governador José Malcher', 'Belém', 'PA'));
INSERT INTO tb_endereco VALUES (tp_endereco('13216000', 'APTO',
    'Vila Joana', 'Avenida São João', 'Jundiaí', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('01045001', 'CASA',
    'República', 'Praça da República', 'São Paulo', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('30120060', 'CASA',
    'Centro', 'Rua dos Carijós', 'Belo Horizonte', 'MG'));
INSERT INTO tb_endereco VALUES (tp_endereco('80520560', 'EMPRESARIAL',
    'Bom Retiro', 'Rua Carlos Augusto Cornelsen', 'Curitiba', 'PR'));
INSERT INTO tb_endereco VALUES (tp_endereco('79002290', 'CASA',
    'Monte Castelo', 'Rua da Imprensa', 'Campo Grande', 'MS'));
INSERT INTO tb_endereco VALUES (tp_endereco('71020631', 'EMPRESARIAL',
    'Guará I', 'QE 11 Área Especial C', 'Brasília', 'DF'));
INSERT INTO tb_endereco VALUES (tp_endereco('16015244', 'APTO',
    'Jardim Sumaré', 'Rua Cristiano Olsen', 'Araçatuba', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('30130005', 'CASA',
    'Boa Viagem', 'Avenida Afonso Pena', 'Belo Horizonte', 'MG'));
INSERT INTO tb_endereco VALUES (tp_endereco('62011140', 'APTO',
    'Centro', 'Rua Domingos Olímpio', 'Sobral', 'CE'));
INSERT INTO tb_endereco VALUES (tp_endereco('51010000', 'EMPRESARIAL',
    'Boa Viagem', 'Av. Engenheiro Antonio de Goes', 'Recife', 'PE'));
INSERT INTO tb_endereco VALUES (tp_endereco('51020280', 'EMPRESARIAL',
    'Boa Viagem', 'Rua Padre Carapuceiro', 'Recife', 'SP'));
INSERT INTO tb_endereco VALUES (tp_endereco('43815300', 'CASA',
    'Nova Candeias', 'Rua Egberto Ferreira', 'Candeias', 'BA'));
INSERT INTO tb_endereco VALUES (tp_endereco('59063340', 'APTO',
    'Lagoa Nova', 'Rua Capitão Dobico', 'Natal', 'RN'));
INSERT INTO tb_endereco VALUES (tp_endereco('29141765', 'APTO',
    'Rio Marinho', 'Rua Orquídea', 'Cariacica', 'ES'));
INSERT INTO tb_endereco VALUES (tp_endereco('68376315', 'CASA',
    'Colinas', 'Rua WE Cinco', 'Altamira', 'PA'));
INSERT INTO tb_endereco VALUES (tp_endereco('29050545', 'EMPRESARIAL',
    'Enseada do Suá', 'Rua José Alexandre Buaiz', 'Vitoria', 'ES'));
INSERT INTO tb_endereco VALUES (tp_endereco('90480000', 'EMPRESARIAL',
    'Boa Vista', 'Avenida Carlos Gomes', 'Porto Alegre', 'RS'));

-- Corretores

INSERT INTO tb_corretor VALUES (
    '654.312.123-66', 'Carla', 'F',
    TO_DATE('10/11/1990', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('793274-2758')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '03962040'),
    TO_DATE('13/07/2020', 'dd/mm/yyyy'), 3750, NULL);

INSERT INTO tb_corretor VALUES (
    '970.465.370-03', 'João Victor', 'M',
    TO_DATE('04/09/1985', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('993435-2795')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '76900032'),
    TO_DATE('06/08/2019', 'dd/mm/yyyy'), 3450, NULL);

INSERT INTO tb_corretor VALUES (
    '261.319.150-32', 'Frederico', 'M',
    TO_DATE('10/02/2000', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('193546-5145')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '04302021'),
    TO_DATE('15/10/2021', 'dd/mm/yyyy'), 2000,
    (SELECT REF(t) FROM tb_corretor t WHERE cpf = '970.465.370-03')
);

INSERT INTO tb_corretor VALUES (
    '140.067.983-45', 'Amanda', 'F',
    TO_DATE('14/01/1998', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('593185-8238')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '20040002'),
    TO_DATE('01/11/2021', 'dd/mm/yyyy'), 1500,
    (SELECT REF(t) FROM tb_corretor t WHERE cpf = '948.695.710-05')
);

INSERT INTO tb_corretor VALUES (
    '093.010.763-78', 'Hélio', 'M',
    TO_DATE('10/04/2002', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('292921-4137')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '75802095'),
    TO_DATE('22/03/2022', 'dd/mm/yyyy'), 5200,
    (SELECT REF(t) FROM tb_corretor t WHERE cpf = '654.312.123-66')
);

INSERT INTO tb_corretor VALUES (
    '948.695.710-05', 'Antônio', 'M',
    TO_DATE('01/12/1980', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('292675-8462')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '14401150'),
    TO_DATE('31/12/2019', 'dd/mm/yyyy'), 2200,
    (SELECT REF(t) FROM tb_corretor t WHERE cpf = '654.312.123-66')
);


INSERT INTO tb_corretor VALUES (
    '602.312.980-30', 'Júlia', 'F',
    TO_DATE('03/09/1996', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('292441-4264')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '64000290'),
    TO_DATE('25/02/2020', 'dd/mm/yyyy'), 1800,
    (SELECT REF(t) FROM tb_corretor t WHERE cpf = '970.465.370-03')
);

-- Salas

INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	0, 100, 100, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2010', 'dd/mm/yyyy'),
		TO_DATE('01/02/2010', 'dd/mm/yyyy'),
		tp_lucro(30, 70), tp_fiador(
			'222.816.320-16', 'Matilda', 'F',
			TO_DATE('05/08/2001', 'dd/mm/yyyy'),
			tp_array_telefone(tp_telefone('393286-3330')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060')),
		tp_locatario(
			'738.529.010-81', 'Mariana', 'F',
			TO_DATE('05/06/1993', 'dd/mm/yyyy'),
			tp_array_telefone(
				tp_telefone('833743-5658'),
				tp_telefone('893082-8338')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '30120060'))
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042'),
	tp_locador(
		'552.010.750-53', 'Maria Clara', 'F',
		TO_DATE('11/12/1987', 'dd/mm/yyyy'),
		tp_array_telefone(tp_telefone('292825-3635')),
		(SELECT REF(t) FROM tb_endereco t WHERE cep = '28035042')),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '654.312.123-66')
);

INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	1, 200, 300, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2011', 'dd/mm/yyyy'),
		TO_DATE('01/02/2012', 'dd/mm/yyyy'),
		tp_lucro(40, 60), tp_fiador(
			'668.011.180-30', 'Marcos', 'M',
            TO_DATE('07/09/1985', 'dd/mm/yyyy'),
            tp_array_telefone(tp_telefone('393375-1232')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765')),
		tp_locatario(
			'103.320.160-05', 'Arthur', 'M',
			TO_DATE('03/12/1988', 'dd/mm/yyyy'), 
			tp_array_telefone(tp_telefone('492714-2661')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '43815300'))
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '90480000'),
	tp_locador(
		'804.759.740-00', 'Maria Flor', 'F', 
		TO_DATE('07/01/1993', 'dd/mm/yyyy'),
		tp_array_telefone(tp_telefone('792117-7403')),
		(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765')),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '970.465.370-03')
);

INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	2, 50, 150, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2009', 'dd/mm/yyyy'),
		TO_DATE('01/02/2013', 'dd/mm/yyyy'),
		tp_lucro(10, 90), tp_fiador(
			'259.829.110-70', 'Fabiana', 'F',
            TO_DATE('09/11/1994', 'dd/mm/yyyy'),
            tp_array_telefone(tp_telefone('892216-0150')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '79002290')),
		tp_locatario(
			'019.588.030-73', 'Lucas Henrique', 'M',
			TO_DATE('03/08/1999', 'dd/mm/yyyy'),
			tp_array_telefone(tp_telefone('192884-8564')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '79002290'))
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '29141765'),
	tp_locador(
		'652.730.540-01', 'Isabela', 'F',
		TO_DATE('08/07/1985', 'dd/mm/yyyy'),
		tp_array_telefone(tp_telefone('292233-8576')),
		(SELECT REF(t) FROM tb_endereco t WHERE cep = '59063340')),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '261.319.150-32')
);

INSERT INTO tb_sala (
	codigo, area, preco_unit, alugueis,
    endereco, dono, administrador
) VALUES (
	3, 350, 75, tp_nt_aluguel(tp_aluguel(
		TO_DATE('01/01/2012', 'dd/mm/yyyy'),
		TO_DATE('01/02/2015', 'dd/mm/yyyy'),
		tp_lucro(40, 60), tp_fiador(
			'379.840.440-23', 'Roberto', 'M',
            TO_DATE('10/06/1983', 'dd/mm/yyyy'),
            tp_array_telefone(tp_telefone('293458-3845')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '68376315')),
		tp_locatario(
			'169.161.620-66', 'Virginia', 'F',
			TO_DATE('09/07/1991', 'dd/mm/yyyy'),
			tp_array_telefone(tp_telefone('292896-8620')),
			(SELECT REF(t) FROM tb_endereco t WHERE cep = '68376315'))
	)),
	(SELECT REF(t) FROM tb_endereco t WHERE cep = '51020280'),
	tp_locador(
		'302.292.330-90', 'Levi', 'M',
		TO_DATE('10/08/2003', 'dd/mm/yyyy'),
		tp_array_telefone(tp_telefone('992677-9486')),
		(SELECT REF(t) FROM tb_endereco t WHERE cep = '66055260')),
	(SELECT REF(t) FROM tb_corretor t WHERE cpf = '140.067.983-45')
);

INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    456, 64, 120,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/09/2022', 'dd/mm/yyyy'),
            TO_DATE('22/09/2022', 'dd/mm/yyyy'),
            tp_lucro(45, 55),
            tp_fiador(
                '829.491.020-18', 
                'Rose', 
                'F', 
                TO_DATE('03/05/2001', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('793470-9172')),
                (SELECT REF(E) FROM tb_endereco E WHERE cep = '62011140')
            ),
            tp_locatario(
                '522.046.960-64', 
                'Matheus', 
                'M', 
                TO_DATE('06/02/1987', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('893183-7222')),
                (SELECT REF(E) FROM tb_endereco E WHERE cep = '62011140')
            )
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '62011140'),
    tp_locador(
        '123.419.870-36',
        'Luisa', 
        'F', 
        TO_DATE('06/09/1986', 'dd/mm/yyyy'), 
        tp_array_telefone(tp_telefone('492677-9367')),
        (SELECT REF(E) FROM tb_endereco E WHERE cep = '01045001')
    ),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '948.695.710-05')
);

INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    460, 40, 60,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/07/2022', 'dd/mm/yyyy'),
            TO_DATE('22/09/2022', 'dd/mm/yyyy'),
            tp_lucro(65, 45),
            tp_fiador(
                '521.907.640-09',
                'Bruno', 
                'M', 
                TO_DATE('04/02/1992', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('193233-7193')),
                (SELECT REF(C) FROM tb_endereco C WHERE cep = '30130005')
            ),
            tp_locatario(
                '146.000.310-16', 
                'Maria Alice', 
                'F', 
                TO_DATE('10/03/1989', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('993240-3583')),
                (SELECT REF(C) FROM tb_endereco C WHERE cep = '30130005')
            )
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '16015244'),
    tp_locador(
        '091.665.070-73', 
        'Guilherme', 
        'M', 
        TO_DATE('08/02/1995', 'dd/mm/yyyy'), 
        tp_array_telefone(tp_telefone('492275-6381')),
        (SELECT REF(C) FROM tb_endereco C WHERE cep = '13216000')
    ),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '602.312.980-30')
);

INSERT INTO tb_sala (codigo, area, preco_unit, alugueis, endereco, dono, administrador)
VALUES (
    455, 100, 200,
    tp_nt_aluguel(
        tp_aluguel(
            TO_DATE('02/01/2022', 'dd/mm/yyyy'),
            TO_DATE('22/04/2022', 'dd/mm/yyyy'),
            tp_lucro(50, 50),
            tp_fiador(
                '657.885.490-86', 
                'Fernanda', 
                'F', 
                TO_DATE('08/08/1987', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('192385-5637')),
                (SELECT REF(E) FROM tb_endereco E WHERE cep = '16015244')
            ),
            tp_locatario(
                '053.428.500-70', 
                'José Felipe', 
                'M', 
                TO_DATE('07/10/1987', 'dd/mm/yyyy'), 
                tp_array_telefone(tp_telefone('692064-4037')),
                (SELECT REF(E) FROM tb_endereco E WHERE cep = '16015244')
            )
        )
    ),
    (SELECT REF(E) FROM tb_endereco E WHERE cep = '14401150'),
    tp_locador(
        '481.531.180-30', 
        'Martina', 
        'F', 
        TO_DATE('11/01/1989', 'dd/mm/yyyy'), 
        tp_array_telefone(tp_telefone('792476-5710')),
        (SELECT REF(E) FROM tb_endereco E WHERE cep = '03318000')
    ),
    (SELECT REF(C) FROM tb_corretor C WHERE cpf = '970.465.370-03')
);

