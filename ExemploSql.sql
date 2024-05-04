-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
id_cliente serial PRIMARY KEY,
cpf_cliente NOT NULL varchar(14),
nome_cliente varchar(50),
celular_cliente varchar(15)
)

CREATE TABLE Produto (
id_produto serial PRIMARY KEY,
valor_produto NOT NULL decimal(7,2),
qtde_produto int
)

CREATE TABLE Compra (
id_pedido serial PRIMARY KEY,
data_compra_produto date,
id_produto INT,
id_cliente INT,
FOREIGN KEY(id_produto) REFERENCES Produto (id_produto),
FOREIGN KEY(id_cliente) REFERENCES  CLIENTE (id_cliente) 
)

