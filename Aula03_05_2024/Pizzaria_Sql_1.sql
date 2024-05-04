--Consultar informações sobre o cliente onde traga dados de cpf e nome
SELECT CPF, Nome FROM CLIENTE;

-- Consultar Número do pedido e total na tabela pedido
SELECT Num_Pedido,Total_Pedido FROM Pedido

--Consultar Nome Produto e Preço da tabela Produto
SELECT Nome,Preco FROM Produto

--Consultar pedidos com valores acima de 200.00
SELECT Num_Pedido, Total_Pedido
FROM Pedido
WHERE Total_Pedido > 200.00;

--Consultar produtos com preco acima de 30
SELECT Nome, Preco
FROM Produto
WHERE Preco > 30.00;

--Apresentar as pizzas em ordem crescente
SELECT Id_Produto, Nome, Preco, Estoque
FROM Produto
ORDER BY Nome ASC;

--Apresentar as pizzas em ordem descrecente
SELECT Id_Produto, Nome, Preco, Estoque
FROM Produto
ORDER BY Nome Desc;

--Clausula Limit
SELECT Produto,Preco FROM Produto
ORDER BY Nome
LIMIT 5;
