final criarBanco = [
  '''
    CREATE TABLE cidade(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL
    );
  ''',
  '''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      cpf TEXT NOT NULL,
      email TEXT,
      cidade_id INTEGER,
      FOREIGN KEY (cidade_id) REFERENCES cidade(id)
    );
  ''',
  '''
    CREATE TABLE produto(
      id INTEGER NOT NULL PRIMARY KEY,
      descricao TEXT NOT NULL,
      precoVenda FLOAT NOT   NULL, 
      precoCompra FLOAT NOT NULL
    );
  ''',
  '''
  CREATE TABLE usuario(
    id INTEGER NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    senha TEXT NOT NULL
  );
  ''',
  '''
    INSERT INTO usuario(nome, senha) VALUES (\"teste\", \"teste\");
  ''',
];
