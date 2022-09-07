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
    INSERT INTO produto(descricao, precoVenda, precoCompra) VALUES (\"detergente\", 1.20, 0.80)
  '''
];
