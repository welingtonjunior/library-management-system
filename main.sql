CREATE TABLE Livro (
    ID_Livro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255),
    Genero VARCHAR(100),
    Ano_Publicacao YEAR,
    Editora VARCHAR(255),
    Quantidade_Disponivel INT DEFAULT 0
);

CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Telefone VARCHAR(20),
    Endereco TEXT
);

CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Livro INT,
    Data_Emprestimo DATE,
    Data_Devolucao DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro)
);
