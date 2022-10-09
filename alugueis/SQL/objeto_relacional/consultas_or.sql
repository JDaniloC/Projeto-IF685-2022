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

SELECT DEREF(C.endereco).rua AS RUA, DEREF(C.endereco).nome AS NOME, DEREF(C.endereco).numero AS NUMERO, DEREF(C.endereco).cep AS CEP FROM tb_corretor c WHERE DEREF(c.endereco).estado = 'SP';

-- Varray
SELECT nome, cpf, c.endereco.rua AS rua, c.endereco.estado AS estado, T.* FROM tb_cliente c, TABLE(c.telefones) T; 

-- Nested Table
SELECT * FROM TABLE(SELECT S.alugueis FROM tb_sala S WHERE S.area > 2);
SELECT * FROM TABLE(SELECT S.alugueis FROM tb_sala S WHERE S.area < 2);


