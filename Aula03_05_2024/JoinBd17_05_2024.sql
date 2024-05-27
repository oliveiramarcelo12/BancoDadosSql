-- EX.1
SELECT cliente.NOME, venda.DUPLIC, venda.valor
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
WHERE cliente.NOME LIKE 'PCTEC%';

-- EX.2
SELECT cliente.NOME,venda.VENCTO
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
WHERE EXTRACT(YEAR FROM venda.VENCTO)=2004 AND EXTRACT(MONTH FROM venda.VENCTO)=11
ORDER BY venda.VENCTO

-- EX.3
SELECT cliente.NOME,venda.VENCTO
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
WHERE  EXTRACT(MONTH FROM venda.VENCTO)=10
ORDER BY venda.VENCTO

-- EX.4
SELECT cliente.NOME, COUNT(*) AS QTDE, SUM(venda.VALOR) AS TOTAL
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
GROUP BY cliente.NOME
ORDER BY TOTAL;

-- EX.5
SELECT cliente.NOME, COUNT(*) AS TITULOS, SUM(venda.VALOR) AS TOTAL
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
GROUP BY cliente.NOME
ORDER BY TOTAL;

-- EX.6
SELECT cliente.NOME AS CLIENTE, COUNT(*) AS VENCIDOS
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
WHERE venda.VENCTO < '2003-12-31'
GROUP BY cliente.NOME
ORDER BY CLIENTE;

-- EX.7
SELECT cliente.NOME AS CLIENTE, venda.VALOR, ROUND(venda.VALOR *0.10,2) AS JUROS,
 ROUND(venda.VALOR *1.10,2) AS TOTAL
FROM cliente INNER JOIN venda ON cliente.CODCLI = venda.CODCLI
WHERE venda.VENCTO < '1999-12-31'
ORDER BY CLIENTE;



