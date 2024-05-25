Create Database pizzaria;

CREATE TABLE IF NOT EXISTS contatos (
    id_contato INT NOT NULL PRIMARY KEY,
    nome VARCHAR(225) NOT NULL,
    email VARCHAR(225) NOT NULL,
    cell VARCHAR(225) NOT NULL,
    pizza VARCHAR(225) NOT NULL,
    cadastro DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS status_pizzas (
    id_status INT NOT NULL PRIMARY KEY,
    id_contato INT NOT NULL,
    status_producao VARCHAR(100) NOT NULL,
    status_entrega VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contatos(id_contato)
);

CREATE TABLE IF NOT EXISTS ENTREGAS (
    ID_ENTREGAS INT NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    CEL VARCHAR(255) NOT NULL,
    PIZZA VARCHAR(255) NOT NULL,
    CADASTRO DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ENTREGA VARCHAR(255) NOT NULL CHECK (ENTREGA IN ('Em Andamento', 'Finalizada')) 
);

CREATE TABLE IF NOT EXISTS pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_entregas INT NOT NULL,
    id_contato INT NOT NULL,
    id_pizza INT NOT NULL,
    data_pedido DATE NOT NULL,
    CONSTRAINT fk_id_entregas FOREIGN KEY (id_entregas) REFERENCES entregas (id_entregas),
    CONSTRAINT fk_id_contato FOREIGN KEY (id_contato) REFERENCES contatos (id_contato),
    CONSTRAINT fk_id_pizza FOREIGN KEY (id_pizza) REFERENCES pizzas (id_pizza)
);

