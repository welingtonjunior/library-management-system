# Documento de Modelagem do Banco de Dados

## 1. Identificação das Entidades e Relacionamentos

### 1.1 Entidades
- **Livro**
- **Usuário**
- **Empréstimo**

### 1.2 Relacionamentos
- **Usuário** pode emprestar vários **Livros**.
- **Livro** pode ser emprestado por vários **Usuários** (em diferentes momentos).
- **Empréstimo** relaciona um **Usuário** com um **Livro**.

## 2. Definição das Entidades e Atributos

### 2.1 Entidade: Livro
- **ID_Livro** (Primary Key) - Identificador único para cada livro.
- **Titulo** - Título do livro.
- **Autor** - Autor do livro.
- **Genero** - Gênero do livro.
- **Ano_Publicacao** - Ano de publicação do livro.
- **Editora** - Editora do livro.
- **Quantidade_Disponivel** - Quantidade disponível para empréstimo.

### 2.2 Entidade: Usuário
- **ID_Usuario** (Primary Key) - Identificador único para cada usuário.
- **Nome** - Nome completo do usuário.
- **Email** - Endereço de e-mail do usuário.
- **Telefone** - Número de telefone do usuário.
- **Endereco** - Endereço completo do usuário.

### 2.3 Entidade: Empréstimo
- **ID_Emprestimo** (Primary Key) - Identificador único para cada empréstimo.
- **ID_Usuario** (Foreign Key) - Identificador do usuário que fez o empréstimo.
- **ID_Livro** (Foreign Key) - Identificador do livro emprestado.
- **Data_Emprestimo** - Data em que o livro foi emprestado.
- **Data_Devolucao** - Data em que o livro foi devolvido (pode ser NULL se ainda não devolvido).

## 3. Modelo de Entidade-Relacionamento (ER)

```lua
+-------------------+          +------------------+         +------------------+
|       Livro       |          |    Empréstimo    |         |      Usuário      |
+-------------------+          +------------------+         +------------------+
| ID_Livro (PK)     |<-------->| ID_Emprestimo (PK)|         | ID_Usuario (PK)  |
| Titulo            |          | ID_Usuario (FK)   |-------->| Nome             |
| Autor             |          | ID_Livro (FK)     |         | Email            |
| Genero            |          | Data_Emprestimo   |         | Telefone         |
| Ano_Publicacao    |          | Data_Devolucao    |         | Endereco         |
| Editora           |          +------------------+         +------------------+
| Quantidade_Disponivel |
+-------------------+
````
## 4. Implementação no Banco de Dados
### 4.1 Criação das Tabelas
```sql
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
````
## 5. Considerações Adicionais
Integridade Referencial: Garantir que a integridade referencial entre as tabelas seja mantida por meio das chaves estrangeiras.
Normalização: Verificar a normalização do banco de dados para evitar redundância e garantir eficiência.
Backup e Recuperação: Planejar estratégias para backup e recuperação de dados.]

## 6. Ferramentas para Modelagem
MySQL Workbench: Para design visual e execução de SQL.
Microsoft SQL Server Management Studio (SSMS): Para projetos com SQL Server.
pgAdmin: Para projetos com PostgreSQL.
