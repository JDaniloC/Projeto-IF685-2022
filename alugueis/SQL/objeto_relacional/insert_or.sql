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
	codigo, dono, area, alugueis,
	preco_unit, endereco, administrador
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

