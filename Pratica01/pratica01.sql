-- Active: 1789472963673@@127.0.0.1@5432@bd_hortifruti@public
-- CREATE DATABASE;
DROP TABLE IF EXISTS itens_venda;

CREATE TABLE itens_venda(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    venda_id INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    bairro_entrega TEXT,
    produto_id  INTEGER NOT NULL,
    produto_nome TEXT NOT NULL,
    categoria TEXT NOT NULL,
    unidade TEXT NOT NULL,
    quantidade NUMERIC(10,3) NOT NULL,
    valor_unitario NUMERIC(10,3) NOT NULL
);


INSERT INTO itens_venda (venda_id, data_venda, bairro_entrega, produto_id, produto_nome, categoria, unidade, quantidade, valor_unitario) VALUES
(3001, '2026-08-03', NULL, 1, 'Banana prata', 'Fruta', 'Kg', 1.235, 5.99),
(3001, '2026-08-03', NULL, 5, 'Tomate', 'Legume', 'Kg', 0.874, 7.49),
(3001, '2026-08-03', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 1.000, 2.99),
(3001, '2026-08-03', NULL, 12, 'Cheiro-verde', 'Verdura', 'UN', 2.000, 2.50),

(3002, '2026-08-03', NULL, 6, 'Batata', 'Legume', 'Kg', 2.140, 4.99),
(3002, '2026-08-03', NULL, 9, 'Cebola', 'Legume', 'Kg', 0.965, 5.19),

(3003, '2026-08-03', 'Centro', 3, 'Abacaxi', 'Fruta', 'UN', 2.000, 7.90),
(3003, '2026-08-03', 'Centro', 2, 'Laranja pera', 'Fruta', 'Kg', 3.180, 3.79),
(3003, '2026-08-03', 'Centro', 8, 'Cenoura', 'Legume', 'Kg', 1.020, 4.29),

(3004, '2026-08-04', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.460, 7.49),
(3004, '2026-08-04', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 1.785, 4.49),
(3004, '2026-08-04', NULL, 11, 'Couve', 'Verdura', 'UN', 1.000, 3.00),

(3005, '2026-08-04', NULL, 4, 'Morango', 'Fruta', 'UN', 2.000, 9.90),

(3006, '2026-08-04', 'Lagoinha', 1, 'Banana prata', 'Fruta', 'Kg', 2.310, 5.99),
(3006, '2026-08-04', 'Lagoinha', 6, 'Batata', 'Legume', 'Kg', 1.505, 4.99),
(3006, '2026-08-04', 'Lagoinha', 10, 'Alface crespa', 'Verdura', 'UN', 2.000, 2.99),
(3006, '2026-08-04', 'Lagoinha', 12, 'Cheiro-verde', 'Verdura', 'UN', 1.000, 2.50),

(3007, '2026-08-05', NULL, 2, 'Laranja pera', 'Fruta', 'Kg', 2.450, 3.49),
(3007, '2026-08-05', NULL, 5, 'Tomate', 'Legume', 'Kg', 0.635, 7.99),

(3008, '2026-08-05', NULL, 8, 'Cenoura', 'Legume', 'Kg', 0.780, 4.39),
(3008, '2026-08-05', NULL, 9, 'Cebola', 'Legume', 'Kg', 1.215, 5.19),
(3008, '2026-08-05', NULL, 11, 'Couve', 'Verdura', 'UN', 2.000, 3.00),

(3009, '2026-08-05', 'Centro', 3, 'Abacaxi', 'Fruta', 'UN', 1.000, 7.50),
(3009, '2026-08-05', 'Centro', 4, 'Morango', 'Fruta', 'UN', 1.000, 9.49),
(3009, '2026-08-05', 'Centro', 1, 'Banana prata', 'Fruta', 'Kg', 1.890, 6.29),

(3010, '2026-08-06', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 0.925, 4.79),
(3010, '2026-08-06', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 1.000, 3.29),

(3011, '2026-08-06', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.975, 8.49),
(3011, '2026-08-06', NULL, 6, 'Batata', 'Legume', 'Kg', 3.020, 5.29),
(3011, '2026-08-06', NULL, 12, 'Cheiro-verde', 'Verdura', 'UN', 3.000, 2.50),

