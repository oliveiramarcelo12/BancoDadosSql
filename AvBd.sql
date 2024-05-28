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

CREATE TABLE IF NOT EXISTS supervisores_funcionarios (
    id_funcionario INT NOT NULL,
    id_supervisor INT NOT NULL,
    PRIMARY KEY (id_funcionario, id_supervisor),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_supervisor) REFERENCES funcionarios(id_funcionario)
);


CREATE TABLE IF NOT EXISTS promocoes (
    id_promocao SERIAL PRIMARY KEY,
    nome_promocao VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    desconto DECIMAL(10, 2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS horario_funcionamento (
    id_horario SERIAL PRIMARY KEY,
    dia_semana VARCHAR(20) NOT NULL,
    hora_abertura TIME NOT NULL,
    hora_fechamento TIME NOT NULL
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
    (2,'Kevin de Bruyne', 'kevin@example.com', '222222222', 'Margherita', 'Em Andamento'),
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


INSERT INTO supervisores_funcionarios (id_funcionario, id_supervisor)
VALUES 
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'Marcos'), 4),
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'Patrícia'), 4),
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'Renata'), 4),
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'José'), 4),
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'Luiz'), 4),
    ((SELECT id_funcionario FROM funcionarios WHERE nome = 'Ana'), 4);



INSERT INTO promocoes (nome_promocao, descricao, desconto, data_inicio, data_fim)
VALUES 
    ('Desconto de Verão', 'Desconto de 20% para pizzas de verão', 20.00, '2024-06-01', '2024-09-01'),
    ('Oferta Especial', 'Desconto de 15% em pizzas grandes', 15.00, '2024-05-01', '2024-05-31'),
    ('Promoção de Inverno', 'Desconto de 25% para pizzas de inverno', 25.00, '2024-11-01', '2025-02-28');

INSERT INTO horario_funcionamento (dia_semana, hora_abertura, hora_fechamento)
VALUES 
    ('Segunda-feira', '18:00:00', '23:00:00'),
    ('Terça-feira', '18:00:00', '23:00:00'),
    ('Quarta-feira', '18:00:00', '23:00:00'),
    ('Quinta-feira', '18:00:00', '23:00:00'),
    ('Sexta-feira', '18:00:00', '23:00:00'),
    ('Sábado', '18:00:00', '23:00:00'),
    ('Domingo', '17:00:00', '22:00:00');

ALTER TABLE pizzas
ADD COLUMN id_promocao INT,
ADD FOREIGN KEY (id_promocao) REFERENCES promocoes(id_promocao);

UPDATE pizzas
SET id_promocao = 1
WHERE nome = 'Pizza Especial';

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

-- 8. Listar todos os funcionários com seus respectivos supervisores. Consulta para exibir os funcionários e seus supervisores.
SELECT 
    f1.nome AS funcionario,
    f2.nome AS supervisor
FROM 
    supervisores_funcionarios sf
JOIN 
    funcionarios f1 ON sf.id_funcionario = f1.id_funcionario
JOIN 
    funcionarios f2 ON sf.id_supervisor = f2.id_funcionario;

-- 9. Listar todos os itens de pedidos com seus respectivos tamanhos. Consulta para mostrar os itens de pedidos e os tamanhos das pizzas associadas a eles.
SELECT 
    pedido.id_pedido,
    pizzas.nome AS nome_pizza,
    pizzas.tamanho
FROM 
    pedido
INNER JOIN 
    pizzas ON pedido.id_pizza = pizzas.id_pizza;

-- 10. Listar todas as pizzas com suas respectivas promoções. Consulta para mostrar todas as pizzas e suas promoções.
SELECT 
    p.nome AS nome_pizza,
    p.preco,
    COALESCE(pr.nome_promocao, 'Sem promoção') AS promocao
FROM 
    pizzas p
LEFT JOIN 
    promocoes pr ON p.id_promocao = pr.id_promocao;

-- 2 parte

-- 1. Listar todos os clientes cadastrados. Consulta para recuperar todos os clientes que já fizeram pedidos na pizzaria.

SELECT DISTINCT
    c.nome AS nome_cliente,
    c.email,
    c.cell
FROM 
    contatos c
INNER JOIN 
    pedido p ON c.id_contato = p.id_contato;


-- 2. Listar todos os pedidos realizados em um determinado período. Consulta para visualizar todos os pedidos feitos dentro de um intervalo de datas específico.
SELECT *
FROM pedido
WHERE data_pedido BETWEEN '2024-01-01' AND '2024-12-31';

-- 3. Listar os itens de um pedido específico. Consulta para ver todos os itens (pizzas,bebidas, etc.) em um pedido específico.
SELECT p.nome AS item_pedido, p.preco
FROM pedido pd
JOIN pizzas p ON pd.id_pizza = p.id_pizza
WHERE pd.id_pedido = 5;

-- 4. Calcular o total gasto por um cliente. Consulta para somar o valor de todos os pedidos feitos por um cliente específico.
SELECT c.nome AS cliente, SUM(p.preco) AS total_gasto
FROM contatos c
JOIN pedido pd ON c.id_contato = pd.id_contato
JOIN pizzas p ON pd.id_pizza = p.id_pizza
GROUP BY c.nome;

-- 5. Listar os sabores de pizza mais populares. Consulta para mostrar os sabores de pizza mais pedidos pelos clientes.
SELECT 
    id_pizza,
    COUNT(*) AS total_pedidos
FROM 
    pedido
GROUP BY 
    id_pizza
