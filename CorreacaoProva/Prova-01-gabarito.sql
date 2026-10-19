-- Active: 1792448587841@@127.0.0.1@5432@prova1@public
DROP TABLE IF EXISTS itens_venda;
CREATE TABLE itens_venda (
    id             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    venda_id       INTEGER       NOT NULL,
    data_venda     DATE          NOT NULL,
    produto        TEXT          NOT NULL,
    categoria      TEXT          NOT NULL,
    unidade        TEXT          NOT NULL,
    quantidade     NUMERIC(10,3) NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL
);
INSERT INTO itens_venda (venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES
(5001, '2026-09-08', 'Pao frances',     'Padaria',     'Kg', 0.800, 17.90),
(5001, '2026-09-08', 'Queijo minas',    'Laticinio',   'Kg', 0.350, 46.00),
(5001, '2026-09-08', 'Sonho',           'Confeitaria', 'UN', 3.000,  7.20),
(5002, '2026-09-08', 'Pao de queijo',   'Padaria',     'Kg', 0.600, 42.50),
(5002, '2026-09-08', 'Bolo de fuba',    'Confeitaria', 'UN', 1.000, 26.00),
(5002, '2026-09-08', 'Iogurte natural', 'Laticinio',   'UN', 4.000,  3.75),
(5002, '2026-09-08', 'Cafe em graos',   'Mercearia',   'Kg', 0.500, 72.00),
(5003, '2026-09-09', 'Pao frances',     'Padaria',     'Kg', 1.500, 17.90),
(5003, '2026-09-09', 'Rosca doce',      'Confeitaria', 'UN', 2.000, 14.50),
(5004, '2026-09-10', 'Torta de frango', 'Confeitaria', 'UN', 1.000, 62.00),
(5004, '2026-09-10', 'Pao de queijo',   'Padaria',     'Kg', 0.400, 42.50),
(5004, '2026-09-10', 'Queijo minas',    'Laticinio',   'Kg', 0.500, 46.00),
(5005, '2026-09-11', 'Pao frances',     'Padaria',     'Kg', 0.450, 18.50),
(5005, '2026-09-11', 'Sonho',           'Confeitaria', 'UN', 6.000,  7.20),
(5005, '2026-09-11', 'Cafe em graos',   'Mercearia',   'Kg', 0.250, 72.00);
-- tabela
SELECT * FROM itens_venda ORDER BY id;
-- totais por venda
SELECT venda_id, data_venda, COUNT(*) itens, MAX(valor_unitario) maior, SUM(quantidade*valor_unitario) bruto, ROUND(SUM(quantidade*valor_unitario),2) total FROM itens_venda GROUP BY venda_id, data_venda ORDER BY venda_id;
-- por categoria
SELECT categoria, COUNT(*) itens, MAX(valor_unitario) maior, ROUND(AVG(valor_unitario),2) media, ROUND(SUM(quantidade*valor_unitario),2) total FROM itens_venda GROUP BY categoria ORDER BY categoria;
-- 5a Padaria AND quantidade < 1
SELECT COUNT(*) FROM itens_venda WHERE categoria = 'Padaria' AND quantidade < 1;
-- 5b BETWEEN 17.90 AND 46.00
SELECT id, valor_unitario FROM itens_venda WHERE valor_unitario BETWEEN 17.90 AND 46.00;
-- 5c IN
SELECT COUNT(*) FROM itens_venda WHERE produto IN ('Sonho', 'Rosca doce', 'Pao de queijo');
-- 5d MAX laticinio
SELECT MAX(valor_unitario) FROM itens_venda WHERE categoria = 'Laticinio';
-- 5e AVG pao frances
SELECT AVG(valor_unitario), ROUND(AVG(valor_unitario), 2) FROM itens_venda WHERE produto = 'Pao frances';
-- 5f total 5003
SELECT SUM(quantidade * valor_unitario), ROUND(SUM(quantidade * valor_unitario), 2) FROM itens_venda WHERE venda_id = 5003;
-- 5g HAVING COUNT >= 3 quantas vendas
SELECT venda_id FROM itens_venda GROUP BY venda_id HAVING COUNT(*) >= 3 ORDER BY venda_id;
-- 5h ORDER BY dois criterios padaria
SELECT produto, valor_unitario, quantidade FROM itens_venda WHERE categoria = 'Padaria' ORDER BY valor_unitario, quantidade DESC;
-- 5i confeitaria count
SELECT categoria, COUNT(*) FROM itens_venda GROUP BY categoria;
-- 5j HAVING MAX > 50
SELECT venda_id, MAX(valor_unitario) FROM itens_venda GROUP BY venda_id HAVING MAX(valor_unitario) > 50 ORDER BY venda_id;
-- 6.1 alternativas: media por categoria com mais de dois itens
-- correta
SELECT categoria, ROUND(AVG(valor_unitario), 2) AS media FROM itens_venda GROUP BY categoria HAVING COUNT(*) > 2;
-- WHERE COUNT
SELECT categoria, ROUND(AVG(valor_unitario), 2) AS media FROM itens_venda WHERE COUNT(*) > 2 GROUP BY categoria;
-- GROUP BY categoria, produto
SELECT categoria, ROUND(AVG(valor_unitario), 2) AS media FROM itens_venda GROUP BY categoria, produto HAVING COUNT(*) > 2;
-- sem GROUP BY
SELECT categoria, ROUND(AVG(valor_unitario), 2) AS media FROM itens_venda HAVING COUNT(*) > 2;
-- 6.2 GROUP BY sem data_venda
SELECT venda_id, data_venda, SUM(quantidade * valor_unitario) FROM itens_venda GROUP BY venda_id;
-- 6.4 BETWEEN equivalencia
SELECT COUNT(*) FROM itens_venda WHERE valor_unitario BETWEEN 7.20 AND 18.50;
SELECT COUNT(*) FROM itens_venda WHERE valor_unitario >= 7.20 AND valor_unitario <= 18.50;
SELECT COUNT(*) FROM itens_venda WHERE valor_unitario > 7.20 AND valor_unitario < 18.50;
-- 7.1 padaria por produto
SELECT produto, SUM(quantidade) AS quantidade_total, ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total FROM itens_venda WHERE categoria = 'Padaria' GROUP BY produto HAVING SUM(quantidade * valor_unitario) > 40 ORDER BY valor_total DESC;
-- sem HAVING
SELECT produto, SUM(quantidade) AS quantidade_total, ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total FROM itens_venda WHERE categoria = 'Padaria' GROUP BY produto ORDER BY valor_total DESC;
-- 7.2 por data entre 09 e 11
SELECT data_venda, COUNT(*) AS itens, MAX(valor_unitario) AS maior_valor FROM itens_venda WHERE data_venda BETWEEN '2026-09-09' AND '2026-09-11' GROUP BY data_venda ORDER BY data_venda;
-- sem WHERE
SELECT data_venda, COUNT(*) AS itens, MAX(valor_unitario) AS maior_valor FROM itens_venda GROUP BY data_venda ORDER BY data_venda;
-- IN nas datas
SELECT data_venda, COUNT(*) AS itens, MAX(valor_unitario) AS maior_valor FROM itens_venda WHERE data_venda IN ('2026-09-09', '2026-09-10', '2026-09-11') GROUP BY data_venda ORDER BY data_venda;


-- v3: Q4 sobre itens_venda
BEGIN;
-- Q4A venda 5006
INSERT INTO itens_venda (venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES
(5006, '2026-09-12', 'Pao de queijo', 'Padaria',     'Kg', 0.700, 42.50),
(5006, '2026-09-12', 'Bolo de fuba',  'Confeitaria', 'UN', 1.000, 26.00);
SELECT * FROM itens_venda WHERE venda_id = 5006;
ROLLBACK;
-- Q4B 1 id informado
INSERT INTO itens_venda (id, venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES (16, 5007, '2026-09-12', 'Sonho', 'Confeitaria', 'UN', 2.000, 7.20);
-- Q4B 2 sem produto
INSERT INTO itens_venda (venda_id, data_venda, categoria, unidade, quantidade, valor_unitario) VALUES (5007, '2026-09-12', 'Confeitaria', 'UN', 2.000, 7.20);
BEGIN;
-- Q4B 3 completo
INSERT INTO itens_venda (venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES (5007, '2026-09-12', 'Sonho', 'Confeitaria', 'UN', 2.000, 7.20);
ROLLBACK;
-- Q4B 4 venda_id NULL
INSERT INTO itens_venda (venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES (NULL, '2026-09-12', 'Sonho', 'Confeitaria', 'UN', 2.000, 7.20);
BEGIN;
-- Q4B 5 quantidade 2 sem casas
INSERT INTO itens_venda (venda_id, data_venda, produto, categoria, unidade, quantidade, valor_unitario) VALUES (5007, '2026-09-12', 'Rosca doce', 'Confeitaria', 'UN', 2, 14.50);
SELECT id, quantidade FROM itens_venda WHERE venda_id = 5007;
ROLLBACK;
SELECT COUNT(*) AS linhas_depois FROM itens_venda;
-- v3: Q5 com uma clausula por linha e ORDER BY
SELECT categoria, COUNT(*) AS itens FROM itens_venda GROUP BY categoria ORDER BY categoria;
SELECT venda_id, MAX(valor_unitario) AS maior_valor FROM itens_venda GROUP BY venda_id HAVING MAX(valor_unitario) > 50 ORDER BY venda_id;
SELECT categoria, ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total FROM itens_venda GROUP BY categoria HAVING SUM(quantidade * valor_unitario) > 60 ORDER BY categoria;
SELECT MAX(valor_unitario) AS maior_valor FROM itens_venda WHERE categoria = 'Laticinio';
SELECT ROUND(AVG(valor_unitario), 2) AS media FROM itens_venda WHERE produto = 'Pao frances';
SELECT ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total FROM itens_venda WHERE venda_id = 5005;
SELECT COUNT(*) AS itens FROM itens_venda WHERE categoria = 'Padaria' AND quantidade < 1;
SELECT COUNT(*) AS itens FROM itens_venda WHERE produto IN ('Sonho', 'Rosca doce', 'Pao de queijo');
-- venda_id se repete
SELECT venda_id, COUNT(*) FROM itens_venda GROUP BY venda_id HAVING COUNT(*) > 1 ORDER BY venda_id;