(3012, '2026-08-06', 'Planalto', 2, 'Laranja pera', 'Fruta', 'Kg', 4.060, 3.49),
(3012, '2026-08-06', 'Planalto', 8, 'Cenoura', 'Legume', 'Kg', 1.340, 4.39),

(3013, '2026-08-07', NULL, 1, 'Banana prata', 'Fruta', 'Kg', 0.965, 6.49),
(3013, '2026-08-07', NULL, 9, 'Cebola', 'Legume', 'Kg', 0.540, 5.49),
(3013, '2026-08-07', NULL, 11, 'Couve', 'Verdura', 'UN', 1.000, 3.50),

(3014, '2026-08-07', 'Lagoinha', 4, 'Morango', 'Fruta', 'UN', 3.000, 8.90),
(3014, '2026-08-07', 'Lagoinha', 3, 'Abacaxi', 'Fruta', 'UN', 1.000, 6.99),

(3015, '2026-08-08', NULL, 6, 'Batata', 'Legume', 'Kg', 1.250, 5.49),

(3016, '2026-08-08', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.115, 8.99),
(3016, '2026-08-08', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 1.360, 4.79),

(3017, '08-08-2026', NULL, 5, 'tomate', 'Legume', 'Kg', 1.340, 8.99 ),
(3017, '08-08-2026', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 2, 3.49 ),
(3017, '08-08-2026', NULL, 4, 'Morango', 'Fruta', 'UN', 1, 9.90 );

SELECT * FROM itens_venda;

--CONSULTAS
--Consulta 01
SELECT DISTINCT
produto_id,
produto_nome,
categoria,
unidade
FROM
itens_venda
ORDER BY
categoria DESC, produto_nome DESC;


--Consulta 02
SELECT
venda_id,
produto_nome,
valor_unitario,
categoria
FROM
itens_venda
WHERE
categoria IN ('Legume','Verdura') 
AND valor_unitario BETWEEN 3.00 AND 5.00
ORDER BY
valor_unitario DESC, venda_id ASC;


--Consulta 03
SELECT
venda_id,
data_venda,
produto_nome,
quantidade
FROM
itens_venda
WHERE
produto_nome = 'Batata'
ORDER BY
data_venda ASC, venda_id ASC;


--Consulta 04
SELECT DISTINCT
venda_id,
data_venda,
bairro_entrega
FROM
itens_venda
WHERE
bairro_entrega IS NOT NULL
ORDER BY
venda_id ASC;


--Consulta 05
SELECT
venda_id,
produto_nome,
quantidade,
unidade,
valor_unitario,
ROUND (quantidade * valor_unitario,2)  AS valor_item 
FROM
itens_venda
ORDER BY
valor_item DESC, venda_id ASC;


--Consulta 06
SELECT
venda_id,
data_venda,
COALESCE(bairro_entrega,'Retirada no balcao') AS destino,
COUNT(*) AS itens,
ROUND(SUM(quantidade * valor_unitario),2) AS valor_total
FROM
itens_venda
GROUP BY
venda_id,
data_venda,
bairro_entrega
ORDER BY
valor_total DESC;


--Consulta 07
SELECT 
    data_venda,
    COUNT(DISTINCT venda_id) AS vendas,
    COUNT(*) AS itens,
    ROUND(SUM(quantidade * valor_unitario),2) AS faturamento
FROM
itens_venda
GROUP BY
data_venda
ORDER BY
data_venda ASC;


--Consulta 08
SELECT
produto_nome,
produto_id,
unidade,
SUM(quantidade) AS qtd_total,
ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento,
ROUND(AVG(valor_unitario),2) AS media_simples,
ROUND(SUM(quantidade*valor_unitario)/ SUM(quantidade),2) AS media_ponderada
FROM
itens_venda
GROUP BY
produto_id,
produto_nome,
unidade
ORDER BY
faturamento DESC;


