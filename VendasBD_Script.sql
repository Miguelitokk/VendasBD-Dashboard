-- ========================
-- CRIAÇÃO DO BANCO
-- ========================
USE VendasBD;

-- ========================
-- CRIAÇÃO DAS TABELAS
-- ========================

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY IDENTITY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria INT FOREIGN KEY REFERENCES Categorias(id_categoria)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    estado CHAR(2)
);

CREATE TABLE Vendedores (
    id_vendedor INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    regiao VARCHAR(50)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY IDENTITY,
    id_cliente INT FOREIGN KEY REFERENCES Clientes(id_cliente),
    id_vendedor INT FOREIGN KEY REFERENCES Vendedores(id_vendedor),
    data_pedido DATE NOT NULL
);

CREATE TABLE ItensPedido (
    id_item INT PRIMARY KEY IDENTITY,
    id_pedido INT FOREIGN KEY REFERENCES Pedidos(id_pedido),
    id_produto INT FOREIGN KEY REFERENCES Produtos(id_produto),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

-- ========================
-- INSERÇÃO DE DADOS
-- ========================

INSERT INTO Categorias (nome) VALUES
('Eletrônicos'), ('Roupas'), ('Alimentos'), ('Livros'), ('Esportes');

INSERT INTO Produtos (nome, preco, id_categoria) VALUES
('Smartphone Samsung', 1899.90, 1),
('Notebook Dell', 3499.00, 1),
('Fone Bluetooth', 299.90, 1),
('Camiseta Polo', 89.90, 2),
('Calça Jeans', 149.90, 2),
('Tênis Running', 399.90, 5),
('Whey Protein 1kg', 189.90, 3),
('Azeite Extravirgem', 49.90, 3),
('Clean Code (Livro)', 79.90, 4),
('Bola de Futebol', 129.90, 5);

INSERT INTO Clientes (nome, cidade, estado) VALUES
('Ana Lima', 'São Paulo', 'SP'),
('Carlos Souza', 'Rio de Janeiro', 'RJ'),
('Fernanda Costa', 'Belo Horizonte', 'MG'),
('Roberto Alves', 'Curitiba', 'PR'),
('Juliana Mendes', 'Salvador', 'BA'),
('Paulo Rocha', 'Fortaleza', 'CE'),
('Mariana Dias', 'Porto Alegre', 'RS'),
('Thiago Nunes', 'Recife', 'PE');

INSERT INTO Vendedores (nome, regiao) VALUES
('Lucas Ferreira', 'Sudeste'),
('Camila Oliveira', 'Sul'),
('Diego Santos', 'Nordeste'),
('Patrícia Lima', 'Centro-Oeste');

INSERT INTO Pedidos (id_cliente, id_vendedor, data_pedido) VALUES
(1, 1, '2024-01-05'), (2, 1, '2024-01-12'), (3, 2, '2024-02-03'),
(4, 2, '2024-02-18'), (5, 3, '2024-03-07'), (6, 3, '2024-03-22'),
(7, 4, '2024-04-10'), (8, 4, '2024-04-25'), (1, 1, '2024-05-08'),
(3, 2, '2024-05-19'), (2, 3, '2024-06-03'), (5, 1, '2024-06-15'),
(6, 2, '2024-07-02'), (7, 3, '2024-07-20'), (8, 4, '2024-08-05');

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1899.90), (1, 3, 2, 299.90),
(2, 2, 1, 3499.00),
(3, 4, 3, 89.90), (3, 5, 2, 149.90),
(4, 6, 1, 399.90), (4, 7, 2, 189.90),
(5, 8, 4, 49.90), (5, 9, 1, 79.90),
(6, 10, 2, 129.90), (6, 3, 1, 299.90),
(7, 1, 1, 1899.90), (7, 9, 3, 79.90),
(8, 2, 1, 3499.00), (8, 6, 1, 399.90),
(9, 4, 5, 89.90), (9, 7, 1, 189.90),
(10, 5, 2, 149.90), (10, 10, 1, 129.90),
(11, 1, 2, 1899.90),
(12, 8, 6, 49.90), (12, 6, 1, 399.90),
(13, 3, 3, 299.90), (13, 9, 2, 79.90),
(14, 2, 1, 3499.00),
(15, 7, 3, 189.90), (15, 4, 2, 89.90);
