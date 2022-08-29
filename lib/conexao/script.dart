final criarBanco = [
  '''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      cpf TEXT NOT NULL,
      cidade INTEGER
      FOREIGN KEY (cidade) REFERENCES cidade(id)
    )
  ''',
  '''
    CREATE TABLE produto(
      id INTEGER NOT NULL PRIMARY KEY,
      descricao TEXT NOT NULL,
      precoVenda FLOAT NOT NULL, 
      precoCompra FLOAT NOT NULL
    )
  ''',
];
