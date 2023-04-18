SELECT * FROM cliente;
DELETE FROM cliente WHERE idCLIENTE>=6;
DESC cliente;

INSERT INTO cliente(idCLIENTE, nome, cpf, dataNascimento)
VALUES(NULL, "Fabiana Silva","999.999.999-99","1970-12-02");

INSERT INTO cliente(idCLIENTE, nome, cpf, dataNascimento)
VALUES(NULL, "André Pacheco","143.387.572-25","2023-03-28");

INSERT INTO cliente(idCLIENTE, nome, cpf, dataNascimento)
VALUES(NULL, "Gustavo Alves","279.467.256-24","2004-12-05");

INSERT INTO cliente(idCLIENTE, nome, cpf, dataNascimento)
VALUES(NULL, "Salomão Júnior","545.254.476-34","2003-07-05");

INSERT INTO cliente(idCLIENTE, nome, cpf, dataNascimento)
VALUES(NULL, "Pedro Franco","575.866.541-14","2003-12-27");

#criação de uma tabela virtual VIEW para ordenar os clientes em ordem alfabetica crescente
CREATE VIEW v_ ClienteOrdemCrescente AS
(SELECT * FROM cliente ORDER BY nome);

SHOW TABLES;

SELECT * FROM v_clienteordemcrescente;

#mostrar id, nome e telegone dos clientes que possuem essa informação(telefone)
SELECT idCLIENTE, nome, telefone FROM cliente WHERE telefone IS NOT NULL;

CREATE VIEW agenda1 AS(SELECT idCLIENTE, nome, telefone FROM cliente WHERE telefone IS NOT NULL);

RENAME TABLE agenda1 TO v_agenda1;

