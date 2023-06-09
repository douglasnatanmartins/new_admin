--ENTIDADE USUARIOS
DROP TABLE IF EXISTS usuarios;

CREATE TABLE IF NOT EXISTS usuarios (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    situacao INTEGER (2) NOT NULL,
    password VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    telefone VARCHAR(20)
);


DROP TABLE IF EXISTS permisao;

CREATE TABLE IF NOT EXISTS permissao (
    idpermissao INT AUTO_INCREMENT PRIMARY KEY,
    nome_permiosao VARCHAR(255),
    descricao_permissao VARCHAR(255),
    ativo INT (2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS usuario_permisao;

CREATE TABLE IF NOT EXISTS usuario_permissao (
    idusuariopermissao INT AUTO_INCREMENT PRIMARY KEY,
    idusuario INT,
    idpermissao INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario)
    FOREIGN KEY (idpermissao) REFERENCES permissao(idpermissao)
);

-- ENTIDADE ENDEREÇO CLIENTE
DROP TABLE IF EXISTS enderecocliente;

CREATE TABLE IF NOT EXISTS enderecocliente (
    idenderecocliente INT AUTO_INCREMENT PRIMARY KEY,
    idcidade INT NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    cep VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(255),
    situacao INTEGER (2) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idcidade) REFERENCES cidade(id)
);

-- ENTIDADE CLIENTE
DROP TABLE IF EXISTS clientes;

CREATE TABLE IF NOT EXISTS clientes (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    idendereco INT NOT NULL,
    nomeCliente VARCHAR(255) NOT NULL,
    nomefantasia VARCHAR(255),
    tipoCliente INTEGER(1) NOT NULL,
    cpfCnpj VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(50) NOT NULL,
    telefoneadicional VARCHAR(50),
    situacao INTEGER (1) NOT NULL,
    telefoneadicional VARCHAR(255),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idendereco) REFERENCES enderecocliente(idenderecocliente)
);