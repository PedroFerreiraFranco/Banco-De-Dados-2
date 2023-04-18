/*Transação para colocar os nomes dos clientes em letras MAIUSCULAS desde que possuam telefone cadastradado*/

SELECT * FROM cliente;

BEGIN;
	UPDATE cliente SET nome = UPPER(nome) WHERE telefone IS NOT NULL;
	SELECT * FROM cliente;
 COMMIT;
SELECT * FROM cliente;
