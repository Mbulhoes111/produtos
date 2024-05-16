CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);


CREATE TABLE AvaliacaoProduto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_usuario INT,
    pontuacao INT,
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produto(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);


CREATE TABLE InformacaoPagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    metodo_pagamento VARCHAR(50),
    total_pago DECIMAL(10, 2),
    data_pagamento TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id)
);


CREATE TABLE ProdutoCategoria (
    id_produto INT,
    id_categoria INT,
    PRIMARY KEY (id_produto, id_categoria),
    FOREIGN KEY (id_produto) REFERENCES Produto(id),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
);


CREATE TABLE Endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    rua VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);


CREATE TABLE InformacaoEnvio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    endereco_entrega_id INT,
    status_envio VARCHAR(50),
    data_envio TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id),
    FOREIGN KEY (endereco_entrega_id) REFERENCES Endereco(id)
);


CREATE TABLE CarrinhoCompra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_produto) REFERENCES Produto(id)
);


CREATE INDEX idx_id_usuario ON Endereco(id_usuario);
CREATE INDEX idx_id_pedido ON InformacaoEnvio(id_pedido);
CREATE INDEX idx_id_usuario_carrinho ON CarrinhoCompra(id_usuario);


CREATE TABLE Desconto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    percentual_desconto DECIMAL(5, 2),
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_produto) REFERENCES Produto(id)
);


CREATE TABLE HistoricoPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_usuario INT,
    status_pedido VARCHAR(50),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);


CREATE TABLE Vendedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE ProdutoVendedor (
    id_produto INT,
    id_vendedor INT,
    PRIMARY KEY (id_produto, id_vendedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id)
);