--Consulta 09
SELECT
categoria,
COUNT(*) AS itens,
SUM(quantidade) AS qtd_total,
ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento
FROM
itens_venda
GROUP BY
categoria,
unidade
ORDER BY
categoria ASC;


--Consulta 10
SELECT
bairro_entrega,
COUNT(DISTINCT venda_id) AS entregas,
ROUND(SUM(quantidade*valor_unitario),2) AS faturamento
FROM
itens_venda
WHERE
bairro_entrega IS NOT NULL
GROUP BY
bairro_entrega
HAVING
SUM(quantidade*valor_unitario) > 40.00
ORDER BY
faturamento DESC;


--Consulta 11
SELECT
venda_id,
ROUND(SUM(quantidade * valor_unitario), 2) AS total_arredondado,
SUM(ROUND(quantidade * valor_unitario, 2)) AS soma_dos_itens_arredondados
FROM
itens_venda
GROUP BY
venda_id
HAVING
ROUND(SUM(quantidade * valor_unitario),2)<>SUM(ROUND(quantidade*valor_unitario,2))
ORDER BY
venda_id ASC;


/*
//////////////////////////////////////////ANÁLISE DO MODELO DE TABELA//////////////////////////////////////////
---------------------------------------------------------------------------------------------------------------
QUESTÃO 01 - Indicar quais colunas da tabela itens_venda repetem, em várias linhas, um fato que pertence 
apenas à venda, e quais repetem um fato que pertence apenas ao produto (aula prática 04, seção 2.4). Explicar
por que valor_unitario, que também se repete, não está na mesma situação, e descrever o que aconteceria
nas consultas 1 e 8 se o nome de um produto fosse alterado em somente algumas das linhas em que aparece.

RESPOSTA: -Colunas que repetem fatos sobre a venda = 'data_venda' e 'bairro_entrega'.
          -Colunas que repetem fatos sobre o produto = 'produto_nome', 'categoria' e 'unidade'.
          -Porque valor unitario não esta na mesma situação = O mesmo não esta no mesmo caso dos outros fatos 
           pois ele varia o valor de acordo com o tempo.
          -Consultas 1 e 8 = No caso da consulta 01 se o nome produto fosse escrito de formas diferentes 
           (ex: TOMATE e Tomate) o 'SELECT DISTINCT' vai enxergar as varives como nomes de produtos distintos. 
           Ja no caso do caso 08 ele criaria varios grupos diferentes o que geraria uma 'media_ponderada' e 
           'media_simples' incorreta.

---------------------------------------------------------------------------------------------------------------
QUESTÃO 02 - Citar duas regras do minimundo que a tabela criada não garante, isto é, regras enunciadas e não
declaradas. Para uma delas, escrever, sem executar, um INSERT que o SGBD aceitaria e que viola a regra.

RESPOSTA: -Na regra 04 e dito que um produto é vendido sempre na mesma unidade de medida, mas um produto id em
           expecifico pode ser alterado e vendido tanto em 'Kg' quanto em 'UN'.
          -Na regra 06 indica que cada produto aparece no máximo uma vez a cada venda, mas se o nome do produto
           possuir uma variação o mesmo pode aparecer mais de uma vez (ex: BATATA e batata).

---------------------------------------------------------------------------------------------------------------
QUESTÃO 03 - Com base no resultado da Consulta 8, explicar por que a média ponderada do morango é menor que
a média simples, por que a do abacaxi é maior, e por que as duas médias do cheiro-verde são iguais.

RESPOSTA: seguindo o resultado da consulta 8, a diferença dos resustados entre a media simples e a media ponderada se 
          da já que no caso da media simples e utilizado apenas o valor unitario em quantos a media ponderada utiliza 
          a quantidade juntamento com o valor unitario. O morango possui a media simples mais alta ja que sua venda 
          foi mais baixa em relação ao valor unitario, já no abacaxi ocrreu o contrario, as vendas foram maiores quando 
          o valor unitario maior o que ocasionou em uma media ponderada mais alta. No caso do cheiro-verde ambos deram 
          o mesmo resultado, pois o preço não mudou ao decorrer do tempo.

---------------------------------------------------------------------------------------------------------------
*/