ORDER BY 
    total_pedidos DESC;


-- 6. Verificar a disponibilidade de um determinado sabor de pizza. Consulta para verificar se um sabor específico de pizza está disponível no momento.
SELECT 
    *
FROM 
    pizzas
WHERE 
    nome = 'Calabresa';


-- 7. Listar todos os funcionários. Consulta para recuperar informações de todos os funcionários da pizzaria.
SELECT *
FROM funcionarios;

-- 8. Verificar o horário de funcionamento da pizzaria. Consulta para saber os horários de abertura e fechamento da pizzaria.
SELECT *
FROM horario_funcionamento;


-- 9. Listar os pedidos em andamento. Consulta para ver todos os pedidos que ainda não foram entregues.
SELECT *
FROM entregas
WHERE situacao= 'Não Entregue';

-- 10. Calcular o tempo médio de espera dos pedidos. Consulta para calcular o tempo médio que os clientes esperam pelos pedidos.
SELECT AVG(EXTRACT(EPOCH FROM (hora_entrega - hora_pedido))) AS tempo_medio_espera
FROM pedido
WHERE status_entrega = 'Finalizado'; -- Selecione apenas pedidos finalizados
-- Criar a tabela de associações entre pizzas e promoções
CREATE TABLE IF NOT EXISTS pizza_promocoes (
    id_pizza INT NOT NULL,
    id_promocao INT NOT NULL,
    PRIMARY KEY (id_pizza, id_promocao),
    CONSTRAINT fk_id_pizza FOREIGN KEY (id_pizza) REFERENCES pizzas (id_pizza),
    CONSTRAINT fk_id_promocao FOREIGN KEY (id_promocao) REFERENCES promocoes (id_promocao)
);

-- Inserir associações de promoções para as pizzas
INSERT INTO pizza_promocoes (id_pizza, id_promocao) VALUES
(1, 1), -- Pizza 1 (Calabresa) com Promoção 1 (Desconto de Verão)
(2, 1), -- Pizza 2 (Margherita) com Promoção 1 (Desconto de Verão)
(3, 2), -- Pizza 3 (Pepperoni) com Promoção 2 (Oferta Especial)
(4, 2), -- Pizza 4 (Frango com Catupiry) com Promoção 2 (Oferta Especial)
(5, 3), -- Pizza 5 (Quatro Queijos) com Promoção 3 (Promoção de Inverno)
(6, 3), -- Pizza 6 (Portuguesa) com Promoção 3 (Promoção de Inverno)
(7, 1), -- Pizza 7 (Bacon) com Promoção 1 (Desconto de Verão)
(8, 2), -- Pizza 8 (Vegetariana) com Promoção 2 (Oferta Especial)
(9, 3), -- Pizza 9 (Calabresa) com Promoção 3 (Promoção de Inverno)
(10, 3); -- Pizza 10 (Margherita) com Promoção 3 (Promoção de Inverno)

-- Inserir dados de exemplo na tabela de pizzas
INSERT INTO pizzas (nome, preco, ingredientes) VALUES
('Calabresa', 25.00, 'Calabresa, queijo, cebola, orégano'),
('Margherita', 22.00, 'Tomate, queijo, manjericão'),
('Pepperoni', 27.00, 'Pepperoni, queijo, molho de tomate'),
('Frango com Catupiry', 30.00, 'Frango, catupiry, milho, ervilha'),
('Quatro Queijos', 28.00, 'Mussarela, gorgonzola, parmesão, provolone'),
('Portuguesa', 26.00, 'Presunto, ovo, cebola, azeitona, ervilha'),
('Bacon', 29.00, 'Bacon, queijo, cebola, molho de tomate'),
('Vegetariana', 24.00, 'Brócolis, milho, ervilha, tomate, cebola'),
('Calabresa Especial', 31.00, 'Calabresa, queijo, cebola, orégano, pimenta'),
('Margherita Gourmet', 33.00, 'Tomate, queijo, manjericão, azeite trufado');

INSERT INTO entregas (id_entregas, nome, email, cel, pizza, cadastro, situacao) VALUES
(1, 'João Silva', 'joao@example.com', '(11) 98765-4321', 'Calabresa', '2024-05-24', 'cancelada'),
(2, 'Maria Santos', 'maria@example.com', '(11) 91234-5678', 'Margherita', '2024-05-24', 'entregue'),
(3, 'Carlos Oliveira', 'carlos@example.com', '(11) 92345-6789', 'Pepperoni', '2024-05-24', 'andamento'),
(4, 'Ana Ferreira', 'ana@example.com', '(11) 93456-7890', 'Frango com Catupiry', '2024-05-24', 'entregue'),
(5, 'Paula Costa', 'paula@example.com', '(11) 94567-8901', 'Quatro Queijos', '2024-05-24', 'entregue'),
(6, 'Pedro Ramos', 'pedro@example.com', '(11) 95678-9012', 'Portuguesa', '2024-05-24', 'cancelada'),
(7, 'Mariana Oliveira', 'mariana@example.com', '(11) 96789-0123', 'Bacon', '2024-05-24', 'andamento'),
(8, 'Fernando Silva', 'fernando@example.com', '(11) 97890-1234', 'Vegetariana', '2024-05-24', 'entregue'),
(9, 'Patrícia Almeida', 'patricia@example.com', '(11) 98901-2345', 'Calabresa', '2024-05-24', 'cancelada'),
(10, 'Lucas Santos', 'lucas@example.com', '(11) 99012-3456', 'Margherita', '2024-05-24', 'entregue');
