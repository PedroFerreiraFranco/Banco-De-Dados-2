#Mostar Bds instalados
SHOW DATABASES;
       
#Indicar qual BD será usado
USE agencia3si2023;
       
#Mostrar as tabelas do BD em uso
SHOW TABLES;
       
#Descrever a estrutura de uma tabela específica
DESC cliente;
       
#Inserir um cliente por vez (comando)
#preenchendo apenas campos obrigatórios
INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) VALUES (NULL, "Amanda Carvalho", "036036036-03", "1980-12-23");
INSERT INTO cliente(idCliente, nome, cpf, dataNascimento) VALUES (NULL, "Pedro Augusto Telles", "999036036-03", "1956-06-23");
       
#Inserir vários cliente por vez (comando)
#preenchendo apenas campos obrigatórios
INSERT INTO cliente(idCliente, nome,dataNascimento) 
VALUES (NULL, "Flávia Guimarães","1969-05-25");
       
#Relatório dos clientes em ordem alfabética em ordem decrescente
SELECT * FROM cliente ORDER BY nome DESC;
SELECT * FROM cliente ORDER BY nome ASC;
       
#Descrição da tabela CONTA e inserção de registros
DESC conta;
SELECT * FROM conta;
INSERT INTO conta VALUES (NULL, "Salário", 800.50, "abc123");
INSERT INTO conta VALUES (NULL, "Poupança", 1250.00, "teste");
INSERT INTO conta VALUES (NULL, "Corrente", 3000.00, "senha12");
       
#Mostrar o valor financeiro em poder de agência
SELECT format(SUM(saldo),2) AS Total FROM conta;
       
#Mostrar o menor saldo
SELECT min(saldo) AS "Menor Saldo" FROM conta;
       
#Mostrar o maior saldo
SELECT max(saldo) AS "Maior Saldo" FROM conta;
       
#Mostrar a media dos saldos
SELECT format(avg(saldo),2) AS "Média" FROM conta;
       
#Mostar os dados na conta com maior saldo
SELECT * FROM conta ORDER BY saldo DESC LIMIT 1;
       
#Descrever a teabela de contas vinculadas e inserir dados
DESC contavinculada;
SELECT * FROM contavinculada;
INSERT INTO contavinculada VALUES(1, 1, "2022-12-20");
INSERT INTO contavinculada VALUES(2, 4, "2022-12-20");
       
#Criar um relatório que mostre o nome de cada cliente, o identificador de sua conta com respectivo saldo e a data de abertura da mesma (no formato brasileiro: dia/mês/ano)
SELECT cli.nome AS "Nome", cv.CONTA_idCONTA AS "Conta", con.saldo AS "Saldo", DATE_FORMAT(cv.dataAbertura, "%d/%m/%Y") AS "Data de Abertura" FROM cliente AS cli INNER JOIN conta AS con INNER JOIN contavinculada AS cv ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE 
AND con.idCONTA = cv.CONTA_idCONTA;
       
#Atualizando o telefone do cliente 1
UPDATE cliente SET telefone = "(35)3295-9700" where idCliente = 1;
SELECT * FROM cliente;
       
#Subconsulta para mostrar contas vinculadas de cliente com telefone
SELECT * FROM contavinculada AS cv WHERE cv.CLIENTE_idCLIENTE IN (SELECT cli.idCLIENTE  from cliente as cli WHERE cli.telefone IS NOT NULL);
       
#Mostrar as contas desde que os saldos sejam iguais ou maiores que a média dos saldos
SELECT * FROM conta;
SELECT format(SUM(saldo),2) FROM conta;
select COUNT(*) FROM conta;
SELECT SUM(saldo) / COUNT(*) FROM conta;
       
#Subconsulta
SELECT * FROM conta WHERE saldo >= (SELECT AVG(saldo) FROM conta);
       
#Mostrar as contas vinculadas aos clientes com idade superior a 45 anos
SELECT FLOOR(DATEDIFF(CURDATE(), dataNascimento)/365) AS idade FROM cliente;
SELECT * FROM contavinculada HAVING
(SELECT idCliente FROM cliente WHERE
(SELECT avg(saldo) AS "Média" FROM conta));

