CREATE DATABASE db_construcao;

USE db_construcao;

CREATE TABLE tb_materiais (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL
);

CREATE TABLE tb_compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    id_fornecedor INT NOT NULL,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_material) REFERENCES tb_materiais(id_material),
    FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedores(id_fornecedor)
);

CREATE TABLE tb_estoque (
    id_material INT PRIMARY KEY,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_material) REFERENCES tb_materiais(id_material)
);

CREATE TABLE tb_saidasestoque (
    id_saida INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    motivo VARCHAR(100),
    FOREIGN KEY (id_material) REFERENCES tb_materiais(id_material)
);

INSERT INTO tb_fornecedores (nome, cnpj) VALUES
('Construlider Materiais', '12.345.678/0001-90'),
('Casa do Construtor', '98.765.432/0001-10'),
('Materiais Brasil', '11.222.333/0001-44');

INSERT INTO tb_materiais (nome, preco_unitario) VALUES
('Cimento CP II 50kg', 35.90),
('Areia Média m³', 120.00),
('Tijolo Cerâmico 9x14x19', 0.85),
('Vergalhão 8mm', 29.50);

INSERT INTO tb_compras (id_material, id_fornecedor, quantidade, data_compra) VALUES
(1, 1, 100, '2025-05-01'),
(2, 2, 10, '2025-05-03'),
(3, 1, 1500, '2025-05-05'),
(4, 3, 50, '2025-05-10');

UPDATE tb_materiais
SET preco_unitario = 38.00
WHERE nome = 'Cimento CP II 50kg';

UPDATE tb_fornecedores
SET cnpj = '99.999.999/0001-99'
WHERE nome = 'Casa do Construtor';

UPDATE tb_estoque
SET quantidade_disponivel = 10000
WHERE id_material = 3;

DELETE FROM tb_saidasestoque
WHERE id_saida = 1;

DELETE FROM tb_fornecedores
WHERE nome = 'Materiais Brasil';

DELETE FROM tb_materiais
WHERE nome = 'Vergalhão 8mm';

SELECT c.id_compra, m.nome AS material, f.nome AS fornecedor, c.quantidade, c.data_compra
FROM tb_compras c
JOIN tb_materiais m ON c.id_material = m.id_material
JOIN tb_fornecedores f ON c.id_fornecedor = f.id_fornecedor;

SELECT m.nome, e.quantidade_disponivel
FROM tb_estoque e
JOIN tb_materiais m ON e.id_material = m.id_material;

SELECT s.id_saida, m.nome AS material, s.quantidade, s.data_saida, s.motivo
FROM tb_saidasestoque s
JOIN tb_materiais m ON s.id_material = m.id_material;
