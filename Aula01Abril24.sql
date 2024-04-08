CREATE TABLE IF NOT EXISTS fornecedor (
    codigoigo INT PRIMARY KEY, -- Identificador único para cada fornecedor, não pode ser nulo
    fnome VARCHAR(255) NOT NULL, -- Nome do fornecedor, não pode ser nulo
    status BOOLEAN, -- Status do fornecedor, assumindo que você deseja um indicador booleano (ativo/inativo)
    cidade VARCHAR(255) -- Nome da cidade, pode ser nulo
);

CREATE TABLE IF NOT EXISTS peca (
    codigoigo INT PRIMARY KEY, -- Identificador único para cada peça, não pode ser nulo
    pnome VARCHAR(255) NOT NULL, -- Nome da peça, não pode ser nulo
    cor VARCHAR(50) NOT NULL, -- Cor da peça, não pode ser nulo
    peso DECIMAL(10, 2) NOT NULL, -- Peso da peça, não pode ser nulo. Ajuste a precisão e escala conforme necessário.
    cidade VARCHAR(255) NOT NULL -- Nome da cidade, não pode ser nulo
);


CREATE TABLE IF NOT EXISTS instituicao (
    codigoigo INT PRIMARY KEY, -- Identificador único para cada instituição, não pode ser nulo
    nome VARCHAR(255) NOT NULL -- Nome da instituição, não pode ser nulo
);

CREATE TABLE IF NOT EXISTS Projeto (
    Pcodigo INT NOT NULL PRIMARY KEY, -- Código do projeto, único para cada projeto
    PRnome VARCHAR(255) NOT NULL, -- Nome do projeto, não pode ser nulo
    Cidade VARCHAR(255) NOT NULL, -- Cidade do projeto, não pode ser nulo
    codigoigo INT NOT NULL, -- Código da instituição associada, não pode ser nulo
    FOREIGN KEY (codigoigo) REFERENCES instituicao(codigoigo) -- Define codigo como chave estrangeira que referencia codigoigo da tabela instituicao
);

CREATE TABLE IF NOT EXISTS Fornecimento (
    codigoigo INT NOT NULL, -- Código do fornecedor
    codigoigo INT NOT NULL, -- Código da peça
    Pcodigo INT NOT NULL, -- Código do projeto
    Quantidade INT NOT NULL, -- Quantidade fornecida
    PRIMARY KEY (codigoigo, codigoigo, Pcodigo), -- Define uma chave primária composta
    FOREIGN KEY (Fcodigo) REFERENCES fornecedor(Fcodigo), -- Chave estrangeira referenciando fornecedores
    FOREIGN KEY (pcodigo) REFERENCES peca(pcodigo), -- Chave estrangeira referenciando peças
    FOREIGN KEY (PRcod) REFERENCES Projeto(PRcod) -- Chave estrangeira referenciando projetos
);

-- Alterando a tabela Fornecedor
ALTER TABLE fornecedor
RENAME COLUMN fcodigo TO Fcod;

CREATE TABLE Cidade (
    Ccod INT PRIMARY KEY,
    Cnome VARCHAR(100),
    uf CHAR(2)
);


ALTER TABLE fornecedor
ADD COLUMN Fone VARCHAR(20),
ADD COLUMN Ccod INT,
ADD CONSTRAINT fk_Fornecedor_Cidade FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- Alterando a tabela Peca
ALTER TABLE peca
RENAME COLUMN pcodigo TO Pcod;

ALTER TABLE peca
ADD COLUMN Ccod INT,
ADD CONSTRAINT fk_Peca_Cidade FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- Alterando a tabela Projeto
ALTER TABLE Projeto
RENAME COLUMN PRcodigo TO PRcod;

ALTER TABLE Projeto
ADD COLUMN Ccod INT,
ADD CONSTRAINT fk_Projeto_Cidade FOREIGN KEY (Ccod) REFERENCES Cidade(Ccod);

-- Alterando a tabela Fornecimento
ALTER TABLE Fornecimento
ADD CONSTRAINT fk_Fornecimento_Fornecedor FOREIGN KEY (Fcodigo) REFERENCES Fornecedor(Fcod),
ADD CONSTRAINT fk_Fornecimento_Peca FOREIGN KEY (pcodigo) REFERENCES peca(Pcod),
ADD CONSTRAINT fk_Fornecimento_Projeto FOREIGN KEY (PRcodigo) REFERENCES Projeto(PRcod);

ALTER TABLE projeto
DROP CONSTRAINT projeto_icodigo_fkey;

DROP TABLE instituicao;


-- Inserir dados na tabela fornecedor
INSERT INTO fornecedor (fcod, fnome, status, fone, Ccod)
VALUES
    (01, 'Kalunga', true, '1930234066', 11),
    (02, 'LLC Logística', false, '1130245578', 12),
    (03, 'Velho Barreiro', true, '1930324068', 13),
    (04, 'Hyundai', true, '1930224545', 14);


-- Inserir dados na tabela cidade
INSERT INTO cidade (Ccod, Cnome, uf)
VALUES
    (11, 'Limeira', 'SP'),
    (12, 'São Paulo', 'SP'),
    (13, 'Rio Claro', 'SP'),
    (14, 'Piracicaba', 'SP');

-- Inserir dados na tabela peca
INSERT INTO peca (Pcod, Pnome, Cor, Peso, Ccod)
VALUES
    ('0001', 'Processador', 'Padrão', 300, 13),
    ('0002', 'Lona',   'Azul',  12, 11),
    ('0003', 'Cachaça', 'Transparente', 11),
    ('0004', 'Hyundai Creta', 100, 10000);

-- Inserir dados na tabela projeto
INSERT INTO projeto (PRcod, PRnome, Ccod)
VALUES
    (01, 'Eletrônicos', 11),
    (02, 'Mecânicos', 13),
    (03, 'Escolas', 12);


-- Inserir dados na tabela fornecimento
INSERT INTO fornecimento (Fcodigo, Pcodigo, PRcodigo, Quantidade)
VALUES
    (01, '0001', '01', 660),
    (02, '0002', '03', 10),
    (04, '0004', '02', 220);