SELECT * FROM contavinculada HAVING CLIENTE_idCliente IN (SELECT avg(saldo) AS "Média" FROM conta);

SELECT 
	cliente.idCLIENTE, conta.idCONTA, DATE_FORMAT(contavinculada.dataAbertura,'%d/%m/%Y')
 FROM contavinculada HAVING CLIENTE_idCliente IN 
(SELECT idCliente FROM cliente WHERE
(SELECT avg(saldo) AS "Média" FROM conta));
       
#Relatorio com agrupamento dos saldos pelo tipo de conta
SELECT tipo, SUM(saldo) AS somaSaldo FROM conta GROUP BY tipo;
       
#Relatorio das contas mostrando o tipo e a soma dos respectivos saldos tendo essa soma maior que a media dos saldos
SELECT tipo, SUM(saldo) AS somaSaldo FROM conta GROUP BY tipo HAVING somaSaldo > (SELECT avg(saldo) AS "Média" FROM conta);
       
       
#Subconsulta em aumentar 5 reais o saldo dos clientes de MG
SELECT * FROM cliente;
SELECT * FROM contavinculada;
SELECT * FROM conta;
UPDATE cliente SET rg = "MG 999.999-99" WHERE idCliente = 1;
UPDATE conta SET saldo = saldo + 5 WHERE idConta IN (SELECT CONTA_idConta FROM contavinculada WHERE CLIENTE_idCliente IN 
(SELECT idCliente FROM cliente where rg LIKE "MG%"));

SELECT * FROM cliente WHERE nome like "Pedro%";
       
#Excluir as contas vinculadas dos clientes sem rg
DELETE FROM contavinculada WHERE CLIENTE_idCliente IN (SELECT idCliente FROM cliente WHERE rg IS NULL);
       
#Criar um relatório que mostre o nome de cada cliente,  o identificador de sua conta com respectivo 
#saldo  e a data de abertura da mesma (no formato brasileiro: dia/mês/ano)
SELECT 
	conta.idConta AS "ID da conta",
	cliente.idCLIENTE AS "Nome",
FROM conta
INNER JOIN cliente
	ON conta.idCONTA = cliente.idCLIENTE
INNER JOIN contavinculada
	ON conta.idCONTA = cliente.idCLIENTE;
	
	
SELECT idCONTA, tipo, saldo,PASSWORD(senha) FROM conta;
	    
	CREA USER 'pedro'@'localhost' IDENTIFIED BY '123';
	
SELECT `user`, `host`, IF(LENGTH(password)>0, password, authentication_string) AS `password` FROM `mysql`.`user`;
SHOW GRANTS FOR 'pedro'@'localhost';
REVOKE SELECT  ON TABLE `agencia3si2023`.`conta` FROM 'pedro'@'localhost';
GRANT UPDATE(`senha`)  ON TABLE `agencia3si2023`.`conta` TO 'pedro'@'localhost';
FLUSH PRIVILEGES;


SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='agencia3si2023' AND TABLE_NAME='conta' ORDER BY ORDINAL_POSITION;
GRANT SELECT  ON TABLE `agencia3si2023`.`conta` TO 'pedro'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'milena'@'localhost';

SELECT `user`, `host`, IF(LENGTH(password)>0, password, authentication_string) AS `password` FROM `mysql`.`user`;
SHOW GRANTS FOR 'pedro'@'localhost';
REVOKE SELECT  ON TABLE `agencia3si2023`.`conta` FROM 'pedro'@'localhost';
GRANT UPDATE(`senha`)  ON TABLE `agencia3si2023`.`conta` TO 'pedro'@'localhost';

UPDATE cliente SET cpf = '036.777.666-80' where idCLIENTE = 5;

DELETE from cliente WHERE idCLIENTE = 10;

HELP 'senha12';

SELECT DATE_FORMAT(contavinculada,'%d/%m/%Y')M contavinculada HAVING CLIENTE_idCliente IN 
(SELECT idCliente FROM cliente WHERE
(SELECT avg(saldo) AS "Média" FROM conta));