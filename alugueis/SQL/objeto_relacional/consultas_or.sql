SELECT nome, cpf, salario, c.endereco.cep AS cep FROM tb_corretor c;
SELECT nome, cpf, salario, c.endereco.cep AS cep FROM tb_corretor c WHERE sexo = 'F';

-- REF/DEREF
INSERT INTO tb_endereco VALUES (tp_endereco('03962040', 'APTO',
    'Cidade São Mateus', 'Rua Maria Luísa do Val Penteado', 'São Paulo', 'SP'));

INSERT INTO tb_corretor VALUES (
    '654.312.123-66', 'Carla', 'F',
    TO_DATE('10/11/1990', 'dd/mm/yyyy'),
    tp_array_telefone(
        tp_telefone('793274-2758')
    ),
    (SELECT REF(t) FROM tb_endereco t WHERE cep = '03962040'),
    TO_DATE('13/07/2020', 'dd/mm/yyyy'), 3750, NULL);

SELECT C.nome as NOME, DEREF(C.endereco).rua as RUA, DEREF(C.endereco).bairro AS BAIRRO,
DEREF(C.endereco).cep AS CEP 
FROM tb_corretor C WHERE DEREF(C.endereco).estado = 'SP';

-- Overriding member procedure 
DECLARE corretor_atual tp_corretor;
BEGIN
    SELECT VALUE(C) INTO corretor_atual FROM tb_corretor C WHERE cpf = '654.312.123-66'; 
    corretor_atual.imprimir_informacoes();
end;

-- Varray
SELECT nome, cpf, c.endereco.rua AS rua, c.endereco.estado AS estado, T.* FROM tb_corretor c, TABLE(c.telefones) T; 

-- Nested Table

SELECT A.locatario.nome AS Nome_Locatario, A.locatario.cpf AS CPF_LOCATARIO, A.luro.porc_corretor as LUCRO_CORRETOR, 
A.luro.porc_locador as LUCRO_LOCADOR, A.fiador.nome AS Nome_Fiador, A.fiador.cpf AS CPF_FIADOR
FROM TABLE(SELECT S.alugueis 
            FROM tb_sala S 
            WHERE S.area = 50)A;
            
SELECT A.locatario.nome AS Nome_Locatario, A.locatario.cpf AS CPF_LOCATARIO, A.luro.porc_corretor as LUCRO_CORRETOR, 
A.luro.porc_locador as LUCRO_LOCADOR, A.fiador.nome AS Nome_Fiador, A.fiador.cpf AS CPF_FIADOR
FROM TABLE(SELECT S.alugueis 
            FROM tb_sala S 
            WHERE S.preco_unit = 75)A;
