CREATE TABLE Materiais (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL
);

CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    id_fornecedor INT NOT NULL,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_material) REFERENCES Materiais(id_material),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

CREATE TABLE Estoque (
    id_material INT PRIMARY KEY,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_material) REFERENCES Materiais(id_material)
);

CREATE TABLE SaidasEstoque (
    id_saida INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    motivo VARCHAR(100),
    FOREIGN KEY (id_material) REFERENCES Materiais(id_material)
);