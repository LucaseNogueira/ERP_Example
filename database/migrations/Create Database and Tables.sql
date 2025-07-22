CREATE DATABASE IF NOT EXISTS erp_example_db;
USE erp_example_db;

-- Tabela de Variacoes (cor, tamanho e etc)
CREATE TABLE IF NOT EXISTS variacoes(
	varid SMALLINT AUTO_INCREMENT PRIMARY KEY,
    varnome VARCHAR(120) NOT NULL,
    varvalor VARCHAR(120) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos(
	proid INT AUTO_INCREMENT PRIMARY KEY,
    pronome VARCHAR(255) NOT NULL,
    propreco DECIMAL(10,2) NOT NULL
);

-- Tabela de Cupons de desconto
CREATE TABLE IF NOT EXISTS cupons(
	cupid INT AUTO_INCREMENT PRIMARY KEY,
    cupcodigo VARCHAR(50) UNIQUE NOT NULL,
    cuptipodesconto ENUM('percentual', 'valor_fixo') NOT NULL,
    cupvalordesconto DECIMAL(10,2) NOT NULL,
    cupvalorminimo DECIMAL(10,2)
);

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS pedidos(
	pedid INT AUTO_INCREMENT PRIMARY KEY,
    pedstatus ENUM('pendente', 'pago', 'enviado', 'cancelado') DEFAULT 'pendente',
    pedsubtotal DECIMAL(10,2),
    pedtotal DECIMAL(10,2),
    pedfrete DECIMAL(10,2),
    pedcep VARCHAR(10),
    pedendereco TEXT,
    pedemail VARCHAR(255),
    peddata DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Estoque (Produtos em Estoque)
CREATE TABLE IF NOT EXISTS estoque(
	estid INT AUTO_INCREMENT PRIMARY KEY,
    proid INT NOT NULL,
    estqtda INT NOT NULL DEFAULT 0,
    FOREIGN KEY (proid) REFERENCES produtos(proid) ON DELETE CASCADE
);

-- Tabela de Estoque e suas Variacoes 
CREATE TABLE IF NOT EXISTS estoque_variacoes(
    estid INT NOT NULL,
    varid SMALLINT NOT NULL,
    PRIMARY KEY (estid, varid),
    FOREIGN KEY (estid) REFERENCES estoque(estid) ON DELETE CASCADE,
    FOREIGN KEY (varid) REFERENCES variacoes(varid) ON DELETE CASCADE
);

-- Tabela de Pedidos e Produtos em Estoque (itens)
CREATE TABLE IF NOT EXISTS pedido_itens(
	pedid INT NOT NULL,
    estid INT NOT NULL,
    pitqtda INT NOT NULL,
    pitprecounit DECIMAL(10,2),
    PRIMARY KEY (pedid, estid),
    FOREIGN KEY (pedid) REFERENCES pedidos(pedid) ON DELETE CASCADE,
    FOREIGN KEY (estid) REFERENCES estoque(estid) ON DELETE CASCADE
);

-- Tabela de Cupons de um Pedido
CREATE TABLE IF NOT EXISTS pedido_cupons(
	pedid INT NOT NULL,
    cupid INT NOT NULL,
    PRIMARY KEY (pedid, cupid),
    FOREIGN KEY (pedid) REFERENCES pedidos(pedid) ON DELETE CASCADE,
    FOREIGN KEY (cupid) REFERENCES cupons(cupid) ON DELETE CASCADE
);