CREATE TABLE IF NOT EXISTS pizzas (
    id_pizza SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tamanho VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    ingredientes TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    area_trabalho VARCHAR(255) NOT NULL,
    data_contratacao DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS contatos;

INSERT INTO contatos (id_contato, nome, email, cell, pizza, cadastro) VALUES

SELECT * from contatos

SELECT * FROM contatos ORDER BY id_contato OFFSET :offset 1 :1

SELECT COUNT(*) FROM contatos

alter TABLE contatos
COLUMN id_contato rename to id

SELECT * FROM contatos WHERE id_contato = ?

-- Inserir dados na tabela contatos
-- Inserir dados na tabela contatos
INSERT INTO contatos (id_contato,nome, email, cell, pizza)
VALUES 
    (1,'Cristiano Ronaldo', 'cristiano@example.com', '111111111', 'Calabresa'),
    (2,'Kevin d Bruyne', 'kevin@example.com', '222222222', 'Margherita'),
    (3,'Pelé Arantes', 'pele@example.com', '333333333', 'Quatro Queijos'),
    (4,'Wayne Rooney', 'wayne@example.com', '444444444', 'Pepperoni'),
    (5,'David Beckham', 'david@example.com', '555555555', 'Frango com Catupiry'),
    (6,'Jorge Henrique', 'jorge@example.com', '666666666', 'Vegetariana');

-- Inserir dados na tabela status_pizzas
-- Supondo que id_contato na tabela status_pizzas seja a chave estrangeira referenciando contatos.id_contato
INSERT INTO status_pizzas (id_status,id_contato, status_producao, status_entrega)
VALUES 
    (1,1, 'Em preparo', 'A caminho'),
    (2,2, 'Pronta', 'Entregue'),
    (3,3, 'Em preparo', 'Pendente'),
    (4,4, 'Pronta', 'Entregue'),
    (5,5, 'Em preparo', 'Atrasada'),
    (6,6, 'Pronta', 'Entregue');

-- Inserir dados na tabela ENTREGAS

INSERT INTO entregas (id_entregas,NOME, EMAIL, CEL, PIZZA, ENTREGA)
VALUES 
    (1,'Cristiano Ronaldo', 'cristiano@example.com', '111111111', 'Calabresa', 'Finalizada'),
    (2,'Kevin d Bruyne', 'kevin@example.com', '222222222', 'Margherita', 'Em Andamento'),
    (3,'Pelé Arantes', 'pele@example.com', '333333333', 'Quatro Queijos', 'Finalizada'),
    (4,'Wayne Rooney', 'wayne@example.com', '444444444', 'Pepperoni', 'Finalizada'),
    (5,'David Beckham', 'david@example.com', '555555555', 'Frango com Catupiry', 'Em Andamento'),
    (6,'Jorge Henrique', 'jorge@example.com', '666666666', 'Vegetariana', 'Em Andamento');

-- Inserir dados na tabela pedido
-- Supondo que id_entregas e id_contato na tabela pedido sejam as chaves estrangeiras referenciando ENTREGAS.ID_ENTREGAS e contatos.id_contato, respectivamente
INSERT INTO pedido (id_entregas, id_contato, id_pizza, data_pedido)
VALUES 
    (1, 1, 1, '2024-05-24'),
    (2, 2, 2, '2024-05-24'),
    (3, 3, 3, '2024-05-24'),
    (4, 4, 4, '2024-05-24'),
    (5, 5, 5, '2024-05-24'),
    (6, 6, 6, '2024-05-24');

-- Inserir dados na tabela pizzas
INSERT INTO pizzas (nome, tamanho, preco, ingredientes)
VALUES 
    ('Calabresa', 'Média', 30.00, 'Calabresa, Mussarela, Cebola, Orégano'),
    ('Margherita', 'Grande', 40.00, 'Mussarela, Tomate, Manjericão, Azeite'),
    ('Quatro Queijos', 'Média', 35.00, 'Mussarela, Parmesão, Gorgonzola, Catupiry'),
    ('Pepperoni', 'Grande', 45.00, 'Mussarela, Pepperoni, Orégano'),
    ('Frango com Catupiry', 'Média', 35.00, 'Frango desfiado, Catupiry, Mussarela, Milho, Orégano'),
    ('Vegetariana', 'Grande', 45.00, 'Mussarela, Tomate, Pimentão, Cebola, Champignon, Azeitona, Orégano');

-- Inserir dados na tabela funcionarios
INSERT INTO funcionarios (nome, email, telefone, cargo, area_trabalho)
VALUES 
    ('Marcos', 'marcos@example.com', '123456789', 'Atendente', 'Atendimento ao cliente'),
    ('Patrícia', 'patricia@example.com', '987654321', 'Cozinheiro', 'Preparação de alimentos'),
    ('Renata', 'renata@example.com', '456123789', 'Entregador', 'Entrega de pedidos'),
    ('José', 'jose@example.com', '321456987', 'Gerente', 'Gerenciamento de equipe'),
    ('Luiz', 'luiz@example.com', '789123456', 'Atendente', 'Atendimento ao cliente'),
    ('Ana', 'ana@example.com', '654987321', 'Cozinheiro', 'Preparação de alimentos');

ALTER TABLE entregas
ADD COLUMN situacao VARCHAR(255) NOT NULL DEFAULT 'Não Entregue' CHECK (situacao IN ('Entregue', 'Não Entregue'));

UPDATE entregas
SET situacao = CASE
    WHEN NOME = 'Cristiano Ronaldo' THEN 'Entregue'
    WHEN NOME = 'Kevin de Bruyne' THEN 'Não Entregue'
    WHEN NOME = 'Pelé Arantes' THEN 'Entregue'
    WHEN NOME = 'Wayne Rooney' THEN 'Entregue'
    WHEN NOME = 'David Beckham' THEN 'Não Entregue'
    WHEN NOME = 'Jorge Henrique' THEN 'Não Entregue'
    ELSE 'Não Entregue'  -- Este ELSE é opcional, e pode ser ajustado conforme necessário.
END;


-- 1. Listar todos os pedidos com detalhes do cliente. Consulta para obter informações sobre os pedidos e os clientes que os fizeram.

SELECT 
    pedido.id_pedido,
    pedido.data_pedido,
    contatos.id_contato,
    contatos.nome AS cliente_nome,
    contatos.email AS cliente_email,
    contatos.cell AS cliente_celular
FROM 
    pedido
INNER JOIN 
    contatos ON pedido.id_contato = contatos.id_contato;

-- 2. Listar todos os itens de pedidos com detalhes da pizza. Consulta para mostrar os itens de pedidos e os detalhes das pizzas associadas a eles.
SELECT 
    pedido.id_pedido,
    pedido.data_pedido,
    pizzas.id_pizza,
    pizzas.nome AS pizza_nome,
    pizzas.tamanho AS pizza_tamanho,
    pizzas.preco AS pizza_preco,
    pizzas.ingredientes AS pizza_ingredientes
FROM 
    pedido
INNER JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza;

-- 3. Listar todos os funcionários com suas respectivas atribuições. Consulta para mostrar os funcionários e as áreas em que estão trabalhando.
SELECT 
    nome AS funcionario_nome,
    cargo AS cargo_funcionario,
    area_trabalho AS area_trabalho_funcionario
FROM 
    funcionarios;

-- 4. Listar todos os pedidos com status e funcionários responsáveis. Consulta para mostrar os pedidos, seus status e os funcionários responsáveis pelo atendimento.
SELECT 
    pedido.id_pedido,
    status_pizzas.status_producao,
    status_pizzas.status_entrega,
    funcionarios.nome AS nome_funcionario
FROM 
    pedido
LEFT JOIN 
    status_pizzas ON pedido.id_status = status_pizzas.id_status
LEFT JOIN 
    funcionarios ON pedido.id_funcionario = funcionarios.id_funcionario;

-- 5. Listar todos os clientes com seus pedidos realizados. Consulta para exibir os clientes e todos os pedidos que eles fizeram.
SELECT 
    contatos.nome AS nome_cliente,
    pedido.id_pedido,
    pedido.data_pedido
FROM 
    contatos
INNER JOIN 
    pedido ON contatos.id_contato = pedido.id_contato;

-- 6. Listar todas as pizzas disponíveis com seus respectivos ingredientes. Consulta para mostrar todas as pizzas disponíveis e seus ingredientes.
SELECT 
    nome,
    ingredientes
FROM 
    pizzas;

-- 7. Listar todos os pedidos com detalhes de entrega. Consulta para mostrar os pedidos com detalhes de entrega.
SELECT 
    pedido.id_pedido,
    entregas.NOME AS nome_cliente,
    entregas.EMAIL AS email_cliente,
    entregas.CEL AS celular_cliente,
    entregas.PIZZA AS pizza,
    pedido.data_pedido,
    entregas.SITUACAO AS situacao_entrega
FROM 
    pedido
INNER JOIN 
    entregas ON pedido.id_entregas = entregas.ID_ENTREGAS;

