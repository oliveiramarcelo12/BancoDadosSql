-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
CPF varchar(14) Not Null PRIMARY KEY,
Nome varchar(80) not null,
Telefone varchar(15) not null,
Endereco varchar(100) not null
)

CREATE TABLE Pedido (
Num_Pedido int not null PRIMARY KEY,
Total_Pedido decimal(7,2) not null,
Data_Pedido date not null,
CPF varchar(14) Not Null,
FOREIGN KEY(CPF) REFERENCES Cliente (CPF)
)

CREATE TABLE Produto (
Id_Produto int not null PRIMARY KEY,
Preco decimal (7,2) not null,
Nome varchar(50) not null,
Estoque int not null
)

CREATE TABLE Contem (
Comprovante  Primary Key Varchar(255),
Quantidade int not null,
Id_Produto int not null,
Num_Pedido int not null,
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto),
FOREIGN KEY(Num_Pedido) REFERENCES Pedido (Num_Pedido)
)

