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
    CREATE TABLE cliente (
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      cpf TEXT NOT NULL
    );
  ''',
];
