CREATE DATABASE aula_01_04;

CREATE TABLE IF NOT EXISTS fornecedor (
    fcodigo INT PRIMARY KEY, -- Identificador único para cada fornecedor, não pode ser nulo
    fnome VARCHAR(255) NOT NULL, -- Nome do fornecedor, não pode ser nulo
    status BOOLEAN, -- Status do fornecedor, assumindo que você deseja um indicador booleano (ativo/inativo)
    cidade VARCHAR(255) -- Nome da cidade, pode ser nulo
);

CREATE TABLE IF NOT EXISTS peca (
    pcodigo INT PRIMARY KEY, -- Identificador único para cada peça, não pode ser nulo
    pnome VARCHAR(255) NOT NULL, -- Nome da peça, não pode ser nulo
    cor VARCHAR(50) NOT NULL, -- Cor da peça, não pode ser nulo
    peso DECIMAL(10, 2) NOT NULL, -- Peso da peça, não pode ser nulo. Ajuste a precisão e escala conforme necessário.
    cidade VARCHAR(255) NOT NULL -- Nome da cidade, não pode ser nulo
);


CREATE TABLE IF NOT EXISTS instituicao (
    icodigo INT PRIMARY KEY, -- Identificador único para cada instituição, não pode ser nulo
    nome VARCHAR(255) NOT NULL -- Nome da instituição, não pode ser nulo
);

CREATE TABLE IF NOT EXISTS Projeto (
    PRcod INT NOT NULL PRIMARY KEY, -- Código do projeto, único para cada projeto
    PRnome VARCHAR(255) NOT NULL, -- Nome do projeto, não pode ser nulo
    Cidade VARCHAR(255) NOT NULL, -- Cidade do projeto, não pode ser nulo
    icodigo INT NOT NULL, -- Código da instituição associada, não pode ser nulo
    FOREIGN KEY (icodigo) REFERENCES instituicao(icodigo) -- Define Icod como chave estrangeira que referencia icodigo da tabela instituicao
);

CREATE TABLE IF NOT EXISTS Fornecimento (
    Fcodigo INT NOT NULL, -- Código do fornecedor
    pcodigo INT NOT NULL, -- Código da peça
    PRcod INT NOT NULL, -- Código do projeto
    Quantidade INT NOT NULL, -- Quantidade fornecida
    PRIMARY KEY (Fcodigo, pcodigo, PRcod), -- Define uma chave primária composta
    FOREIGN KEY (Fcodigo) REFERENCES fornecedor(Fcodigo), -- Chave estrangeira referenciando fornecedores
    FOREIGN KEY (pcodigo) REFERENCES peca(pcodigo), -- Chave estrangeira referenciando peças
    FOREIGN KEY (PRcod) REFERENCES Projeto(PRcod) -- Chave estrangeira referenciando projetos
);

-- alterações
ALTER TABLE Fornecedor
    RENAME COLUMN Fcodigo TO Fcod,
    ADD COLUMN Fone VARCHAR(20),
    ADD CONSTRAINT fk_Fornecedor_Cidade FOREIGN KEY (#Ccod) REFERENCES Cidade(Ccod);

CREATE TABLE Cidade (
    Ccod INT PRIMARY KEY,
    Cnome VARCHAR(100),
    uf CHAR(2)
);

ALTER TABLE Peca
    RENAME COLUMN Pcodigo TO Pcod,
    ADD CONSTRAINT fk_Peca_Cidade FOREIGN KEY (#Ccod) REFERENCES Cidade(Ccod);

ALTER TABLE Projeto
    RENAME COLUMN PRcodigo TO PRcod,
    ADD CONSTRAINT fk_Projeto_Cidade FOREIGN KEY (#Ccod) REFERENCES Cidade(Ccod);

ALTER TABLE Fornecimento
    ADD CONSTRAINT fk_Fornecimento_Fornecedor FOREIGN KEY (#Fcod) REFERENCES Fornecedor(Fcod),
    ADD CONSTRAINT fk_Fornecimento_Peca FOREIGN KEY (#Pcod) REFERENCES Peca(Pcod),
    ADD CONSTRAINT fk_Fornecimento_Projeto FOREIGN KEY (#PRcod) REFERENCES Projeto(PRcod);
